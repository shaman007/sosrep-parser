The sosparser project goal is to dump daily used information from the Red Hat sosreport tool to the good-looking HTML file. Just not to repeat same parsing every time you need to have a look at the smp.conf or resolv.conf. It's written in Bash and produces HTML with CSS and jQuery. I want to keep it as simple as possible. Since I'd worked at the IDM support department, I add thing I needed there at the first place.

Usage:

    sosparser.sh /path/to/unpacked_sosreport > result.html

Done:
 * Basic system information: version, hostname, timestam
 * SELinux status
 * Mounted filesystems, space left
 * Amount of open files, processes, uptime
 * Network interfaces and routing 
 * hosts, nsswitch.conf and resolv.conf without comments
 * smb.conf without comments, Samba related processes list
 * krb5.conf without comments, Kerberos related processes list, keytab
 * IDM related packages list
 * SSHD config and process lis
 * Messages log file divided by daemons, so you see each daemon output separately
 * Left-side JQuery based menu that looks for H1 tags in the ouput file
 * Collapsable blocks of configs/logs
