Message-ID: <3A06D4BC.FE2819CE@dell.com>
Date: Mon, 06 Nov 2000 09:56:44 -0600
From: Michael E Brown <Michael_E_Brown@dell.com>
MIME-Version: 1.0
Subject: [linux-lvm] scsi/fc multipath failover patch
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

All,
  I've been lurking on the list for a while, and I just found something
that would probably be of great value to everyone. While I've heard
people ask for it, I haven't seen anybody who knew of a patch to provide
multipath failover for Linux.  Linuxcare developed multipath failover
when they made the Sun T3 driver, although I haven't seen it publicized.
Their kernel patch provides a generic multipath-failover layer for
linux. The kernel patch is fairly small and clean, and comes with a
couple userspace tools to set everything up. The URLS are below

http://open-projects.linuxcare.com/t3/   <--Generic project homepage
http://open-projects.linuxcare.com/t3/download/sun-t3-0.3.1.tar.gz

cheers!
Michael Brown
