Return-Path: <tmdg@uksr.hp.com>
Message-ID: <3B08F910.D42A5F52@uksr.hp.com>
Date: Mon, 21 May 2001 11:16:32 +0000
From: Tom Dawes-Gamble <tmdg@uksr.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems: reiserfs lvm as /
References: <01051916333601.00791@mama>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

	These messages are similar to the ones I saw building my 
/ on LVM system yesterday.  I am using ext2 file systems though.  
The default kernel parameter is ramdisk size 4096.  I read the messages 
to mean the ramdisk is not large enough.

I fixed it by adding a ramdisk option to the root on lvm entry in lilo.conf
so it looked like this:-

image=/boot/vmlinuz-2.4.2-2-lvm.1
        label=linux-lvm
        initrd=/boot/initrd_from_lvmcreate_initrd
        read-only
        root=/dev/vg00/root
	ramdisk=5120

Could have up the kernel parameter instead I guess.
I have not done testing yet and will give a better account of my 
problems and solutions later.

Since lvm was the only module in the ramdisk it may be that a default
ramdisk is not enough.  Perhaps we should add a note to the HOW-TO
for days like this.

JFTR. I'm using RH 7.1 and beta7 LVM.

Tom.


Peter Kirk wrote:
> 
> Hi,
> 
> I am new to LVM, and I ran into some problems.
> First thing I did, was to setup LVM within the SuSE7.1 setup tools, which
> worked out fine.
> /boot is not on LVM, ext2fs
> swap is not on LVM
> LVM:
>         /       [reiserfs]
>         /usr    [reiserfs]
>         /home   [reiserfs]
> 
> I have too disks, so I set the strip option to two, to get better
> performance. Now I want to compile a new kernel (2.4.4), and I cannot get lvm
> working with it. Since root is on LVM I need to do this lvmcreate_initrd
> stuff, but it does not work ! I get:
> 
> VFS: Mounted root (ext2 file system).
> attempt to access beyond end of device
> 01:00: rw=0, want=4612, limit=4096
> attempt to access beyond end of device
> 01:00: rw=0, want=4613, limit=4096
> attempt to access beyond end of device
> 01:00: rw=0, want=4614, limit=4096
> attempt to access beyond end of device
> 01:00: rw=0, want=4615, limit=4096
> VFS: Cannot open root device "3a02" or 3a:02
> Please append the correct "root=" boot option
> kernel panic: VFS: Unable to mount root fs on 3a:02
> 
> in lilo.conf it says:
> boot=/dev/raid/root
> This should be the correct root. It works with the old 2.4.0 Kernel made from
> SuSE, propably something is with the initrd or with the Kernel-Setup
> 
> Please help !!
> Thanks
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

- -- 
char  *t,*n,*i="%.9s%.7s%.7s\n";extern void exit(int);extern int printf(const 
char  *,...);int main(){int v=*i,g,e=*(i-~(v/=v))%*(i+v);g=*i+~e--; 
t=n="  DISPLAY'tmdg@uksr';,,;'.hp.com'*>"+g;v=g-e;  e-=printf(i,n- v,e+n,t);
t=n="  DISPLAY'http://www.itrc.hp.com/' *>"-~g;exit(g+~printf(i,n+~v,e+n,t));}

-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.1i

iQA/AwUBOwj5DgbfKggmajr3EQKUCwCg1AW4VRyIoTYuTJa7WI2CEnqFOuEAoL5r
I6dUj8+9V80UMW1f6gG+5MMi
=Th7z
-----END PGP SIGNATURE-----
