Message-ID: <37C6AE9E.A93F0D8A@geotec.net>
Date: Fri, 27 Aug 1999 10:28:30 -0500
From: mrharris <mrharris@geotec.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and devices
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

I may be a day late and a dollar short here, but I experienced a problem
this morning when I added a new scsi drive to my 2.2.10 system. I know
that the os scans for devices when the system boots and assigns device
names then. Well this screwed up my volume groups because sda1 is now
sdb1, you get the idea nothing new here. I know this has been discussed
before.
In AIX new devices are assigned and that's the way it stays unless you
manually delete the device and readd it so that when one of your mirred
drives gets blown away or you add a drive the assignments are the same
(more to it than this but you get the idea).  I believe this needs to
change in linux before LVM is added to the kernel, life would be much
simpler (md is effected by this as well I beleive). LVM does need to be
there though, the old way is just that the old way. I don't know how I
would live without LVM when you manage over 200 systems.  Just my
opinion.

add LVM to 2.4 -- YES.

--
Chaos, panic, & disorder - my work here is done.
