Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3AF93044.B0079356@in.tum.de>
Date: Wed, 09 May 2001 13:55:48 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Patching my kernel.
References: <989363474.1329.2.camel@localhost>
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

>
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.3/kernel/drivers/md/lvm-mod.odepmod:   lvm_init_fs
> depmod:         lvm_fs_remove_vg
> depmod:         lvm_fin_fs
> depmod:         lvm_fs_remove_lv
> depmod:         lvm_fs_remove_pv
> depmod:         lvm_fs_create_vg
> depmod:         lvm_fs_create_lv
> depmod:         lvm_fs_create_pv

I have the same type of problem (unresolved symbols), but with a _clean_
2.4.0 kernel and LVM v0.9.1_beta<x>, having blindly followed the steps in
the INSTALL file...

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod@in.tum.de)
