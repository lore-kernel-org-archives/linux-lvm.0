From: FryarD@pge-energy.com
Message-Id: <86256745.006F1AE2.00@gulns03.pge-texas.com>
Date: Wed, 31 Mar 1999 14:14:37 -0600
Subject: [linux-lvm] Bug in the Major number increments?
MIME-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



In experimentation with LVM on RH5.2 I noticed that everytime I create the first
two logical volumes they get the exact same major number. This results in one of
the volume not valid or mountable. I have not examined it enough yet, however, I
suspect that the increment i++ is incorrectly using the same number before
incrementing. Any thoughts? Is there something I am missing? Also it might be a
good idea to add a line to the makefile to create /etc/lvmtab.d. I fiddled
around with LVM for a while getting invalid protocol before discovering that you
had to create this directory by hand before it would work.


TIA
Dexter Fryar
