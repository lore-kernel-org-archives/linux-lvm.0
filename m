From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How big is a PV?
Message-Id: <20020213112404.B7457@sistina.com>
References: <87vgd1935x.fsf@papadoc.bayour.com>
MIME-Version: 1.0
In-Reply-To: <87vgd1935x.fsf@papadoc.bayour.com>; from turbo@bayour.com on
    Wed, Feb 13, 2002 at 09:50:02AM +0100
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
Date: Wed Feb 13 04:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Following patch should help. Will be in CVS soon.

--- LVM/tools/lib/pv_show.c     7 Feb 2002 16:32:45 -0000       1.6
+++ LVM/tools/lib/pv_show.c     13 Feb 2002 10:24:36 -0000
@@ -86,16 +86,18 @@
       printf ( " Physical volume ---\n");
       printf ( "PV Name               %s\n", pv->pv_name);
       printf ( "VG Name               %s\n", pv->vg_name);
-      printf ( "PV Size               %s",
-               ( dummy = lvm_show_size ( pv->pv_size / 2, SHORT)));
+      printf ( "PV Size               %s [%u secs]",
+               ( dummy = lvm_show_size ( pv->pv_size / 2, SHORT)), pv->pv_size);
       free ( dummy);
       if ( pv->pe_size != 0 && pv->pe_total != 0) {
          printf ( " / NOT usable %s ",
-                  ( dummy = lvm_show_size ( ( pv->pv_size - pv->pe_size * pv->pe_total) / 2, SHORT)));
+                  ( dummy = lvm_show_size ( ( pv->pe_on_disk.base + pv->pe_on_disk.size) / 1024, SHORT)));
          free ( dummy);
          printf ( "[LVM: %s]",
                   ( dummy = lvm_show_size ( ( pv->pe_on_disk.base +
-                                        pv->pe_total * sizeof ( pe_disk_t)) / 1024,
+                                              pv->pe_total *
+                                              sizeof ( pe_disk_t))
+                                            / 1024,
                                         SHORT)));
          free ( dummy);
       }

On Wed, Feb 13, 2002 at 09:50:02AM +0100, Turbo Fredriksson wrote:
> One of my PV's have krashed. I have a replacement disk, but
> I don't know exactly how big the PV was, so that I can recreate
> the PV...
> 
> 'vgcfgrestore -ll' only shows me '15.55 GB', so that's useless...
> 
> World Trade Center Qaddafi Semtex tritium quiche Marxist ammunition
> Peking smuggle arrangements Serbian North Korea Iran Cocaine KGB
> [See http://www.aclu.org/echelonwatch/index.html for more about this]
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
