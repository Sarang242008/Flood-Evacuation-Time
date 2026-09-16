# Flood-Evacuation-Time
MATLAB simulation modeling flood evacuation time sensitivity w.r.t population density and open routes using partial differentiation and Excel integration.
# Flood Evacuation Time Sensitivity Analysis

A mathematical modeling and simulation project evaluating the sensitivity of flood evacuation times ($U$) with respect to population density ($x$) and available open evacuation routes ($y$) using partial differentiation and MATLAB data integration.

## Problem Statement
This project addresses disaster-response logistics by analyzing how evacuation times respond to changes in population density versus route availability across real-world regional flood scenarios.

## Mathematical Model
- **$x$**: Population Density ($\text{people/km}^2$)
- **$y$**: Number of Open Evacuation Routes
- **$U(x, y)$**: Evacuation Time function (hours)

$$U(x, y) = \frac{x^2}{y} + 3\left(\frac{x}{y}\right)$$

### Partial Derivatives
- $\frac{\partial U}{\partial x}$: Sensitivity of evacuation time w.r.t population density (holding routes constant).
- $\frac{\partial U}{\partial y}$: Sensitivity of evacuation time w.r.t open evacuation routes (holding density constant).

## How to Run
1. Clone or download this repository.
2. Open `Flood P.m` in MATLAB or MATLAB Online.
3. Ensure `flood_data.xlsx` is present in the working directory.
4. Run the script to calculate partials and export results to `flood_analysis_output.xlsx`.

## Repository Files
- `Flood P.m` - Main MATLAB implementation script.
- `flood_data.xlsx` - Input historical flood dataset.
- `flood_analysis_output.xlsx` - Output table containing calculated partial derivatives.
- `Flood_Time.pdf` - Project blueprint and work division plan.
