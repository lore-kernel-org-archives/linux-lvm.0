Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012240512.eBO5CNG28903@webber.adilger.net>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
In-Reply-To: <00122305232204.02330@lyta> "from Russell Coker at Dec 23, 2000
 05:23:22 am"
Date: Sat, 23 Dec 2000 22:12:23 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Russel Coker writes:
> #!/bin/sh
> #
> # lvm		This script handles the LVM startup/shutdown
> #		so that LVMs are properly configured and available.
> #
> 
> if [ "0" = `grep -c lvm /proc/devices` ]; then
>   exit 0
> fi
> [ -f /etc/lvmtab ] || exit 0
> [ -x /sbin/vgscan ] || exit 0
This         ^^^^^^ should probably be "vgchange" looking at your script.

> case "$1" in
> 	start)
> 		echo "Setting up LVM Volume Groups..."
> 		#/sbin/vgscan
> 		/sbin/vgchange -a y
> 		;;
> 	
> 	stop)
> 		echo "Shutting down LVM Volume Groups... "
> 		/sbin/vgchange -a n
> 		;;

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
