# Custom functions
findpy(){
  find $1 -name "*.py" | xargs grep --color -n $2
}

# Auto-activate virtual environment when entering backend directory
function chpwd() {
    if [[ "$PWD" == */backend ]]; then
        if [[ -f .venv/bin/activate ]]; then
            source .venv/bin/activate
            echo "Activated virtual environment in backend directory"
        fi
    fi
}

# Pull latest main and delete merged branches
function git_delete_merged_branch() {
    local current_branch=$(git branch --show-current)
    echo "Current branch: $current_branch"
    
    # Switch to main and pull latest
    git checkout main
    git pull origin main
    
    # Delete the previous branch if it's not main
    if [[ "$current_branch" != "main" ]]; then
        echo "Deleting merged branch: $current_branch"
        git branch -d "$current_branch"
    fi
    
    echo "✅ Updated main and cleaned up merged branch"
}
