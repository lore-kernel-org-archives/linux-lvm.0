From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: Re: [linux-lvm] lvextend
Date: 30 Dec 1999 22:13:59 +0100
Message-ID: <84ghun$3da$1@londo.rhein-main.de>
References: <Pine.LNX.4.10.9912291243350.5737-100000@scooby.cisco.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Adam Crews <acrews@cisco.com> wrote:

> Yes I do want one big lv.  I used lvm so that as I add disks I can just
> grow the fs without needing to re-do md devices or things like that.

> What I figured out is that you cannot extend a striped lv.  even if I have
> 2 partitions to add to a lv that has 2 stripes, I still cant extend the
> volume.

Are you using 0.7 ? There is a bug that avoids extending striped lvs under
some circumstances. Update to 0.8i or apply the following diff

--- pv_move.c.orig	Thu Dec 30 22:10:44 1999
+++ pv_move.c	Thu Dec 30 22:11:25 1999
@@ -254,7 +254,7 @@
 
       for ( pe = 0; pe < pe_to_move; pe++) {
          if ( lv_check_on_pv ( vg->pv[dst_pv_index],
-                               pe_src[pe].lv_num - 1) == TRUE &&
+                               pe_src[pe].lv_num) == TRUE &&
               vg->lv[pe_src[pe].lv_num-1]->lv_stripes > 1) break;
          if ( ( vg->lv[pe_src[pe].lv_num-1]->lv_allocation & LV_CONTIGUOUS) &&
               pv_check_free_contiguous ( vg->pv[dst_pv_index],


Torsten
