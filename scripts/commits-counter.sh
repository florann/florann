# GitHub username
USERNAME="florann"

# Start date for counting commits
START_DATE="2025-01-01"

# GitHub API Request (with debug output)
echo "Fetching commits for user: $USERNAME since $START_DATE"

RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/search/commits?q=author:$USERNAME+committer-date:>=$START_DATE")

echo "API Response:"
echo "$RESPONSE"  # Debugging line to print full response

# Extract total commit count
TOTAL_COMMITS=$(echo "$RESPONSE" | jq '.total_count')

# Debugging Output
echo "Total Commits Found: $TOTAL_COMMITS"
# Update README
sed -i "s/<!-- COMMIT_COUNT -->/🔥 Total Commits since $START_DATE: **$TOTAL_COMMITS**/" README.md
