{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;}
{\*\expandedcolortbl;;\cssrgb\c20000\c20000\c20000;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}.}{\leveltext\leveltemplateid1\'02\'00.;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listname ;}\listid1}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl320\sa200\partightenfactor0

\f0\fs28 \cf2 \expnd0\expndtw0\kerning0
This Code Book is for the run_analysis.R script and covers variables and transformations. \
\
Data:\
The dataset is is downloaded from from ics.uci.edu and called UCI HAR Dataset. \
The dataset is unzipped and read into data frames. \
\
Variables:\
The initial data frames read from the dataset are:\
\
subject_test: contains test data of volunteer test subjects being observed\
subject_train: contain train data of subjects\
x_test: contains recorded features test data\
x_train: contains recorded feature train data\
y_test: contains test data of activity code labels\
y_train: contains test data of activity code labels\
activity_labels: contains a list of activities performed when measurements were recorded\
Features: features selected\
Data_Merge: data set with merged training and test data and tidied X data only including relevant mean and std fields. \
SecondData: version of Data_Merge with means\
\
Transformations:\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sl320\partightenfactor0
\ls1\ilvl0\cf2 X is created by merging x_train and x_test\
Y is created by merging y_train and y_test\
Subject is created by merging subject_train and subject_test\
Data_Merge is created by merging Subject, Y and X\
\
Only measurements related to mean and stdev were extracted for X when creating Data_Merge\
\
SecondData was created as an independent data set taking the mean of each variable for each activity and each subject using aa group by subject and activity\
The dataset of SecondData is exported to a file called SecondData.txt\
}