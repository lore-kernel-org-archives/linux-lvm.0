Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A27DCBC.170D60CF@tls.msk.ru>
Date: Fri, 01 Dec 2000 20:15:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Installation Problems with 0.9
References: <200011291857.eATIvOL22853@webber.adilger.net>
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
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@sistina.com

Andreas Dilger wrote:
> 
[]
> 
> Here is a "patch for the patch" which should allow the new_raid patch
> to work properly.  YMMV, as I don't use MD devices, but it is essentially
> what I had in my old 0.8 patchset (which was based on the new RAID code),
> and is mostly just removing conflicting parts of the patch:
> 
> Cheers, Andreas
> =========================================================================
> diff -u -r1.1 lvm-0.9-2.2.17-new_raid.patch
[]

Two things with this funny patch-for-patch.

1. missing EXPORT_SYMBOL(lvm_map_ptr) in ll_rw_block.c
 (the same is true for original patch, but it ever not
  defines this symbol -- only extern decl)
2. missing EXPORT_SYMBOL(num_physpages) in ksyms.c
 that is OK in original patch.

That's only compilation/building issues, I still
unable to make it works -- need another rebuild
that's in progress now.

Regards,
 Michael.
