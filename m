Date: Sun, 1 Oct 2000 18:18:00 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: [linux-lvm] Re: vgchange.c patch for devfs
Message-ID: <20001001181800.B5012@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20001002004609Q.yoshida@d9.dion.ne.jp>
Mime-Version: 1.0
In-Reply-To: <20001002004609Q.yoshida@d9.dion.ne.jp>; from dyoshida@d9.dion.ne.jp on Mon, Oct 02, 2000 at 12:46:09AM +0900
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: quippa@geocities.co.jp, linux-lvm@msede.com


Thanks for providing this.

Need to do some LVM devfs cleanup work...

Regards,
Heinz      -- The LVM guy --

On Mon, Oct 02, 2000 at 12:46:09AM +0900, YOSHIDA Daisuke wrote:
> Hello.
> This is a bug-report for lvm tools (0.8final).
> 
> I was using LVM tools (0.8final) on Linux 2.4.0-test8 with DEVFS,
> and found that "vgchange -ay" command does not work in the following cases:
> - after "vgchange -an"
> - after "lvmchange -R" and answering "y"
> - after rebooting
> 
> This trouble must be caused by devfs, which deletes /dev/(vgname)/
> directory when the VG is deactivated. So I made a small patch for
> "vgchange.c" to use LVM on my linux box. Please see the attached file.
> 
> Thank you.
> 
> -- 
> YOSHIDA Daisuke / quippa@geocities.co.jp
> http://www.geocities.co.jp/SiliconValley-SanJose/4514/
> 

> diff -crN LVM/0.8final/tools/vgchange.c LVM.modified/0.8final/tools/vgchange.c
> *** LVM/0.8final/tools/vgchange.c	Tue Feb 22 11:09:33 2000
> --- LVM.modified/0.8final/tools/vgchange.c	Sun Oct  1 12:50:40 2000
> ***************
> *** 391,397 ****
>               if ( opt_v > 0) printf ( "%s -- creating VGDA for \"%s\" "
>                                        "in kernel\n",
>                                        cmd, vg_name);
> !             if ( ( ret = vg_create ( vg_name, vg)) == 0)
>                  printf ( "%s -- volume group \"%s\" successfully activated\n",
>                           cmd, vg_name);
>               else {
> --- 391,403 ----
>               if ( opt_v > 0) printf ( "%s -- creating VGDA for \"%s\" "
>                                        "in kernel\n",
>                                        cmd, vg_name);
> ! 
> !             ret=vg_create( vg_name, vg);
> !             if ( ret == -LVM_EVG_CREATE_REMOVE_OPEN) {
> !                 vg_create_dir_and_group( vg);
> !                 ret=vg_create ( vg_name, vg);
> !             }
> !             if ( ret == 0)
>                  printf ( "%s -- volume group \"%s\" successfully activated\n",
>                           cmd, vg_name);
>               else {


=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
