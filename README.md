# cleaningdata

#### Getting and Cleaning Data

**R version: 3.3.2, OS: linux-gnu**

The R script run_analysis.R does the following :

1. Downloads the zip archive containing the data from the url given in the assignment.

2. Extracts the zip archive locally.

3. Reads the training set into R.

4. Reads the variable names into R.

5. Assigns the variable names to the training set.

6. Reads in the training labels into R.

7. Reads in the activity labels into R.

8. Converts the training labels variable to a factor with levels corresponding to the activity labels.

9. Creates a data frame that combines the training set and the activity corresponding to each observation.

10. Renames the factor variable that records the activity to "activity".

11. Reads in testing set into R.

12. Assigns variable names to testing set.

13. Read in testing labels into R.

14. Converts the testing labels variable to a factor with levels corresponding to the activity labels.

15. Creates a data frame that combines the testing set and the activity corresponding to each observation.

16. Merges training set and testing set.

17. Extracts only variables that record the mean and standard deviation of the measurements (excluding those that record the mean frequency)

18. Creates a data frame that combines the extracted variables and the activity variable.

19. Gives descriptive names to the variables that are all lowercase.

20. Creates a tidy dataset that summarizes each variable by its mean for each of the six activities.



