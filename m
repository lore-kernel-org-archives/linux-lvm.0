Return-Path: <jan@moria.gondor.com>
Date: Sun, 7 Jan 2001 22:33:00 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] vgcfgrestore bug followup
Message-ID: <20010107223300.A6050@gondor.com>
References: <0ada40824210711NYCSMTP2@nyc.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ada40824210711NYCSMTP2@nyc.rr.com>; from bcorsello@usa.net on Sun, Jan 07, 2001 at 04:23:50PM -0500
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

On Sun, Jan 07, 2001 at 04:23:50PM -0500, Brad Corsello wrote:
> (But then I pushed my luck and tried doing vgextends.  After adding three PVs,
> vgscan started to throw up with a weird error:  vg_read_with_pv_and_lv():
> allocated LE of LV" can't get data of volume group "vg1" from physical
> volume(s).  I don't know if this is related to the vgcfgrestore problem or
> not.)

This one looks like a problem I had myself. For me, the following patch
did help: (I already posted this patch, with a description, on Dec 23)

Index: pv_read_all_pv_of_vg.c
===================================================================
RCS file: /data/cvs/LVM/tools/lib/pv_read_all_pv_of_vg.c,v
retrieving revision 1.3
diff -u -1 -b -p -r1.3 pv_read_all_pv_of_vg.c
--- pv_read_all_pv_of_vg.c	2000/11/20 02:47:20	1.3
+++ pv_read_all_pv_of_vg.c	2000/12/22 23:27:00
@@ -103,2 +103,3 @@ int pv_read_all_pv_of_vg ( char *vg_name
             pv_this_sav = pv_this;
+	    if(np<pv_tmp[p]->pv_number) np=pv_tmp[p]->pv_number;
             if ( ( pv_this = realloc ( pv_this,
@@ -111,5 +112,4 @@ int pv_read_all_pv_of_vg ( char *vg_name
             }
-            pv_this[np] = pv_tmp[p];
-            pv_this[np+1] = NULL;
-            np++;
+            pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
+            //pv_this[np+1] = NULL; // XXX???
          }
