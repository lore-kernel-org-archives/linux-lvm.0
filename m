Return-Path: <austin@coremetrics.com>
Date: Wed, 23 May 2001 22:36:20 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] Is now: Resizing & LVM shutdown
In-Reply-To: <990659938.1175.1.camel@localhost>
Message-ID: <Pine.LNX.4.33.0105232235480.29374-100000@UberGeek.coremetrics.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rupert Heesom <raheesom@navpoint.com>
Cc: linux-lvm@sistina.com

I'd say use reiser of XFS for your LVM partition. The grow utilities are
pretty kick ass and seem to work really well.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On 23 May 2001, Rupert Heesom wrote:

> As I write this, a new kernel is being compiled with the patch for
> online ext2resizing.  According to xconfig, enabling the option was
> DANGEROUS!
>
> As I think about it, since I've installed that root ramdisk (works
> great), I don't actually need to be able to resize my LVM partition
> mounted.  Still, it's good to have a kernel with such a capability.
>
> I'm not concerned now about UNMOUNTING / deactivating the LVM when
> shutting the PC down.  That doesn't seem to be working at all.  (See
> another post of mine re details there).
>
> Perhaps you would know how to help me there?  I'll experiment a bit
> myself, but I'm afraid of damaging the LV, since when I reboot my PC,
> the VG is not yet deactivated!  However it _has_ happened twice now
> without a problem.
>
> On 23 May 2001 16:56:35 -0600, Andreas Dilger wrote:
> >
> > If you patch your kernel with the online ext2 patches, you can resize
> > your root partition while it is still mounted.  You will still need a
> > reboot to install the new kernel, however, but only the one time.  See
> > http://sourceforge.net/projects/ext2resize/
> >
> > It still isn't a bad idea to have a small non-LVM partition on one of
> > your disks which has a kernel you can boot from, along with useful
> > tools in /lib and /sbin.  I guess miniroot is such a thing.
>
>
