Message-Id: <99Apr27.101317cdt.28406@firewall.sigg.com>
Date: Tue, 27 Apr 1999 10:22:50 -0500
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: [linux-lvm] Raw/Cahr devices
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Can lvm create a Raw/Char devices?

Not a blocked device.  Much like a tape device. See below the
two(listing A).  The first position shows what type of device it is.

Informix and other database like to have char devices for database
space.


Listing A:

crw-r-----   1 root     disk       9,   1 Jul 18  1994 /dev/st1

brw-r-----   1 root     disk      34,  73 Aug 18  1995 /dev/hdh9


Thanks,
    Chris Anderson
