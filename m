Return-Path: <thornber@btconnect.com>
Date: Tue, 22 May 2001 14:54:17 +0100
Subject: Re: [linux-lvm] Dumb (well known I hope) symbol problem
Message-ID: <20010522145417.A973@66bassett.freeserve.co.uk>
References: <3B0A6E1B.2CA74065@in.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B0A6E1B.2CA74065@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Tue, May 22, 2001 at 03:48:11PM +0200
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

It looks like the patch didn't build correctly.  Did you specify the 
location of your source code with 'configure --with-kernel_dir=DIR' ?

If not make distclean in the LVM dir and start again.

- Joe

On Tue, May 22, 2001 at 03:48:11PM +0200, David Vidal Rodriguez wrote:
> Hi folks,
> 
> I have just downloaded the CVS source tree of LVM and I'm still
> wondering why I can't compile the module/compiled-in version.
> I have the Linus-2.4.0 source tree in /var/tmp and I'm not root ('cause
> I'm not the owner of this --quick-- machine and compiling the source in
> my P90 would be too much). The following symbols appear to be missing
> after running ./configure with --with-kernel_dir=/var/tmp/linux, applied
> the patch to the source and tried to compile as usual:
> 
> drivers/md/mddev.o: In function lvm_init_fs'
> drivers/md/mddev.o: In function lvm_fin_fs'
> drivers/md/mddev.o: In function lvm_fs_create_vg'
> drivers/md/mddev.o: In function lvm_fs_remove_vg'
> drivers/md/mddev.o(.text+0x2221): undefined reference to
> lvm_do_vg_remove':
> drivers/md/mddev.o(.text+0x228b): undefined reference to
> lvm_do_pv_create':
> drivers/md/mddev.o(.text+0x245f): undefined reference to
> lvm_do_pv_remove':
> drivers/md/mddev.o(.text+0x2488): undefined reference to
> lvm_do_lv_create':
> drivers/md/mddev.o(.text+0x2d79): undefined reference to
> lvm_do_lv_remove':
> drivers/md/mddev.o(.text+0x2ea7): undefined reference to
> lvm_do_lv_rename':
> drivers/md/mddev.o(.text+0x3de6): undefined reference to
> lvm_fs_create_lv'
> make: *** [vmlinux] Error 1
> 
> 
> I promise that's the last time I ask such a thing; it really screws me
> up not being able to have a decent beta7 kernel!
> 
> Thanks & cheers,
> --
>   ------------------------------------------------------------------------
>  David Vidal R. (vidalrod <at> in DOT tum DOT de)
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
