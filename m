Date: Fri, 8 Oct 1999 12:06:40 +0200 (South Africa Standard Time)
From: Bruce Hewitson <hewitson@egs.uct.ac.za>
Subject: [linux-lvm] Can't see /dev/hdk1
Message-ID: <Pine.WNT.4.05.9910081201470.-171375@socks.egs.uct.ac.za>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


I'm new to LVM -- but have compiled, installed etc under linux 2.2.10, on
a system that was running md raid with 6 ide chains and 6 20Gig ATA
drives.

With LVM I can access /dev/hdi1, but not and identical /dev/hdk1.
pvcreate works fine, but when I do a vgcreate I get the following:

bud:~# vgcreate -v tst /dev/hdk1
vgcreate -- checking volume group name
vgcreate -- locking logical volume manager
vgcreate -- checking volume group "tst" existence
vgcreate -- counting all existing volume groups
vgcreate -- reading all physical volume data from disks
vgcreate -- checking if all given physical volumes in command line are new
vgcreate -- checking physical volumes name "/dev/hdk1"
vgcreate -- no valid physical volumes in command line

Any pointers as to what I've done wrong much appreciated.

- bruce

 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | Dr. Bruce C. Hewitson                          Ph:  +27 21 650 2878 |
 | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
 | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
 |      hewitson@egs.uct.ac.za          http://www.egs.uct.ac.za       |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
