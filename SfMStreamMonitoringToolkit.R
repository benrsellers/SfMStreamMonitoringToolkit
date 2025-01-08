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

### Start Fill in Data ###
dsm_raster_path <- file.path("") # Required
upstream_downstream_points_path <-NA # Required
centerline_path <- file.path("") # Required
channel_path <- file.path("") # Required
output_folder_path <- file.path("") # Required
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