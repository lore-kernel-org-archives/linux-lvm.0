From: Erkki Seppala <flux-lvm@inside.org>
Subject: Re: [linux-lvm] rescuing a VG with one missing PV
Message-Id: <20020212213713.GA10944@xulfad.ton.tut.fi>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
    <20020209150956.GA11057@xulfad.ton.tut.fi>
    <20020211205325.GA25253@xulfad.ton.tut.fi>
    <20020212102228.A2360@sistina.com>
    <20020212125816.GA5087@xulfad.ton.tut.fi>
    <20020212150551.A3258@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020212150551.A3258@sistina.com>
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
Date: Tue Feb 12 15:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 03:05:51PM +0100, Heinz J . Mauelshagen wrote:
> Get LVM from CVS at www.sistina.com and either use the -s option of pvcreate
> I implemented recently to fake the size you need or run "vgcfgrestore -i ..."
> which ignores the size of the device and restores metadata anyway
> at your own risk.

Thanks! This seems to be doing the trick. There seemed to be one typo
in the CVS at the moment I checked out my version, but I imagine it'll
be fixed as soon as someone tries to compile it :-) :

---8<---
Index: vgscan.c
===================================================================
RCS file: /data/cvs/LVM/tools/vgscan.c,v
retrieving revision 1.12
diff -u -r1.12 vgscan.c
--- vgscan.c    2002/02/08 14:59:37     1.12
+++ vgscan.c    2002/02/12 21:29:00
@@ -294,7 +294,7 @@
                for ( blk_dev = l = 0; l < vg->lv_max; l++) {
                   lv = vg->lv[l];
                   if ( lv == NULL) continue;
-                  if ( lvm_tab_check_free_lv_number ( lv) == FALSE) {
+                  if ( lvm_tab_check_free_lv_numbers ( lv) == FALSE) {
                      printf ( "%s -- changing minor number on \"%s\"\n",
                               cmd, lv->lv_name);
                      if ( lv->lv_access & LV_SNAPSHOT_ORG) {
---8<---

> Even though you lost your data anyway with the old drive, you need
> to either pvmove it away to get rid of allocated extents in that PV
> again or lvreduce LVs to make them free which you potentially don't
> like, because the extents might be further to the beginning of the
> LV.

I don't completely understand this, but I guess I will when the pvmove
has completed - it's a surprisingly slow operation. I was glad to
notice though that only one logical volume was in the failed disc.

Once again, thanks for the help :).
-- 
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
