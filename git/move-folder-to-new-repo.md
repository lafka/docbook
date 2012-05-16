# Move a folder to a new git repositoy

You can filter out all commits in one folder and make new repository out of it

```bash
cd /tmp
git clone git@apollo:scalemonitor-client smc && cd smc
git remote add neworigin git@apollo:eightval
git push -u neworigin master
``` 
