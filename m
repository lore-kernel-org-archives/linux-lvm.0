From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] ext2online fails
Message-ID: <20011129095307.F29249@lynx.no>
References: <OFF0F6A876.96B3BE16-ON86256B13.005A4F63@TEXASMUTUAL.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFF0F6A876.96B3BE16-ON86256B13.005A4F63@TEXASMUTUAL.COM>; from JPolache@texasmutual.com on Thu, Nov 29, 2001 at 10:32:48AM -0600
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
Date: Thu Nov 29 10:51:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
Cc: linux-lvm@sistina.com

On Nov 29, 2001  10:32 -0600, Jonathan S. Polacheck wrote:
> I am trying to resize a filesystem after lvextend.  ext2online returns the
> following;
> 
> [root@netman root]# ext2online /dev/vg1/vol_usr
> ext2online v1.1.14 - 1999/10/14 for EXT2FS 0.5b
> 
> ext2online: resizing to 258048 blocks
> ext2online: resize failed while in kernel
> ext2online: Invalid argument
> 
> The ext2online man page states;
> 
> In  order  to  use ext2online, you need to have the Online ext2 resize
> support (CONFIG_EXT2_RESIZE) compiled into the kernel  (this  is  an
> optional patch for the 2.x series of kernels).
> 
> How do I tell if my kernel is properly compiled?  If it is not properly
> compiled, I have a problem as I currently do not have the disk space to
> install gcc, make or the kernel source.

Unless you patched it yourself, I don't know of any kernels that include
this patch by default.  Finally with 2.5 here, it will go into the main
kernel.

If you need to resize your filesystem, you need to unmount it (go into
single user mode from a console window (not X!) with "telinit 1", which
will stop most of the programs running on the system).  Then run
"ext2resize /dev/vg1/vol_usr" which will detect the size of the LV and
resize the filesystem to fill it.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
