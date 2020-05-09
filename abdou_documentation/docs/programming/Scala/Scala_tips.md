# Scala tips

- Iterate through a list with access to indices: 
```
(connectionProvided,connectionIndex) <- junctionConnections.view.zipWithIndex
```
- Iterate through indices:
```
connectionIndex <- junctionConnections.indices
```