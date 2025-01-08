########################################################################

# Stream Monitoring Toolkit
# Ben Sellers

# Step 1 uses RGB and DSM/DTM layers from processed drone imagery 
# to calculate vegetation indices and terrain metrics and creates a composite for 
# use in supervised classification. 

# General scripts steps include:
# 1. 

# INPUTS
# 1: 

# OUTPUTS
# 1.

########################################################################

# Install necessary packages
#install.packages("terra")

# Load libraries
library(terra)

# ----------------------------------------------------------------------
### Start Fill in Data ###
dsm_raster_path <- file.path("D:/CoveringGround/CSU_Beaver/GeocloudProducts/LowerElkhorn/RGB/LowerElkhorn_250ft_DEM.tif") # Required
upstream_downstream_points_path <-("D:/CoveringGround/CSU_Beaver/shp/channel_extent/LowerElkhorn/LE_updatedreachpoints.shp") # Required
centerline_path <- file.path("D:/CoveringGround/CSU_Beaver/shp/channel_extent/LowerElkhorn/LE_centerline01082025.shp") # Required
channel_path <- file.path("D:/CoveringGround/CSU_Beaver/shp/channel_extent/LowerElkhorn/LE_channel01082025.shp") # Required
output_folder_path <- file.path("D:/CoveringGround/CSU_Beaver/shp/channel_extent/LowerElkhorn/SfMMeasurements") # Required
imagery_date <- "06/17/20204"
site_name <- "LowerElkhorn"
### End Fill in Data ###

# ----------------------------------------------------------------------

###################################################
### Step 0: Setup file paths and output folders ###         
###################################################

# Create the outputs folder
if (!dir.exists(output_folder_path)) {
  dir.create(output_folder_path, recursive = TRUE)
  cat("Folder created successfully at", output_folder_path)
} else {
  cat("Folder already exists at", output_folder_path)
}

#############################
###   Step 1: Gradient    ###
#############################

# Read in SfM derived Digital Surface Model
drone_dsm <- rast(dsm_raster_path)

# Read in upstream and downstream boundary points
boundary_points <- vect(upstream_downstream_points_path)

# Read in Channel Centerline
centerline <- vect(centerline_path)

# Extract elevation of upstream and downstream boundary points from dsm
extracted_gradient_points <- terra::extract(drone_dsm, boundary_points, ID=F)
elevation_dif <- abs(extracted_gradient_points[1,1]-extracted_gradient_points[2,1])

# Calculate length of centerline
centerline_length <- perim(centerline)

# Calculate Gradient
stream_gradient <-elevation_dif / centerline_length
stream_gradient

#################################
###   Step 2: Channel Area    ###
#################################

# Read in channel polygon
channel_poly <- vect(channel_path)
channel_poly

# Calculate Channel Area
channel_area <- expanse(channel_poly)
channel_area

########################################
###   Step 3: Write outputs to csv   ###
########################################

# spreadsheet for logging model runs and corresponding parameters
results_path <- file.path(output_folder_path, paste0(site_name,"_SfMmeasurments.csv"))


# Check if the file already exists
if (!file.exists(results_path)) {
  
  # Create a new CSV with sample data or an empty one
  data <- data.frame(
    Date = character(),
    Site = character(),
    ElevationDifference = numeric(),
    ChannelLength = numeric(),
    Gradient_percent = numeric(),
    ChannelArea = numeric(),
    units = character()# Ensure the square meter symbol is handled correctly
  )
  
  # Write to CSV without row names and ensure the column names are exactly as intended
  write.table(data, results_path, sep = ",", col.names = TRUE, row.names = FALSE, quote = TRUE, fileEncoding = "UTF-8")
  cat("File created:", results_path, "\n")
  
} else {
  cat("File already exists:", results_path, "\n")
}

# Create the new row to be appended to the CSV file
new_row <- data.frame(
  Date = imagery_date,  # Ensure proper column name and matching case
  Site = site_name,
  ElevationDifference = elevation_dif,
  ChannelLength = centerline_length,
  Gradient_percent = stream_gradient*100,
  ChannelArea = channel_area,
  units = "m" 
)

# Append the new row to the existing CSV
write.table(new_row, results_path, append = TRUE, sep = ",", col.names = FALSE, row.names = FALSE, quote = TRUE, fileEncoding = "UTF-8")

cat("New row added to file:", results_path, "\n")


# Write Row to table
