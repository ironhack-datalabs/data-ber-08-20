![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Final Project: Comprehensive Data Analytics Project

## Table of Content

**[Overview](#overview)**

**[Project Instructions](#project-instructions)**

* [Phase 1](#Phase-1)
* [Phase 2](#Phase-2)
* [Phase 3](#Phase-3)
* [Phase 4](#Phase-4) (OPTIONAL)

**[Necessary Deliverables](#necessary-deliverables)**

**[Presentation Guideline and Criteria](#presentation-guideline-and-criteria)**

**[5 Tips for Successful Completion](#5-tips-for-successful-completion)**

---

## Overview

The goal of this project is to give you an opportunity to demonstrate the skills you have built throughout this program. In this project, you will use Python, SQL, and Tableau to put together a complete analytics workflow, including:

* Data acquisition
* Data wrangling
* Data storage
* Data exploration and analysis
* Statistical Modelling
* Feature selection
* Machine learning model training
* Model evaluation
* Reporting and presentation of insights

The final project is structured into 2 weeks in which you build up your deliverables progressively and iteratively. We have provided a list of data sets for you to choose from. However, you are encouraged to obtain your own data sets. Using the knowledge you have acquired and your experience working with data, you will come up with a plan for what you are going to do and then design the project around the data set you have chosen.

**You can work individually or in self organized groups of up to 4**. We'll be guiding you along the process and helping you as you go. You will be working on this project over the course of 2 weeks. The proposed progression is listed below. Use it as a guideline to keep your work structured but if you feel like you have a working flow, feel free to manage the project however you think works best.
Remember, however, that data analysis is iterative. So from time to time you may need to step back to a previous phase and iterate. It is advised that you start with a small and reasonable scope, finish it and continuously re-iterate. 

### Phase 1 - Brain Storming and Data Preparation

* Idea generation & planning
* Data gathering & cleaning
* Data storage

Identify topics of interest and see if there is available data. Ideally, formulate questions you want to answer. If someone asks you what you are working on, you should be able to easily answer in one sentence.

### Phase 2 - Exploratory Data Analysis

* Data exploration
* Data visualization
* Data transformation

Start exploring and getting familiar with the available data. Try to narrow the scope of your intial questions to what may be possible to further look into or answer given the data you have or can get in addition.

### Phase 3 - Data Analysis First Iteration

ML:

* Feature selection
* Model training and evaluation
* Model evaluation

Analysis:

* Formulate clear hypotheses / research questions
* Test your hypotheses / questions
* Come up with compelling stories


### Phase 4 - Data Analysis More Iterations (OPTIONAL)

ML:

* Iterations on your modeling
* Model evaluation and comparison
* Prepare for presentation

Analysis:

* Investigate additional questions
* Pick the most interesting findings
* Create your story

---

## Project Instructions

### Phase 1

On the first day of your project, you will be planning your project, exploring datasets and generating ideas. Ideally, you come up with a game plan on what you want to accomplish in the following three days. Aim to finish a first, minimal iteration in the shortest amount of time possible so that you can quickly dig further or discard initial ideas. Make sure to book some time with one of the teaching staff to get quick feedback on feasibility of your project idea.

To get started, here are a few publicly available data sets:

* [Telecom Customer Churn Data Set](https://www.kaggle.com/blastchar/telco-customer-churn)
* [Mental Health in Tech Survey Data Set](https://www.kaggle.com/osmi/mental-health-in-tech-survey)
* [Flight Delays and Cancellations Data Set](https://www.kaggle.com/usdot/flight-delays)
* [Craft Beers Data Set](https://www.kaggle.com/nickhould/craft-cans)
* [Human Resources Data Set](https://www.kaggle.com/rhuebner/human-resources-data-set)

These are all Kaggle data sets, so you can gain some context about them by looking at the field descriptions and the *Overview* tab for each data set. You can also get project ideas by looking at the different *Kernels* that people have created using the data sets and the approaches they have taken, but please **do not plagiarize or copy someone else's work.** Remember that the goal of this project is to demonstrate *your* skills, not someone else's.

You are free to use other data sources from [Kaggle](https://www.kaggle.com), [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets.html), [data.gov](https://www.data.gov/), public APIs, websites, etc.

#### Project Ideas

As you are evaluating the data sets and deciding which you would like to use for your project, think about the different types of information that could be extracted from each one and what problems you could potentially solve. You are not required to use machine learning. It is totally fine if you are more of a business-focused person and use Tableau to extract business intelligence from the data. It is also fine if you are more of a traditional data analyst and primarily conduct statistical analysis on your data. But challenging your own limit is always beneficial.

Below are some ideas for the data sets we selected for you which can help get you started with these data sets.

##### Telecom Customer Churn

This data set is great for practicing supervised machine learning. The most obvious supervised learning problem to model with this data set is attempting to predict churn (whether or not a customer is going to leave). Another supervised problem you can try to solve is predicting tenure, or how long a customer will end up staying with the company. There are also a lot of ways to slice, dice, and analyze this data set - for example, looking at how monthly charges increase or decrease depending on different types of contract, tenure, and services provided.

##### Mental Health in Tech

This data set is also good for supervised learning, where you would attempt to predict the whether the employee taking the survey has received treatment for mental health (treatment variable). You can also analyze how the other variables in the data set contribute to whether someone seeks treatment for mental health and explore what types of environments result in employees with the best mental heath states.

##### Flight Delays and Cancellations

This relational data set can help you practice your SQL joins as well as supervised learning as you attempt to predict which flights will be delayed and by how much time. There are also a variety of ways to explore this data set to determine which airlines are most efficient, what times of day there tends to be the most delays, which cities have more frequent delays than others, and how all this changes over time.

##### Craft Beers

This relational data set has fewer variables than the others, and that means that choosing it for your project will require you to apply some extra creativity. For example, you can create categorical variables out of the numeric abv and ibu variables to categorize a beer's strength and hopiness. You can also use  string operations on the style field to extract additional keyword-based categories (e.g. IPAs, American, English, Wheat, etc.). For modeling, you can attempt to predict the style of the beer or the probability that it falls into a particular style. Alternatively, you can attempt to compute similarity between beers to determine which ones are most like which other ones.

##### Human Resources

This is another relational data set where you can practice your SQL joins as well as data wrangling, analysis, and machine learning. As far as applying machine learning to this data set, you can attempt to cluster employees together into similar groups, you can attempt to predict performance scores or pay rate, or you can attempt to predict whether an employee will be terminated within a certain amount of time. Additionally, you can also analyze the relationship between pay and performance by position, department, and manager as well as employee demographics.

Once you have chosen a data set, you will need to download it. In order to do so, you will need to create a free Kaggle account if you don't already have one. Once you have downloaded the data, you should perform the steps below:

* Create a new MySQL database where your data will eventually be stored.
* Create a new Jupyter Notebook for your project.
* In the Jupyter Notebook, read the data files using Python.
* Perform any necessary data wrangling and cleaning using Python.
* Create a connection to your MySQL database using `pymysql` and `sqlalchemy` and write the clean version of the data to the database.

#### Additional Ideas

##### Analyze Your Own Facebook Data

Do you know you can download your own Facebook data to your harddisk? You can use this data to do social network analysis or visualize your friendships.

**Warning: Downloading your Facebook data takes a lot of time.** You need to first request your data in your Facebook account. Then Facebook will prepare your data for you to download as a ZIP file. If you request all your data (e.g. posts, photos, likes, friends, places, etc.), it takes at least a whole day for Facebook to get your data ready. But instead of requesting all your data, you can also request only the categories you want to analyze such as friends and places, which takes significantly less time. In either case, request your data as early as you can so that you can have the data before the project week begins.

Besides, when you request your data from Facebook, choose if you would like the data to be in JSON or HTML format. It's a strategic choice depending on what topic you want to work on for your final project. If you request JSON, you will be able to focus on data visualization and analysis. If you request HTML, the data may be more suitable for natural language processing but you will need to spend time on parsing the HTML data.

Resources:

[Accessing & Downloading Your Facebook Information](https://www.facebook.com/help/1701730696756992)

[How to Visualize Your Facebook Network](https://linkurio.us/blog/how-to-visualize-your-facebook-network/)

[Facebook Social Network Analysis](http://www.fmsasg.com/socialnetworkanalysis/facebook/)

##### Web Scraping

The web is a free source of unlimited data. There are Wikipedia, Google Maps, YouTube, Amazon, and countless content you can download and dig. General advise? Choose a website you know well and are concerned about. Use API instead of HTML data if you can.

Resources:

[What are some interesting web scraping projects you have done](https://www.quora.com/What-are-some-interesting-web-scraping-projects-you-have-done)

[Web Scraping: Top 15 Ways To Use It For Business](https://www.agenty.com/docs/blog/39/web-scraping-top-15-ways-to-use-it-for-business)

##### Data Visualization

In addition to your Facebook data, there are tons of other data visualizaiton ideas. You can visualize virtually everything such as people, animals, countries, products, music, weather, Github, etc.

Resources:

[15 Data Visualizations That Will Blow Your Mind](https://blog.udacity.com/2015/01/15-data-visualizations-will-blow-mind.html)

[80 Data Visualization Examples Using Location Data and Maps](https://carto.com/blog/eighty-data-visualizations-examples-using-location-data-maps/)

##### Even More

[24 Ultimate Data Science Projects To Boost Your Knowledge and Skills](https://www.analyticsvidhya.com/blog/2018/05/24-ultimate-data-science-projects-to-boost-your-knowledge-and-skills/)

[What are some good data science projects?](https://www.quora.com/What-are-some-good-data-science-projects)

### Phase 2

On the second day of your project, you will start with preparing your data. You will explore, analyze, and visualize the data using Python or Tableau, applying the variety of techniques you learned throughout the program.

Make sure to categorize your notebooks in logical groups. Make it a habit to add comments in code cells or markdown cells so that you always remember what you have done. Invest time in staying organized, your future self will thank you later. Summarize your findings and don't be scared to discard things that don't help you in moving forward.

### Phase 3

In this phase, you should be finalizing the first iteration of your project. Ideally, this is still within the first week so that you have enough time to re-iterate, improve, dig deeper and prepare your final presentation.

You will be using the analysis you performed and the insights you discovered in the previous day to help frame your machine learning problem, select and engineer appropriate features, train your models, and evaluate performance.

* If you are planning on doing supervised machine learning, identify the target variable you would like to train a model to predict. Also determine whether you will be doing regression (target variable is continuous) or classification (target variable is discrete).
* Perform feature selection/engineering to arrive at the features you feel best represent the problem you are trying to solve. During this stage, you may need to normalize or scale your variables.
* Train a couple machine learning models on the data.
* Evaluate the performance of the models.
* Prepare a presentation of your findings and results.

If you're not working on a machine learning problem, identify the meaningful insights or learnings that you generated that you want to keep focusing on in the following days. This is a good point to list and reflect on everything you collected so far and to rank them based on what could create a compelling story.

* Summarize your analyses
* Add statistics and visualizations
* Sketch a story around your points

Once you reach this point, ask fellow students, friends or teaching staff for feedback and ideas to dig deeper.

### Phase 4 (OPTIONAL)

At this point, you should have a clear idea of where you want to go. You should spend the remaining days refining your machine learning models and your presentation. Spend some time to get a deeper understanding of the algorithms or statistical methods you are using and how your work could be improved. Think about how you can best present your project to a wide audience so that they take away what the essence of your project is.

ML:

* Continue iterating on your machine learning models with the objective of optimizing their performance.
* Organize your machine learning steps into a pipeline that performs feature selection/engineering, model training, model evaluation, and model storage.
* Further refine your presentation based on additional findings and results.

Analysis:

* Create stories around your key points
* Pick the most suitable visualizations to support your stories
* Identify easy-to-grasp examples to put your findings in perspective

## Necessary Deliverables

A [Final Project Template](final-project-template.md) has been prepared for you to document and report your final project. You can use the structure in that template to prepare your report or presentation. But you are not limited to the Markdown file format as long as you follow the structure prescribed in the template.

The following deliverables should be pushed to your Github repo.

* A (or multiple) Jupyter Notebook (.ipynb) file(s) containing all your Python code.
* A data folder containing your original datasets and your clean datasets.
* Your final project presentation created from the template.

## Presentation Guideline and Criteria

### Format

* Presentation Time: 5 minutes
* Q & A: 3 minutes
* **Total Time:** 8 minutes
* Google Slides

### Attire

* Wear whatever you feel comfortable with

### Outputs

* A presentation in Google Slides
* A demo deployed on GitHub Pages (ML app)
* The presentation and demo will be executed on a class computer (instead of your own)
* Get ready to explain some of your code in GitHub

### Things you might want to talk about

* Short presentation of yourself:
	* Who are you?
  * __Note: we are getting you ready for final presentation!__
* Elevator pitch:
  * What is it about?
  * Why should the audience care?
  * What do you want the audience to take away?
  * Tell your story!

Optional:

* One technical challenge you faced:
  * Explain the challenge.
  * Explain how and what you did to overcome it.
  * Show and explain code snippets in your presentation slides.
* Git:
  * Display a screenshot of your GitHub graphs to show your commit frequency and how much work you did.
* Final Project Walkthrough:
  * Walk the audience through the data set you chose, providing an overview of some of the fields and other information contained in the data.
  * Walk the audience through your process of cleaning, exploring, analyzing, and performing machine learning on your data including what tools and techniques you employed, what avenues you decided to pursue and why, what interesting insights you discovered, and what lessons you learned.

Below are a few videos of the Ironhack Hackshow where our graudates presented their final projects. Take a quick look on how our past students presented their projects.

* [Web Dev final project demo](https://www.youtube.com/watch?v=MnUxEL3iiig)
* [UX/UI final project demo](https://www.youtube.com/watch?v=oII8I2nl7WM) 
* [Hackshow diciembre 2017 - Madrid](https://www.youtube.com/watch?v=64Jav707V9E) (Spanish)

## 5 Tips for Successful Completion

* Generate a project idea that solves a data problem with practical values. Make sure the problem you try to solve is clearly defined. Make sure the scope of the problem is manageable so that you can complete within the project timeframe. Meanwhile, think beyond the problem itself - can your solution of the problem inform how to solve other bigger/deeper problems?

* Obtain timely feedback on your ideas, plans, progress, and products from the instructional staff. This ensures you stay on the right track and deliver impressive results.

* Be prepared for technical difficulties. Manage your time wisely and pace yourself. Stick to the project agenda strictly.

* Commit your codes and push to Github on regular basis. You should commit every time you complete a task and push at least once a day. This will help you avoid accidential data loss and is also the easiest way to document your iterative development process.

* Before final project presentation, test every component and step of your demo. Make sure your demo will run smoothly.

## May the force be with you!
