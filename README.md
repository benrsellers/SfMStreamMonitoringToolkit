# SfM Stream Monitoring Toolkit

The **Stream Monitoring Toolkit** is a set of tools designed to calculate stream and channel metrics using drone imagery processed with structure from motion (SfM) software. The result of running this tool includes extracting elevation data, calculating channel area, computing stream gradients, and more, for use in environmental and hydrological analysis.

## Features

- Extract elevation values of upstream and downstream study reach boundaries from a processed digital surface model (DSM) raster.
- Calculate stream gradient, channel area, sinuosity index, and more.
- Outputs results in a structured CSV file for easy integration with other workflows.

### 1. **Stream Gradient Calculation**
Calculates the elevation difference between upstream and downstream points divided by the centerline length.

**Visual Example:**
![Stream Gradient Calculation]("img/GradientCalculation.png")

---

### 2. **Channel Area Measurement**
Measures the area of the stream channel using provided shapefiles.

**Visual Example:**
![Channel Area Measurement](path/to/channel_area_example.png)

---

### 3. **Sinuosity Index**
Calculates the sinuosity index, which is the ratio of the centerline length to the straight-line distance between upstream and downstream points.

**Visual Example:**
![Sinuosity Index Calculation](path/to/sinuosity_index_example.png)

---

### 4. **Straight-Line Distance**
Determines the shortest distance between upstream and downstream points using their coordinates.

**Visual Example:**
![Straight-Line Distance](path/to/straightline_distance_example.png)

---

### 5. **Composite Output**
Generates a CSV summarizing all calculated metrics, making it easy to analyze and compare different sites.

**Visual Example:**
![Composite Output](path/to/csv_output_example.png)

---
---

## Requirements

- **R** (tested with version >= 4.0.0)
- **terra** R package (install using `install.packages("terra")`)

---

## Inputs

### Required Files
1. **Digital Surface Model (DSM):** GeoTIFF file containing elevation data.  
   Example: `LowerElkhorn_250ft_DEM.tif`
   
2. **Upstream and Downstream Points:** Shapefile marking upstream and downstream boundary points of the stream.  
   Example: `LE_updatedreachpoints.shp`
   
3. **Channel Centerline:** Shapefile of the stream’s centerline.  
   Example: `LE_centerline01082025.shp`
   
4. **Channel Polygon:** Shapefile of the stream’s channel area.  
   Example: `LE_channel01082025.shp`

### Other Inputs
- **Imagery Date:** Date of the drone imagery acquisition (format: `MM/DD/YYYY`).  
- **Site Name:** Identifier for the study site.  
- **Output Folder Path:** Path to save results and outputs.

---

## Outputs

- **CSV File:** A structured log of stream and channel measurements, saved as `SfMStreamToolkit_Measurments.csv` in the specified output folder.  
  Includes:
  - Elevation Difference
  - Channel Length
  - Channel Area
  - Gradient Percentage
  - Sinuosity Index
  - Straightline Distance

---

## Setup

1. Clone or download this repository.
2. Install the required R packages:
   ```R
   install.packages("terra")
