Message-ID: <39C65C87.76E67263@marxmeier.com>
Date: Mon, 18 Sep 2000 20:18:47 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: hch@ns.lst.de
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] align lv_on_disk.base to 512K blocks
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@marxmeier.com

Forwarded message from Christoph Hellwig (hch@ns.lst.de) ...

-------- Original Message --------
Date: Thu, 14 Sep 2000 20:48:33 +0200
From: Christoph Hellwig <hch@ns.lst.de>
To: "Heinz J. Mauelshagen" <Heinz.Mauelshagen@t-online.de>
Cc: Linux LVM mailing list <linux-lvm@msede.com>
Subject: [PATCH] align lv_on_disk.base to 512K blocks
Message-ID: <20000914204833.A25390@ns.lst.de>

Hi Heinz,

this patch makes vgcreate align the lv structures to 512K on disk,
this makes reading them from kernel using bread much easier.

Could you aplly it to 0.9?

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.


--- vg_setup_for_create.c~      Thu Sep 14 19:30:11 2000
+++ vg_setup_for_create.c       Thu Sep 14 19:30:22 2000
@@ -43,6 +43,7 @@
    int ret = 0;
    uint pe_total = 0;
    ulong rest = 0;
+   ulong size = 0;
 
 #ifdef DEBUG
    debug_enter ( "vg_setup_for_create -- CALLED\n");
@@ -89,8 +90,11 @@
       vg->pv[p]->vg_on_disk.size = LVM_VG_DISK_SIZE;
       vg->pv[p]->pv_namelist_on_disk.base =
LVM_PV_NAMELIST_DISK_BASE;
       vg->pv[p]->pv_namelist_on_disk.size = ( max_pv + 1) * NAME_LEN;
-      vg->pv[p]->lv_on_disk.base =
vg->pv[p]->pv_namelist_on_disk.base +
-                                  
vg->pv[p]->pv_namelist_on_disk.size;
+      
+      size = vg->pv[p]->pv_namelist_on_disk.base +
vg->pv[p]->pv_namelist_on_disk.size;
+      vg->pv[p]->lv_on_disk.base = (size / SECTOR_SIZE) *
SECTOR_SIZE;
+      if (size % SECTOR_SIZE)
+         vg->pv[p]->lv_on_disk.base += SECTOR_SIZE;
       vg->pv[p]->lv_on_disk.size = ( max_lv + 1) * sizeof ( lv_t);
       LVM_PE_ON_DISK_BASE ( vg->pv[p]);
       strcpy ( vg->pv[p]->vg_name, vg->vg_name);
