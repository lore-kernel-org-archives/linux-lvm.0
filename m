Date: Sun, 8 Aug 1999 03:13:58 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: [linux-lvm] bug/questions
Message-ID: <19990808031358.A23149@cyberhqz.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I've found a bug in e2fsadm.  It assumes that the e2fs was created with
a block size of 1024, which is not always the case.  The number it then
passes to resize2fs is totally wrong, and resize2fs then exits with an
error.

Also, how does lvm handle (or does it) the effect of removing a SCSI
drive in the middle of the SCSI drives?  ie, I have:

sda : scsi id 1
sdb : scsi id 3
sdc : scsi id 5

and I add a drive as scsi id 2, so now we have:

sda : scsi id 1
sdb : scsi id 2
sdc : scsi id 3 (OLD sdb)
sdd : scsi id 5 (OLD sdc)

Will lvm put the drives together in the right order?

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
