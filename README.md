# SfM Stream Monitoring Toolkit

The **Stream Monitoring Toolkit** is a set of tools designed to calculate stream and channel metrics using drone imagery processed with structure from motion (SfM) software. The result of running this r script includes extracting elevation data, calculating channel area, computing stream gradient, and calculating the streams sinuosity index, for use in environmental and hydrological analysis and monitoring.

Many of these calculations are available in a user friendly QGIS plugin created by the Riverscapes Consortium - found here (https://qris.riverscapes.net). The QRIS tool offers a graphical user inerface to keep track of LTPBR monitoring data over time.

The SfM Monitoring Toolkit aims to provide a no frills programmatic approach to calculating useful stream metrics from drone imagery, for use in stream restoration prioritization and monitoring over time. This tool can be easily automate the calculation of stream metrics for a beginner to intermediate R user - leaving the visualization and analysis of results up to you. 

Please dont hesitate to reach out with questions regarding the use of this tool or ideas for updates!
email: ben.sellers@cgmapping.com


## Features

- Extract elevation values of upstream and downstream study reach boundaries from a processed digital surface model (DSM) raster.
- Calculate stream gradient, channel area, sinuosity index, and more.
- Outputs results in a structured CSV file for easy integration with other workflows.

### 1. **Measure Channel Area**
Measures the area of the stream channel using provided shapefiles.

**Visual Example:**
![Channel Area Measurement](https://github.com/benrsellers/SfMStreamMonitoringToolkit/blob/main/img/AreaCalculation.png)

---
### 2. **Calulate Stream Gradient**
Calculates the elevation difference between upstream and downstream points divided by the centerline length.

**Visual Example:**
![Stream Gradient Calculation](https://github.com/benrsellers/SfMStreamMonitoringToolkit/blob/main/img/GradientCalculation.png)

---

### 3. **Calculate Sinuosity Index**
Calculates the sinuosity index, which is the ratio of the centerline length to the straight-line distance between upstream and downstream points.

**Visual Example:**
![Sinuosity Index Calculation](https://github.com/benrsellers/SfMStreamMonitoringToolkit/blob/main/img/SinuosityCalculation.png)


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
