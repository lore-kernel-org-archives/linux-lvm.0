Return-Path: <thornber@btconnect.com>
Date: Wed, 9 May 2001 14:11:15 +0100
Subject: Re: [linux-lvm] Patching my kernel.
Message-ID: <20010509141115.D511@66bassett.freeserve.co.uk>
References: <989363474.1329.2.camel@localhost> <3AF93044.B0079356@in.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3AF93044.B0079356@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Wed, May 09, 2001 at 01:55:48PM +0200
From: Joe Thornber <thornber@btconnect.com>
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
To: linux-lvm@sistina.com

On Wed, May 09, 2001 at 01:55:48PM +0200, David Vidal Rodriguez wrote:
> >
> > depmod: *** Unresolved symbols in
> > /lib/modules/2.4.3/kernel/drivers/md/lvm-mod.odepmod:   lvm_init_fs
> > depmod:         lvm_fs_remove_vg
> > depmod:         lvm_fin_fs
> > depmod:         lvm_fs_remove_lv
> > depmod:         lvm_fs_remove_pv
> > depmod:         lvm_fs_create_vg
> > depmod:         lvm_fs_create_lv
> > depmod:         lvm_fs_create_pv
> 
> I have the same type of problem (unresolved symbols), but with a _clean_
> 2.4.0 kernel and LVM v0.9.1_beta<x>, having blindly followed the steps in
> the INSTALL file...

The fragments file for 2.4.0 seems to be out of date.  Try appending
the following lines to LVM/PATCHES/fragments-2.4.0

fragments/add_lvm_fs_2.4.patch
fragments/remove_lvm_snap_h_2.4.patch

Once you've patched your kernel make sure you do a 'make dep' again.

Out of interest, is there any reason that you are sticking with 2.4.0 ?

- Joe
