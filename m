Return-Path: <thornber@btconnect.com>
Date: Wed, 23 May 2001 12:24:51 +0100
Subject: Re: [linux-lvm] Patch for Fragments-2.4.0
Message-ID: <20010523122451.A1003@66bassett.freeserve.co.uk>
References: <3B0B9B31.57000FFC@in.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B0B9B31.57000FFC@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Wed, May 23, 2001 at 01:12:49PM +0200
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

Done.

On Wed, May 23, 2001 at 01:12:49PM +0200, David Vidal Rodriguez wrote:
> Can someone apply this patch to the LVM CVS-version? It adds the lines
> missing in the file PATCHES/fragments-2.4.0 in order for the kernel to
> compile.
> 
> Thanks!
> 
> --
>   ------------------------------------------------------------------------
>  David Vidal R. (vidalrod <at> in DOT tum DOT de)
> 
> 

> --- LVM/PATCHES/fragments-2.4.0	Tue Apr 24 16:29:19 2001
> +++ LVM/PATCHES/Fragments-2.4.0	Wed May 23 13:06:37 2001
> @@ -1,3 +1,7 @@
>  fragments/remove_procfs_config-2.4.patch
>  fragments/export_kiobuf_wait_for_io.patch
>  fragments/remove_lvm_init_from_ll_rw_block.patch
> +fragments/add_lvm_fs_2.4.patch
> +fragments/remove_lvm_snap_h_2.4.patch
> +fragments/register_ioctl_2.4.patch
> +
