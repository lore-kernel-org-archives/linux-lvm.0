Return-Path: <pwk.linuxfan@gmx.de>
From: Peter Kirk <pwk.linuxfan@gmx.de>
Subject: Re: [linux-lvm] Problems: reiserfs lvm as /
Date: Mon, 21 May 2001 16:08:16 +0200
References: <01051916333601.00791@mama> <3B08F910.D42A5F52@uksr.hp.com>
In-Reply-To: <3B08F910.D42A5F52@uksr.hp.com>
MIME-Version: 1.0
Message-Id: <01052116081602.00950@mama>
Content-Transfer-Encoding: 8bit
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

Am Montag, 21. Mai 2001 13:16 schrieben Sie:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> 	These messages are similar to the ones I saw building my
> / on LVM system yesterday.  I am using ext2 file systems though.
> The default kernel parameter is ramdisk size 4096.  I read the messages
> to mean the ramdisk is not large enough.
>
> I fixed it by adding a ramdisk option to the root on lvm entry in lilo.conf
> so it looked like this:-
>
> image=/boot/vmlinuz-2.4.2-2-lvm.1
>         label=linux-lvm
>         initrd=/boot/initrd_from_lvmcreate_initrd
>         read-only
>         root=/dev/vg00/root
> 	ramdisk=5120
>
> Could have up the kernel parameter instead I guess.
> I have not done testing yet and will give a better account of my
> problems and solutions later.
>
I added the line, and now it works :-)))

Thanks
