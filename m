Message-Id: <m10vk14-0000YbC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
In-Reply-To: <Pine.LNX.4.10.9906201228040.9163-100000@hibernia.spin.ie> from Paul Jakma at "Jun 20, 1999 12:28:52 pm"
Date: Sun, 20 Jun 1999 18:00:17 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> What about:
> 
> http://www.dsv.nl/~buytenh/ext2resize/
> 
> i've no idea whether it works or not.

It works - hmm, sometimes :-)
I managed to resize a mounted file system and several times it was possible
to copy more files on it after the resize. But from time to time I got an
error saying "no space left on device" while df shows the free space
correctly.
Just some minutes ago I sent some feedback to the author (of course
mentioning lvm :-) and a patch (the snapshot of June, 17th would not get
the size of a block device).
It looks very promising.

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
