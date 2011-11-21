# Concat multiple lines in SED

Take all lines starting with - and append to the previous line
```bash
sed -e :a -e '$!N;s/\n-/ /;ta' -e 'P;D'
```

There are some nifty special sed tricks in there using some special sed characters:

  N;    - Add the next line to the buffer.
  s///; - Substitute a regex search with result (s/foo/bar).
  P;    - Print the top line of the buffer.
  D;    - Delete the top line from the buffer and re-run script.


So what we do is, add the next line to the buffer, replace newlines if needed,
then print the new line before deleting it it from the buffer moving to the next one.

