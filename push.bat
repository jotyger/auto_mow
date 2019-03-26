git add *
set /p comment=Enter comment:
git commit -a -m "%comment%"
git push origin "master"