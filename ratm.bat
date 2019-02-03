echo off
cls
echo "Docker build..."
docker build --rm -t ruby-ratm .
cls
echo "Run Rage Against The Machine"
docker run -it --rm ruby-ratm ruby ./lib/console.rb