Message-Id: <m10v3rL-0000YbC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
In-Reply-To: <199906180656.AA25684@mailgate1b.telekom.de> from Heinz Mauelshagen at "Jun 18, 1999  8:56:16 am"
Date: Fri, 18 Jun 1999 20:59:26 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> 
> For today you are only able to have an Intel binary copy
> as a Quarterdesk Partition Magic customer.
> 

And that is the problem. I hoped that dtfs will support resizing on the fly,
but at least currently there is no such feature.
Don't get me wrong, it is nice to have the support for resize2fs, but
to be able to resize an unmounted (?) file system with a commercial tool
is not a big plus for Linux in a server environment.
That's why I'm searching for a file system that can handle that while
being mounted and which can be delivered with all the Linux distributions.

Today I've read that SGI and Veritas are planning to bring a journaled
file system to Linux, but I couldn't found any details on how this
file system will be.

So I think we have to advertise LVM, because it makes resizable file
systems reasonable. I understand that there was no need or better
no application for such a file system before.

You may ask why I'm so in favour of that flexibility. Of course you
can put two partitions on your disk, one swap and one Linux native.
That works fine for your small workstation but in a server things are
different : you will surely have more than one disk and you don't want
to have one file system for all. Things can be messed up badly when
a file system is full, so I want to keep at least the root seperatly.
(To be able to boot, I have seen systems hanging because they could
not create /etc/mtab.)
You may want to share the /usr between machines. You may want to
seperate user's home from the /var file system for more control over
the used disk space. You may want to have different file systems for
performance reasons (to be able to control on which disks they are).

So, let everybody know that there is LVM ! ;-)
I'll write to SGI, maybe they consider it for their upcoming
journaling file system. And I mailed the developper of dtfs.
There is also reiserfs, but I haven't checked it yet.
Any others, I might have overlooked ?

Have a nice day,
Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
