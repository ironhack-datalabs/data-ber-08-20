![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | Introduction to Tableau

## Introduction

In this lab, we will practice loading data into Tableau, inspecting and modifying data types, and creating tabular views with metrics based on the information contained in the data set. We will be working with a COVID-19 dataset compiled from [John's Hopkins data](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data) and found in the data folder.

If you get stuck on any of the tasks in this lab, you can reference the excellent training video resources provided on the [Tableau website](https://www.tableau.com/learn/training).

## Getting Started

To complete this lab, follow each of the steps below.

1. Download the clean-covid-data.csv file from the data folder.
2. Launch the Tableau Public application.
3. Import the data set from your computer into Tableau.
4. Create new worksheets with tabular views for each of the following metrics:
    
    a. You want a quick view of the current situation of confirmed cases, but only for top countries.  After playing with the country filter you've found that countries with more than 50,000 confirmed cases comprise the top 9.  Now you can use this filter to make a histogram with total confirmed cases(rows) for countries with more than 50,000 cases (columns) with color showing total deaths.
    
    b. Now that you have an overview, you want a bit more information on all countries that have at least 10,000 confirmed cases.  So you plot confirmed cases (bubble size), total deaths (bubble color) and median age in a Packed Bubble Chart with labels for each country with greater than 50,000 cases.
    
    c. You still don't know about the confirmed cases and death count in relation to the recovered case count.  So, you create a histogram with countries and 3 side-by-side measures including total confirmed cases, total deaths, total recovered (columns) and those measured values on the y-axis.
    
    d. The absolute numbers do not tell you how the number of confirmed cases have accumulated over time.  For this you create a line plot for all countries (color) with greater than 50,000 cases with "Days Since First 100 Cases" on the x-axis and accumulated confirmed cases on the y-axis.  Include an animation to plot the data day by day.
    
    e. Now you can look at the other measures over time using a lineplot with cumulative measures including total confirmed, total deaths and total recovered (rows) each day (columns).
    
    f. Since you have an impression of how the cases, recoveries and deaths have developed since the outbreak began, now you want to get an impression of how the recovery rate may vary across countries since each country is at a different stage of the outbreak.  You can quickly survey by plotting these on a map.  First, create a calculated field for the Recovery Rate in % and then use a colored map to visualize it (include labels when a country is selected).
   
    g. You can do the same for the death rate to see how it varies across countries that are at different stages of the outbreak.  Create a calculated field for the Death Rate in % and then use a colored map to visualize it (include labels when a country is selected.
    
    h. Now in the process of exploring the data, what question do you have?  What data is available to answer that question  what would be an appropriate visualization?  Create your visualization.
    
    i. BONUS: It would be nice to use parameters to create a drop down menu that switches between Death Rate and Recovery Rate on one map to minimize the number of visualizations we have.  Use these resources on [swapping measures using parameters](https://help.tableau.com/current/pro/desktop/en-us/parameters_swap.htm) and [using parameters to make views more interactive](https://help.tableau.com/current/pro/desktop/en-us/changing-views-using-parameters.htm) to guide you with an example.
    
6. Save your work to Tableau Public, ensure that your workbook is viewable, and copy the URL for the workbook into the deliverables file for this lab. It might take several minutes for this workbook to save to Tableau Public due to the number of records in the data set.

## Deliverables

- `main.txt` file with a link to your Tableau Public workbook.

## Submission

Upon completion, add your deliverables to git. Then commit git and push your branch to the remote.

## Resources

- [Tableau Training Videos](https://www.tableau.com/learn/training)
