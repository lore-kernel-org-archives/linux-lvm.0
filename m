Message-Id: <m10xasW-0000YjC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: [linux-lvm] resizing
Date: Fri, 25 Jun 1999 20:39:08 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hello,

while reading linux/fs/super.c and trying to understand what's going
on on mounting/remounting I found some hints that make me believe
that inodes are invalidated and the super block reread when a media
change is detected.

So I wonder whether it would be an advantage to implement a check_media_change
into lvm that flags a resized lv ?

Assuming we have a resizable file system, we could let the resizer flush the
file system, do its work and set the flag to have it updated.
( I think beside a lock while doing some of the updates we should have no need
for more kernel changes - right ?).

If the lvm code sets it on its own, it may be read before the resizer has
started.
In the case a lv is not used by a file system but directly by an application
(data base ?) it may be interesting to have a notification of size changes
(This would only allow increasing for not deleting applications data).

I'm not sure if it breaks something and how open files are handled.
A mount -o remount seems to be of no harm but it calls get_super,
not read_super AFAI understood and furthermore the file system hasn't
changed its size.

Any comments ?
Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
