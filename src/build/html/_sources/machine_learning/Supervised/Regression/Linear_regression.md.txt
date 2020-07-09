# Linear regression

Linear regression attempts to model the relationship between two variables by fitting a linear equation to observed data. 
One variable is considered to be an explanatory variable, and the other is considered to be a dependent variable.

A linear regression line has an equation of the form $Y = a + bX$, where X is the explanatory variable and Y is the dependent variable. The slope of the line is b, and a is the intercept (the value of y when x = 0).

## Least-Squares Regression

The goal of linear regression is to find $a$ and $b$ that produce the best fitting regression line according to some criterion. 
The most common criterion is minimizing the sum of the squares of the vertical deviations from each data point to the line (for example, if a point lies on the fitted line exactly, then its vertical deviation is 0). 
These deviations are called the residuals and this method is called least-squares regression.