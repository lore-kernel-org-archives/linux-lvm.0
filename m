Message-Id: <4.3.1.2.20000712135932.0189a6d0@pop-server.austin.rr.com>
Date: Wed, 12 Jul 2000 14:04:51 -0500
From: Daniel Whicker <heimdall@mail.org>
Subject: Re: [linux-lvm] New LVM user, couple of problems
In-Reply-To: <Pine.SOL.4.10.10007121311030.5718-100000@basm.cerias.purdu
 e.edu>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Brian Poole <raj@cerias.purdue.edu>
Cc: linux-lvm@msede.com

At 01:22 PM 7/12/2000, you wrote:
>Setup is a P2 300, 2 Seagate 4.3G SCSI HDs, 128M RAM, BusLogic controller,
>2.4.0-test3 kernel, and 0.8final LVM tools.

>The first issue I hit upon is with lv[extend,reduce]. Essentially I will
>change the size of the lv (eg lvreduce /dev/vg00/lvol1 -L 200m) however
>when I mount lvol1 the size shown is the same as it was before, according
>to df. lvdisplay shows the correct size of 200m, but the system seems to
>disagree saying the lv is still 6.7g which was the original size. [...]
>This obviously is a bad thing, if diskspace
>is exceeded it should just say no more diskspace, or similar, not go into
>a loop that I can't get out of except by reboot ;).

Brian, when you resized the LV, you only changed the structure of the block 
device, not the filesystem that sits on top of it.  The filesystem 
structure still thinks that it was the size the block device was when the 
filesystem was created.  Before changing the size of the logical volume, 
you need to use an ext2 resizing tool to resize the filesystem.  If you're 
using reiserfs, this is actually easier, and you can do it dynamically.



>feeling malicious in general, I started a *very* large dd (eg dd
>if=/dev/zero of=/lvol1/really-big-friggin-file bs=1024k count=7000). This
>proceeded along fine for a while, during which I realized that it should
>stop at 2G due to FS (ie ext2) limits. At 2G the ls output became rather
>unusual, but the dd continued and df continued to mark the fs as fuller
>and fuller. The dd finished succesfully (7000 records in + out) and df
>says 6.8G of the 7.5G is being used on the lv.


I note that you're using a 2.4.0 kernel.  The 2GB file limitation has been 
removed from the 2.4 kernels.  LVM has nothing to do with how the 
filesystem itself operates.  LVM is responsible for the block device, not 
the data on top of it.
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
