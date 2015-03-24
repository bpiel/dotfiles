find . -maxdepth 1 -type d -exec bash -c "cd '{}' && echo '===== {}' && git status" \;
