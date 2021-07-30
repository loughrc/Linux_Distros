# Desktop Linux Distributions: Database building and Data Visualisation

## Introduction:

While servers running on Linux are commonplace and Android for mobile phones is built upon Linux architecture, desktop versions of the operating system have failed to break into the mainstream of the established offerings by Microsoft, Apple, and more recently, Google, despite Google's ChromeOS also being based on Linux architecture. The existence of over 600 independent versions of the OS (known as distributions, or for short, distros), however, is fascinating and tells us that while these versions of the OS are not mainstream, there is certainly a market for them worldwide. 

The first part of this project shows the creation of a relational database from the ground up, using data regarding Linux distros in one table, information about Desktop Environments in another, and another including information about the computers I own and the distros that run on each computer. The second part of this project uses just the Linux distro table, which we use to glean insights from this data through visualisation on a Tableau Dashboard, which can be viewed [here](https://public.tableau.com/app/profile/conor.loughran/viz/MostPopularLinuxDistributionsAnalysisbasedonDistrowatch_com/Dashboard1).


## The Data:

The data used in both the building of the database as well as the building of the dashboard was taken from Distrowatch.com, a website where Linux distros are ranked and rated by the Linux community. The rankings are calculated by page clicks, i.e. when somebody clicks on the title page for a particular distro this is appended to the ranking score, and the ratings are made by those who leave reviews on a particular distro. For the database, data from the top 20 Linux distros (as well as a select few others) are used, whereas for the data visualisation only the top 20 is used. 

The quantative features include numeric values such as the average user rating (out of 10) for a particular distro, the number of reviews given to a particular distro, and the rating of a distro in terms of the number of daily clicks that distro's page achieves on Distrowatch.com. The categorical features include the desktop environment that is installed by default on a particular distro (i.e. GNOME, KDE Plasma), and the name of the original distro that the current distro is based on (for example, most distros are built on the same architecture as a pre-existing distro like Debian or Arch). The data used in this project was correct as of 14 July 2021 and it is likely that the figures on Distrowatch.com will have changed since this date.


## Features of the Dataset:

**distro_id:** A unique identifier for each Linux distribution/distro.

**distro_name:** The name of each distro.

**based_on_id:** Most linux distros are based on a pre-existing architecture of another linux distro. This column gives us the unique identifier of the distro that each particular distro in the dataset is based on. Some of these values are NULL because a distro is completely independent of any architecture that existed before it.

**default_d_env:** This column tells us the unique identifier of the Desktop Environment that is installed by default on each distro. The distro Arch Linux has a NULL value here because there is no default; the user installs any desktop environment of their choosing during setup.

**origin:** The country where the original lead developer(s) of the distro worked to release the first iteration of the distro. For example, the distro Solus is still considered Irish, even though the original lead developer Ikey Doherty (who is Irish) left the project two years ago.

**dw_score:** This tells us the popularity rating that a distro achieved based on the average number of clicks per day that a particular distro gets on the landing page of that distro on the website Distrowatch.com.

**dw_rating:** This tells us the average rating (from Distrowatch.com) that a distro achieved when reviewed by members of the Linux community who have used this distro.

**num_reviews:** The number of times a distro has been reviewed on Distrowatch.com.

**last_updated:** This tells us when the latest software and security updates were released for a particular distro. This information was correct as of 14th July 2021 when the data was collected.

**DE:** The name (NOT the identifier) of the Desktop Environment that comes by default with each distro. This column was created for the purposes of visualisation in Tableau.

**based_on:** The name (NOT the identifier) of the original distro that each distro in the dataset is based on. This column was created for the purposes of visualisation in Tableau.


## Project Overview:

Firstly, the data was collected and placed in three different tables in an Excel spreadsheet, which was used as a reference point for entering data manually into the relational database. 

As Tableau Public does not allow connecting to databases, a number of small Excel files were created with the information needed to create the data visualisations in Tableau. The aim of the visualisation was to try and find out if there were any links between the most popular distros that led to some of them having a higher rating or a larger degree of popularity than others. The information about the default desktop environment of each distro and the parent distro that each distro is based on was used to make a number of distinctions between distros. 


## Motivation:

The motivation for the database part of the project was to build a relational database from the ground up. This was ideally done by manually coding the data into the database and creating relationships between entities using pure SQL code, rather than using functions built into the likes of SQL Server Management Studio and MySQL Workbench that allow you to import data directly from an Excel Spreadsheet and create your database using clicks rather than code. In terms of the motivation for the creation of the data itself, I have a massive interest in Desktop versions of Linux and I am a firm believer in reducing e-waste through maintenance of the electronic devices themselves. As a result, I still have every computer I've ever owned in working order with a suitable Linux distro installed as many of these machines are no longer capable of running the latest supported versions of Windows.

The motivation for the visualisation part of the project was to try to find out if there were any particular traits of these distros (that can be seen through statistics rather than through real-world use or testing of the distro) that could define why a particular distro in the top 20 would rank higher than another in terms of either popularity (number of clicks) or ratings (by users of the distro). This information would then be displayed on the Tableau dashboard so potential users of these distributions can see for themselves which distros (depending on their desktop environment, the parent distro they are based on, as well as the popularity and ratings) may be suitable for them to try out.


## Conclusions:

From this data, we can see that the three most popular distros, MX Linux, Manjaro, and Mint, are also the ones that have the largest number of reviews. Although they do not have the highest ratings (8.7, 8.4 and 8.7 respectively), this can be put down to the fact that those distros that rated higher were reviewed significantly less than these three. 

The highest rated distro of them all is Arch Linux, a system for advanced users that give them total control of every element of their operating system, with a rating of 9.4. This distro, however, has only been reviewed 309 times as of 14 July 2021 whereas the three most popular distros have been reviewed over 1,000 times. The second highest rated distro is OpenSUSE, and with a rating of 9.0 and 475 reviews this distro strikes a better balance between being highly rated and having a larger number of reviews to back it up. 

Out of the large number of distinct Desktop Environments that are included in the top 20 distros, the most popular of these are KDE Plasma and GNOME, which are each the default environment in 25% of all the distros in the Top 20. Interestingly, neither of these are the default environment in any of the top 3 distros: the default in both MX Linux and Manjaro is XFCE, and the default in Mint is Cinnamon, an environment that appears nowhere else in the Top 20. In terms of average ratings, however, KDE Plasma scores the highest, with an average rating of 8.7 across all distros that come with the KDE Plasma environment as default, whereas on average distros that come with GNOME have the lowest average score of 8.3.

Nearly all of the distros here are based on a parent distro; Arch, Debian and Ubuntu are the distros that most other distros are based on in terms of architecture. While just 4 distros are based on Arch (including Arch itself), while 6 are based on Debian (including Debian itself) and 4 are based on Ubuntu, which itself is based on Debian. 4 distros are completely independent of all parent distros, though many of these are in the bottom half of the top 20 in terms of popularity. Ratings-wise, the Arch-based distros have the highest average rating of 8.8, and the Debian-based distros have the lowest average rating of 8.2, a figure which is skewed by unusually low rating scores for Ubuntu and ElementaryOS, two very popular distributions based on Debian.


## Technologies Used:

Microsoft Excel for data collection, Microsoft SQL Server for database creation, Tableau for data visualisation.


## Summary:

A data collection project involving the creation of a relational database from the ground up, and visualisation of insights gleaned from this data
- Collected data to store in an Excel spreadsheet
- Manually inserted this data into a relational database using Microsoft SQL Server
- Created visualisations of this data on Tableau Public: https://public.tableau.com/app/profile/conor.loughran/viz/MostPopularLinuxDistributionsAnalysisbasedonDistrowatch_com/Dashboard1
