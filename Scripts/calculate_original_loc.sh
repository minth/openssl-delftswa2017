#This calculates the original lines of code by comparing the git blame of the current revision and filtering that with the lines that are made by the original commit

git ls-files | grep -E ".*\.(c|h|pl|txt|S)$" | xargs -n1 git --no-pager blame -w -l | grep -oP "^\S*" | grep -E -f commits.regex | sort -f | uniq -c | sort -n
