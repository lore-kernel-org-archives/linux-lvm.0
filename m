Message-Id: <199910122048.AA00771@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Problems with e2fsadm
Date: Tue, 12 Oct 1999 22:47:22 METDST
In-Reply-To: <m11ZHs9-000D4UC@londo.rhein-main.de>; from "Torsten Neumann" at Oct 7, 99 8:02 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Torsten Neumann <torsten@londo.rhein-main.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hello Torsten,

e2fsadm simply is buggy in 0.7 when dealing with ext2 4k block sizes.
This will be fixed in 0.8.

Workaround grow  : e2fsck, lvextend, resize2fs
Workaround shrink: e2fsck, resize2fs, lvreduce

Regards,
Heinz

> 
> I'm having some problems with e2fsadm when using 4096 as blocksize for my
> ext2 filesystem. e.g
> 	lvcreate -L 100 -n /dev/vg00/lvoltest vg00
> 	mke2fs -b 4096 /dev/vg00/lvoltest
> 	e2fsadm -L 200 /dev/vg00/lvoltest
> gives something like
> 	...
> 	lvextend -- logical volume "/dev/vg00/lvoltest" successfully extended
> 
> 	ext2_resize_fs: your container (i.e. the file or partition the
> 					filesystem) is in is not big enough for a filesystem of
> 					204800 blocks (it's only 51200 blocks)
> 
> If using resize2fs instead of ext2resize I got the similiar message
> 
> 	The containing partition (or device) is only 51200 blocks.
> 	You requested a new size of 204800 blocks.
> 
> Extending ext2 Filesystems on non logical volumes (/dev/sd...) works fine
> even if using 4096 as blocksize.
> Looking at the ext2resize code it seems to me that ext2resize is doing the
> right thing, therefor my guess is that there is some bug in the lvm code.
> Looking at LVM I find in tools/lib/liblvm.h
> 	#define BLOCK_SIZE 1024
> but I don't understand if this has something to do with the above problem.
> BLOCK_SIZE seems to be used in vg_setup_for_extend to check if there is room
> for extending. But I don't see what it has to do with the wrong result of
> the llseek call in ext2resize.
> 
> Maybe here is someone smarter then me and could tell me what's going wrong.
> Would be nice if resizing works for all blocksizes.
> 
> Regards,
> 	Torsten
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
