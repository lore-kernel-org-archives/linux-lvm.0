Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101130107.f0D17kZ32571@webber.adilger.net>
Subject: Re: [linux-lvm] [lvm 0.8 final] lvmcreate_initrd fails for me
In-Reply-To: <3A5F80D7.1080905@liberate.com> "from Chris Worley at Jan 12, 2001
 03:10:31 pm"
Date: Fri, 12 Jan 2001 18:07:46 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: seawolf@attglobal.net

Chris, you write:
> For example, "/dev/*" files don't require much 
> actual file system space, but a disproportionate number of file 
> pointers are required.  I believe this is controlled by reducing the 
> bytes/inode setting in mke2fs (but I forget).
> 
> My lvmcreate_initrd says: "mke2fs -m0 -i 1024 $DEVRAM $INITRDSIZE"

I submitted a new lvmcreateinitrd script in another message which fixes
several things, but now I realize it may not help Les.  The "-i 1024"
option will create the maximum number of inodes that mke2fs will allow
using this option.  He can change the code (which is commented out in
my patch) to use "mke2fs -N" which will allow him to create enough inodes
(more than "mke2fs -i" will allow).  You need at least mke2fs 1.14 to
do this.  Maybe I will automate this as well.

> The way to test this is to execute each of the commands in 
> lvmcreate_initrd manually: when the error occurs, return to the point 
> where "mke2fs" is run using a different value for "-i".  You should at 
> least see the error messages start on different files for each iteration.

This is automated in my new script.  Les must have > 8192 devices.

> Note that a lot of the commands used in lvmcreate_initrd pipe their 
> error output to /dev/null.  Don't do this during testing.

This is also fixed - commands run quietly, but you can see any errors.

> Also, are you sure your ramdisk size is 8MB?  The default is 4MB: it 
> needs to be set on the lilo command line or when configuring the 
> current kernel.  I think this is a mistake... since the initrd is not 
> necessarily being built on the same system where it's going to be 
> used, ramdisks should be avoided (since it may require rebooting if 
> you're not already setup for 8MB ramdisks), using a loopback 
> filesystem would be easier (if it's not currently part of the kernel, 
> then the module can be loaded -- no reason to reboot).

The old script uses a loopback filesystem, not a ramdisk, to build the image.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
