Message-ID: <3EBDAFF0.5090608@inode.at>
From: Manfred Gschweidl <m.gschweidl@inode.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mount root filesystem on lvm
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>	 <1052511447.6321.22.camel@chtephan.cs.pocnet.net>	 <3EBD22B3.4090808@inode.at> <1052607008.1489.2.camel@chtephan.cs.pocnet.net>
In-Reply-To: <1052607008.1489.2.camel@chtephan.cs.pocnet.net>
Content-Transfer-Encoding: 7bit
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
Date: Sat May 10 21:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: linux-lvm@sistina.com

the kernel always complaines, that he cannot mount the root fs...

when i use "/dev/progs/root" boot up ends with:
VFS: Cannot open root device "3a00" or 3a:00
Please append s correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 3a:00

when i use "/dev/mapper/progs-root" boot up ends with:
VFS: Cannot open root device "mapper/progs-root" or 00:00
Please append s correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 00:00

i use the append option for "/dev/mapper/progs-root", because i can't 
run lilo with it, because lilo says, that it doesn't find the device....

i want to upgrade from 2.4.12 LVM1 to 2.4.20 LVM2....
booting with 2.4.12 and LVM1 works now for nearly 2 years.

thanks again,

manfred



Christophe Saout wrote:
> Am Sam, 2003-05-10 um 18.02 schrieb Manfred Gschweidl:
> 
> 
>>i have one more question: what does your "lilo.conf" look like???
>>especially the "root=...." parameter ist he most interesting one. how 
>>does it need to be named with device-mapper???
> 
> 
> It looks fairly simple:
> 
> boot    = /dev/hda
> vga     = normal
> read-only
> lba32
> prompt
> timeout = 30
> message = /boot/message
> 
> image  = /boot/vmlinuz
>   label  = linux
>   root   = /dev/mapper/vg-root
>   initrd = /boot/initrd
> 
> But I think you can also use /dev/vg/root (in my case). I think lilo
> only uses this line to look up the device number (major, minor).
> 
> What's your problem?
> 
