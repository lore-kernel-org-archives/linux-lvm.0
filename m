From: "David Mathews" <dmathews@sungard.com>
Message-ID: <85256729.00541780.00@scs-mta1.scs.sungard.com>
Date: Wed, 3 Mar 1999 10:21:10 -0500
Subject: [linux-lvm] problem when adding a second lv
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com




Kernel:  2.2.2 / LVM: 0.6

I created two volume groups:  One consisting of two 2gig drives (vg00 using sdd1
and sde1) and the second consisting of one 4gig drive (vg01 using sdc1).  I am
able to create a striped logical volume (/dev/vg00/lvol1) and mount a filesystem
residing on this lv.  When I define a second logical volume within vg01
(/dev/vg01/testlv) /dev/vg00/lvol1 is immediately corrupted...  Any suggestions?

Thanks.

-David Mathews
