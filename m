Return-Path: <ardy@rdb.linux-help.org>
Date: Mon, 26 Feb 2001 19:14:17 -0500 (EST)
From: ardy@rdb.linux-help.org
In-Reply-To: <200102261729.f1QHTAZ10614@webber.adilger.net>
Message-ID: <Pine.LNX.4.20.0102261859050.29765-100000@rdb.linux-help.org>
MIME-Version: 1.0
Subject: [linux-lvm] FYI Functioning Slackware init
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ok, with the help of list members I was able to resolve the vgscan 
problems I was experiencing booting Slackware. I'm going to share my 
setup.

In /etc/rc.d/rc.S:

 # Remount the root filesystem in read-write mode
 echo "Remounting root device with read-write enabled."
 /sbin/mount -w -v -n -o remount /
 
 # This was an addition, limits vgscan to /proc thus
 # speeding up the scan immensely.
 /sbin/mount /proc 
 
# Initialize Logical Volume Manager
 /sbin/vgscan
 /sbin/vgchange -ay

 .....

 # mount file systems in fstab (and create an entry for /)
 # but not NFS because TCP/IP is not yet configured
 /sbin/mount -a -v -t nonfs,proc

As I had detailed in a previous posting, I had to alias off a bunch
of devices I don't have, in modules.conf. I no longer require those
aliases, and the loop module no longer loads since loop devices are no
longer scanned either.

Again, my thanks to the list, and I hope this can help other Slackware
users.

P.S. Perhaps this can be added to the HOWTO for Slackware init?
