# Remove spaces from file names


```for i in *\ *; do if [ -f "$i" ]; then mv "$i" ${i// /_}; fi; done   
```

It can also be used without the check first
```for file in *;do mv $file ${file// /_};done
```
