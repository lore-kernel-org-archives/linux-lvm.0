From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Howto create a Compressed ROM File initrd with lvmcreate_initrd
Message-ID: <20030127082655.GB1698@tykepenguin.com>
References: <001001c2c581$d7d579a0$240b892c@pe1mhp.ampr.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001001c2c581$d7d579a0$240b892c@pe1mhp.ampr.org>
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
Date: Mon Jan 27 02:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 26, 2003 at 10:28:17PM +0100, Jan H. van Gils wrote:
> 
> 	Hi,
> 
> Thanks for reading,
> 
> I am using Debian as a distro and it usses a cramfs initrd file when it
> boots.
> Here is the output from the original initrd file and the one created by
> lvmcreate_initrd.
> 
> 1. Orginal
> initrd.img-2.4.20-686:      Linux Compressed ROM File System data,
> little endian size 2920448 version #2 sorted_dirs CRC 0x2e79d9f7,
> edition 0, 1565 blocks, 200 files
> 
> 2. lvmcreate_initrd
> initrd-lvm-2.4.20-686.gz:   gzip compressed data, from Unix, max
> compression
> 
> 
> Has some of you myth have seen in earlier posting my system wil not boot
> When I use the initrd I have created with lvmcreate_initrd.
> 
> Here is the message:
> Kernel panic: VFS: Unable to mount root fs on 3a:00
> 
> So I think the problem has to do with the fact that my kernel expects a
> cramfs initrd
> File and not a gzip compressed.

Yes, the Debian kernels don't have ext2 compiled in TTBOMK, only cramfs.
Unfortunately, LVM likes to write to the root filesystem during vgscan and so
you can't use a RO filesystem like cramfs - which is why lvmcreate_initrd
creates an ext2 filesystem. Someone (I forget who) did some work on getting LVM
to work with the Debian mkinitrd stuff but it was quite complicated and wasn't
integrated by the mkinitrd maintainer.

The simplest wasy to acheive this is to build your own kernel with ext2 built in
and use that for the initrd.

Root on LVM is complicated anyway so if youre not prepared to do this then you
really shouldn't be trying root on LVM either....
 

-- 

patrick
