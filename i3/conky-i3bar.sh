#!/bin/sh

echo '{"version":1}'

# begin the endless array
echo '['

# send empty first array of blocks
echo '[],'

exec conky -c $HOME/.conkyrc_bar
