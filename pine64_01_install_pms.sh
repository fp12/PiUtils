# https transport is needed
sudo apt-get update && sudo apt-get install apt-transport-https binutils -y --force-yes

# grab uglymagoo key
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add -

# Run add the ARMHF architecture to the Debian Packages that can be installed here
sudo dpkg --add-architecture armhf 

# Make sure that we install the correct version of the arm package
echo "deb [arch=armhf] https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list

# Update the package lists
sudo apt-get update

# Install the media server and all the dependencies
sudo apt-get install binutils:armhf plexmediaserver-installer -y
