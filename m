Message-Id: <m10wasN-0000YeC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9
In-Reply-To: <199906211751.LAA11908@munet-d.enel.ucalgary.ca> from Andreas Dilger at "Jun 21, 1999 11:51:57 am"
Date: Wed, 23 Jun 1999 02:26:51 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

thanks for the link. Maybe we should bring the code to the author of
ext2resize. A combination of both approaches may be what we are (or at least
I am) looking for.

> filesystem - this may require modifications to mke2fs.  Another good thing
> is that this definitely claims to work with a mounted filesystem, although
> it requires a remount a-la "mount -o remount,rw...", but I think this will
> work on an FS that has open files on it.

Ah, that's it. I feel a resizable file system approaching ... ;-)

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
