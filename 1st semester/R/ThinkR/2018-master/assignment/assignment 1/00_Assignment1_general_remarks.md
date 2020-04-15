# Data analysis

- If we ask for an average, you do NOT round output. Even if it is number of students per school.
- When doing models, test for correlation, you do NOT REMOVE DATA (as what you think is an outlier). The problem is more about the distribution. Here => a log would be better. 
- Why using non tidy function `merge` ? Use `*_join` from {dplyr}
- Why using non tidy function `apply(x, 2)` ? Use `mutate`, `mutate_at`, `mutate_if`
- If we ask: What is the number of ... ? It is better if we have an answer. Not only the code.

## Rules

- **Indent your code** (Ctrl + I)
- **Go to new line after each `%>%`**
- **Go to new line after each `+` with ggplot2**
- **Explanation of choices and steps of your code should be normal text between chunk, not comments inside code chunk**
- **Always look at the HTML you rendered before sending it so that you are sure that your outputs are correctly visible**
- **DO NOT use cbind-like function when you can safely use a *_join** Do not add a column in a dataset like surface of departments if you are not sure of the order of departments. A `inner_join` would assure that departments have a correspondance in the two tables.
- Use explicit names for your objects. If you multiple intermediate values and cannot choose a new meaningful name, you probably did not chained enough (`%>%`) your workflow.

## Tips

- R can be run in inline code using `r 1+1` if you want to show some output value. (e.g. The number of lines of my dataset is `r nrow(dataset)`.
- Do not show complete table output. Change your dataset as tibble with `as_tibble` for instance so that only the first lines are shown, or use `DT::datatable()` for an interactive table output (if really needed) otherwise the first few lines maybe enough (`head()`).
