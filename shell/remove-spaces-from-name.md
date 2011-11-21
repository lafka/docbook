# Remove spaces from file names


```bash
for i in *\ *; do if [ -f "$i" ]; then mv "$i" ${i// /_}; fi; done   
```

It can also be used without the check first

```bash
for file in *;do mv $file ${file// /_};done
```
