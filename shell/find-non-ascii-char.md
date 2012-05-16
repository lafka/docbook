# Finding non-ascii characters in files

Loop through all non-hidden files and strip away all characters from 000 to 177.
Unfortunatly this does not give you the context of the character but should give
you a quick outline of which files they exists in.

 \000 & \177 are octal values in decimal the range is 0-127

```bash
for f in $(find . -type f ! -wholename '*/.*')
do 
	echo $f":"; tr -d "\000-\177" < $f | hexdump
done
```
