Message-ID: <36CAA354.649CFB49@msede.com>
Date: Wed, 17 Feb 1999 12:09:08 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] root filesystem in lvm
References: <003401be5a59$6a3c04a0$6630aec1@trpc.dkfz-heidelberg.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Tobias Reber <tobias.reber@dkfz-heidelberg.de>
Cc: linux-lvm@msede.com

Tobias Reber wrote:
> On a test system I have put the root filesystem into lvm. 

I assume you are using initrd?

> Everything works fine, however during shutdown I cannot 
> vgchange -a n to the volumegroup, where the root filesystem sits. 
> Does that any harm?

I don't think so. All vgchange -an is supposed to do is unregister 
the volume group with the kernel. Since you are going to boot anyway 
it does not make a difference.
I had a short look at the source and it seems to be a nop anyway.

> Also did anybody out there look into lilo in order to make the 
> kernel bootable from an lvm volume? IMHO lvm looks very keen 
> especially if you have large disks, where you still have only
> 8 partitions. I prefer having my filesystem spread out into 
> several partitions for /, /usr and so forth.

While this should not be too hard i'm not sure if this makes sense. 
Why not designate a small boot area on the disk (/boot) which holds
the kernel image and a minimal recovery system and use a initrd?

However it should be possible to use LILO. As far as i understand 
LILO uses partition relative block numbers to load the kernel image. 
We just need to make sure that they are relative to the dos style 
partition. If included statically in the kernel the lvm driver could 
execute the equivalent of a vgchange -ay and we should be able to 
mount the root file system.
However this will lead to some kernel bloat as some of the code which
currently resides un user space in lvmlib and vgchange must also be 
present in the kernel.
 
For now i would suggest to make a small boot area and use initrd 
to switch to lvm. This will also nicely avoid any stupid BIOS
limitations.


Michael

-- 
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruchstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
