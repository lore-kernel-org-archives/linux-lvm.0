From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010020449.e924nVl11138@webber.adilger.net>
Subject: Re: [linux-lvm] need help to recover my system
In-Reply-To: <39D7C0AA.764B1447@attglobal.net> "from Les Hazelton at Oct 1, 2000
 06:54:34 pm"
Date: Sun, 1 Oct 2000 22:49:31 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Les Hazelton <seawolf@attglobal.net>
Cc: Mauelshagen@sistina.com, linux-lvm@msede.com

You write:
> When I booted the new 2.2.17 kernel I ran "pvscan -D" & "vgscan -D".  I
> can now do vgdisplay and lvmdisplay if I use the -D parameter.  I just
> can't activate the volume group.  When I try, this is the result.
> 
> [root@farpt1 /root]# vgchange -va y
> vgchange -- locking logical volume manager
> vgchange -- finding all volume group(s)
> vgchange -- checking volume group name "vg01"
> vgchange -- checking existence of volume group "vg01"
> vgchange -- reading volume group data for "vg01" from lvmtab
> vgchange -- checking volume group consistency  of "vg01"
> vgchange -- checking if all physical volumes of volume group "vg01" are
> available
> vgchange -- creating VGDA for "vg01" in kernel
> vgchange -- can't open logical volume manager to activate volume group
> "vg01"

This looks like the same bug that YOSHIDA Daisuke just fixed (see message
"Re: vgchange.c patch for devfs"):

Cheers, Andreas
-------------------------------------------------------------------------
--- LVM/0.8final/tools/vgchange.c	Tue Feb 22 11:09:33 2000
+++ LVM.modified/0.8final/tools/vgchange.c	Sun Oct  1 12:50:40 2000
@@ -391,7 +391,13 @@
              if ( opt_v > 0) printf ( "%s -- creating VGDA for \"%s\" "
                                       "in kernel\n",
                                       cmd, vg_name);
-             if ( ( ret = vg_create ( vg_name, vg)) == 0)
+ 
+             ret = vg_create( vg_name, vg);
+             if ( ret == -LVM_EVG_CREATE_REMOVE_OPEN) {
+                vg_create_dir_and_group( vg);
+                ret = vg_create ( vg_name, vg);
+             }
+             if ( ret == 0)
                 printf ( "%s -- volume group \"%s\" successfully activated\n",
                          cmd, vg_name);
              else {

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
