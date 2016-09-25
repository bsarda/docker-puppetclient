#!/bin/bash

touch /opt/letitrun
if [ ! -f /etc/initialized ]; then
	echo "This is the first launch - will init..."
	touch /etc/initialized
else
	echo "PuppetServer already initialized, no need to reinit - just start."
fi

echo "  starting puppetserver in foreground mode..."
/opt/puppetlabs/bin/puppetserver foreground
