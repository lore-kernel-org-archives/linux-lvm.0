Message-ID: <38CBE8D9.515878BA@sarakinovconsulting.com>
Date: Sun, 12 Mar 2000 13:58:33 -0500
From: Goni Sarakinov <gsarak@sarakinovconsulting.com>
MIME-Version: 1.0
Subject: [linux-lvm] vgcreate seg faults
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I am trying to do a vgcreate, but I keep on getting a segmentation
fault.

Doing a vgcreate -v shows that after vgcreate does:

vgcreate -- counting all existing volume groups
Segmentation fault

I am using 2.2.14SMP kernel & 0.8i version of LVM.

Anyone have any ideas what could be causing this?

BTW, pvcreate works with no problem. pvdisplay shows the correct devices
- /dev/sd[bc]1
vgdisplay reports that there are no volumes (of course)

Thanks.

Goni Sarakinov
Sarakinov Consulting, Inc.
