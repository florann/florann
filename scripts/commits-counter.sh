# GitHub username
USERNAME="florann"

# Start date for counting commits
START_DATE="2025-01-01"

# GitHub API Request
TOTAL_COMMITS=$(curl -s -H "Authorization: token $README_TOKEN" \
  "https://api.github.com/search/commits?q=author:$USERNAME+committer-date:>=$START_DATE" \
  | jq '.total_count')

# Update README
sed -i "s/<!-- COMMIT_COUNT -->/🔥 Total Commits since $START_DATE: **$TOTAL_COMMITS**/" README.md