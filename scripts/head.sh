# Bash script to append head to files
# <https://stackoverflow.com/questions/69126182/adding-a-header-to-source-files-with-bash>

h=$'//Copyright 2025 BrewHub\n//Authors: Twert\n'

# Turn on recursive globbing and extended globbing and have patterns that
# fail to match expand to an empty string
shopt -s globstar extglob nullglob
for f in **/*.@(h|cpp); do
  # Add the contents of the variable h at the beginning of the file
  # Note: no lines in $h should be just a period as that signals end of
  # text input mode.
  ed -s "$f" <<EOF
1i
$h
.
w
EOF
done