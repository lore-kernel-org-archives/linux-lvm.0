Date: Mon, 2 Oct 2000 10:20:54 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] need help to recover my system
Message-ID: <20001002102054.A7806@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <39D7C0AA.764B1447@attglobal.net> <200010020449.e924nVl11138@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200010020449.e924nVl11138@webber.adilger.net>; from adilger@turbolinux.com on Sun, Oct 01, 2000 at 10:49:31PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Sun, Oct 01, 2000 at 10:49:31PM -0600, Andreas Dilger wrote:
> You write:
> > When I booted the new 2.2.17 kernel I ran "pvscan -D" & "vgscan -D".  I
> > can now do vgdisplay and lvmdisplay if I use the -D parameter.  I just
> > can't activate the volume group.  When I try, this is the result.
> > 
> > [root@farpt1 /root]# vgchange -va y
> > vgchange -- locking logical volume manager
> > vgchange -- finding all volume group(s)
> > vgchange -- checking volume group name "vg01"
> > vgchange -- checking existence of volume group "vg01"
> > vgchange -- reading volume group data for "vg01" from lvmtab
> > vgchange -- checking volume group consistency  of "vg01"
> > vgchange -- checking if all physical volumes of volume group "vg01" are
> > available
> > vgchange -- creating VGDA for "vg01" in kernel
> > vgchange -- can't open logical volume manager to activate volume group
> > "vg01"
> 
> This looks like the same bug that YOSHIDA Daisuke just fixed (see message
> "Re: vgchange.c patch for devfs"):

Yes, it does.
I already inserted YOSHIDA Daisuke's code into my 0.9 develoment tree.

Heinz

> 
> Cheers, Andreas
> -------------------------------------------------------------------------
> --- LVM/0.8final/tools/vgchange.c	Tue Feb 22 11:09:33 2000
> +++ LVM.modified/0.8final/tools/vgchange.c	Sun Oct  1 12:50:40 2000
> @@ -391,7 +391,13 @@
>               if ( opt_v > 0) printf ( "%s -- creating VGDA for \"%s\" "
>                                        "in kernel\n",
>                                        cmd, vg_name);
> -             if ( ( ret = vg_create ( vg_name, vg)) == 0)
> + 
> +             ret = vg_create( vg_name, vg);
> +             if ( ret == -LVM_EVG_CREATE_REMOVE_OPEN) {
> +                vg_create_dir_and_group( vg);
> +                ret = vg_create ( vg_name, vg);
> +             }
> +             if ( ret == 0)
>                  printf ( "%s -- volume group \"%s\" successfully activated\n",
>                           cmd, vg_name);
>               else {
> 
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert


=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
