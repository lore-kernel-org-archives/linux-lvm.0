Return-Path: <mag@fbab.net>
Message-ID: <030b01c10269$390e61b0$020a0a0a@totalmef>
From: "Magnus Naeslund\(f\)" <mag@fbab.net>
References: <873d8gtpjl.fsf@nase.motakef.de>
Subject: Re: [linux-lvm] lvm and software raid1
Date: Sun, 1 Jul 2001 22:05:49 +0200
MIME-Version: 1.0
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

I think maybe you should use cfdisk instead of fdisk...
That solved my similar problem

Magnus

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 Programmer/Networker [|] Magnus Naeslund
 PGP Key: http://www.genline.nu/mag_pgp.txt
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

----- Original Message ----- 
From: "Ramin Motakef" <ramin@motakef.de>
To: <linux-lvm@sistina.com>
Sent: Sunday, July 01, 2001 9:30 PM
Subject: [linux-lvm] lvm and software raid1


> Hi!
> This is my first contact with LVM, so maybe i am doing something
> wrong, however this are my problems:
> 
> I try to install LVM on /dev/md1:
> 
> # cat /proc/mdstat 
> md1 : active raid1 sdb7[1] sda7[0]
>       15411072 blocks [2/2] [UU]
> 
> Kernel is vanilla 2.4.5, distribution debian sid of today.
> 
> md1 is about 15GB, but when i run pvcreate on it, it uses only 1.8 GB:
> 
> # pvcreate -ff /dev/md1
> pvcreate -- WARNING: forcing physical volume creation on "/dev/md1"
> pvcreate -- physical volume "/dev/md1" successfully created
> 
> # pvdisplay /dev/md1
> pvdisplay -- "/dev/md1" is a new physical volume of 1.86 GB
> 
> Any hints?
> 
> Thanks, Ramin
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
