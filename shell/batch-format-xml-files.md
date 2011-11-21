# Format directory of XML files

Format all XML files in current directory or any of it's children

```bash
	for f in $(find -name '*.xml'); do xmllint --format $f --output $f; done
```
