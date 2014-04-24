nginx.pp works on CENTOS.  It assumes you have puppet installed. If you need
help installing puppet, check here:
http://docs.puppetlabs.com/guides/installation.html

Once puppet is installed;
1. Download the nginx.pp to your server.
2. Change to the directory where you downloaded nginx.pp.
3. Execute the following command: puppet apply nginx.pp
4. Wait for the command to complete.
5. If no error messages; verify that the site is working by opening
	http://youripaddress:8000 in your browser.

If you have any issues, please visit us at irc://freenode.net,
forums.puppetlabs.com, or support@puppetlabs.com.
