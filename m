Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3B069CF2.7AAC10DD@ednet.ns.ca>
Date: Sat, 19 May 2001 13:18:58 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
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

Peter,

"boot=" in lilo.conf indicates on which device's MBR lilo is going to be
installed (I think).

There should be a "root=" entry in lilo.conf as well that indicates where your
root filesystem is located. Can you send your complete lilo.conf file?


Peter Kirk wrote:

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
