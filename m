From: Ewen McNeill <lvm@ewen.mcneill.gen.nz>
Subject: Re: [linux-lvm] Drive failure 
In-Reply-To: Message from "B. J. Zolp" <bjzolp@wisc.edu> 
   of "Thu, 15 May 2003 18:34:10 EST." <200305151834.10480.bjzolp@wisc.edu> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2361.1053042909.1@basilica.la.naos.co.nz>
Message-Id: <20030515235509.D3662AE4F5@basilica.la.naos.co.nz>
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
Date: Thu May 15 18:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <200305151834.10480.bjzolp@wisc.edu>, "B. J. Zolp" writes:
>I'm doing a
> dd bs=512 conv=noerror,sync if=/dev/hdf of=/dev/null 
>right now.  It has been going for a few hours, but does not seem to be taking 
>up any cpu cycles (it looks hung up).  

I suspect that it will "hang" several times during the process,
especially if you have IDE disks, each time it encounters a bad block
(IDE is somewhat more prone to this as the IDE code seems to retry the
read more times, and to not get quite the same degree of error reporting
as the SCSI code does -- eg, to distinguish how fatal the problem is).

Watching the kernel log output (eg, dmesg) will probably give you some
insight into what is going on.

Also with bs=512 it will be a very slow copy at the best of times.

>What would you suggest I do if the I can only get the data on the HD up 
>until the bad sector (or where ever it is hung up).  

With some care you can skip over the bad sectors another way; look at
the "skip=" argument.  I've recovered data from bad floppies in the past
by DDing each of the readable chunks out, making up padding blocks of
the right size, and joining it all together.  

Again you've got to be careful that the blocks you read off go back onto
the new disk in the same position as they came off the old disk.

>This is the last drive in the logical volume, so there was not too much 
>data on it, but how would I go about added the new replacement drive to 
>the logical volume without messing up my entire filesystem?

Pass.  This is almost certainly file system specific, and even then I
don't know how well any common Linux file system would cope with loosing
whole chunks of the file system.  (I also don't know the right LVM magic
to substitute in another -- blank or mostly blank -- disk in place of
the broken one.)

Ewen
