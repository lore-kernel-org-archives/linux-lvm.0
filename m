Return-Path: <josv@osp.nl>
Date: Tue, 27 Feb 2001 07:09:57 -0800
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Problem mounting ext2 fs on LVM
Message-ID: <20010227070957.X1611@jadzia.josv.com>
References: <m24rxg2lqi.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m24rxg2lqi.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Tue, Feb 27, 2001 at 04:23:33PM +0100
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
To: Urs Thuermann <urs@isnogud.escape.de>
Cc: linux-lvm@sistina.com

I have experienced this problem too. It has got something to do with
wrongly kept status in the LVM kernel module. If you unload/load
lvm-mod, everything is back to normal.

++Jos

And thus it came to pass that Urs Thuermann wrote:
(on Tue, Feb 27, 2001 at 04:23:33PM +0100 to be exact)

> After having decided that the performance problem I described in the
> other thread in this ML are probably not that important for me, I
> tried to create an ext2 fs with 1024 byte blocks on a 1 GB LV.
> 
> But I can't mount it after creating the fs.  I can mount it if I
> create it on sda5 instead of the LV, or if I chosse 4K block size.  I
> start with no VGs defined.
> 
> 1K block size on /dev/sda5 is ok:
> 
>     isnogud:/root# fdisk -l /dev/sda|grep sda5
>     /dev/sda5            80       399   2570368+  8e  Linux LVM
>     isnogud:/root# mke2fs -b 1024 /dev/sda5 1048576
>     mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
>     Filesystem label=
>     OS type: Linux
>     Block size=1024 (log=0)
>     Fragment size=1024 (log=0)
>     131072 inodes, 1048576 blocks
>     52428 blocks (5.00%) reserved for the super user
>     First data block=1
>     128 block groups
>     8192 blocks per group, 8192 fragments per group
>     1024 inodes per group
>     Superblock backups stored on blocks: 
>     	    8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409, 663553, 
>     	    1024001
>     
>     Writing inode tables: done                            
>     Writing superblocks and filesystem accounting information: done
>     isnogud:/root# mount /dev/sda5 /mnt
>     isnogud:/root# df /mnt
>     Filesystem           1k-blocks      Used Available Use% Mounted on
>     /dev/sda5              1031880        13    979439   0% /mnt
>     isnogud:/root# umount /mnt
> 
> But if I try the same on an LV, I get
> 
>     isnogud:/root# pvcreate /dev/sda5
>     pvcreate -- physical volume "/dev/sda5" successfully created
>     
>     isnogud:/root# vgcreate vg0 /dev/sda5
>     vgcreate -- INFO: using default physical extent size 4 MB
>     vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
>     vgcreate -- doing automatic backup of volume group "vg0"
>     vgcreate -- volume group "vg0" successfully created and activated
>     
>     isnogud:/root# lvcreate -n test /dev/vg0 -L 1024
>     lvcreate -- doing automatic backup of "vg0"
>     lvcreate -- logical volume "/dev/vg0/test" successfully created
>     
>     isnogud:/root# mke2fs -b 1024 /dev/vg0/test
>     mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
>     Filesystem label=
>     OS type: Linux
>     Block size=1024 (log=0)
>     Fragment size=1024 (log=0)
>     131072 inodes, 1048576 blocks
>     52428 blocks (5.00%) reserved for the super user
>     First data block=1
>     128 block groups
>     8192 blocks per group, 8192 fragments per group
>     1024 inodes per group
>     Superblock backups stored on blocks: 
>     	    8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409, 663553, 
>     	    1024001
>     
>     Writing inode tables: done                            
>     Writing superblocks and filesystem accounting information: done
>     isnogud:/root# mount /dev/vg0/test /mnt
>     mount: wrong fs type, bad option, bad superblock on /dev/vg0/test,
>     	   or too many mounted file systems
> 
> Any idea, what's wrong here?   I works, when I choose 4K block size:
> 
>     isnogud:/root# mke2fs -b 4096 /dev/vg0/test
>     mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
>     Filesystem label=
>     OS type: Linux
>     Block size=4096 (log=2)
>     Fragment size=4096 (log=2)
>     131072 inodes, 262144 blocks
>     13107 blocks (5.00%) reserved for the super user
>     First data block=0
>     8 block groups
>     32768 blocks per group, 32768 fragments per group
>     16384 inodes per group
>     Superblock backups stored on blocks: 
>     	    32768, 98304, 163840, 229376
>     
>     Writing inode tables: done                            
>     Writing superblocks and filesystem accounting information: done
>     isnogud:/root# mount /dev/vg0/test /mnt
>     isnogud:/root# df /mnt
>     Filesystem           1k-blocks      Used Available Use% Mounted on
>     /dev/vg0/test          1032088        20    979640   0% /mnt
>     isnogud:/root# umount /mnt
> 
> 
> urs
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
Each betrayal begins with trust.
