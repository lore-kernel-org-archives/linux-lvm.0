Return-Path: <jan@moria.gondor.com>
Date: Sat, 23 Dec 2000 00:36:35 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] vgscan -- ERROR with 2.4.0-test13-pre4
Message-ID: <20001223003635.A986@gondor.com>
References: <20001222181730.A1371@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001222181730.A1371@gondor.com>; from list039@gondor.com on Fri, Dec 22, 2000 at 06:17:30PM +0100
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

On Fri, Dec 22, 2000 at 06:17:30PM +0100, Jan Niehusmann wrote:
> Now, when I try to boot the new kernel, I get the following message from
> vgscan:
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of
>  volume group "vg1" from physical volume(s)

Ok, I found the problem: The sort order of the pv's is wrong, and 0.9 is
missing the code that sorts them. 0.8final's pv_read_all_pv_of_vg.c contains

      for ( p = 0; pv_tmp[p] != NULL; p++) {
         if ( strcmp ( pv_tmp[p]->vg_name, vg_name) == 0) {
            pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
            np++;
         }
      }

and 0.9's doesn't.

The following patch fixes it (I did this fix to prove my theory, it may
not be the right way to do it):

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
