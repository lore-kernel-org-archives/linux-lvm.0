Date: Mon, 10 Sep 2001 00:16:43 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010910001643.A19424@vestdata.no>
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15f8l7-0008Di-00@hermes.sistina.com> <20010907114303.C19457@vestdata.no> <E15fJux-0005Kk-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <E15fJux-0005Kk-00@hermes.sistina.com>; from fejf@gmx.de on Fri, Sep 07, 2001 at 01:36:16PM +0200
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
To: linux-lvm@sistina.com

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


OK, this is the patch.

With this patch pe_move will not even try to lock the extent before
moving it. (because it would fail). I'm not sure exactly what
implications that has, but I would avoid using LVM when you're running
pe_move. I also removed the code that unlock the extent - but only for
the standard execution path - if any other errors occur pe_move will try
to unlock the extent. 

Another problem is that the file possition in the source is undefined
after a failed read - so if you move several extents at the same time,
chances are that pe_move will read the broken extent over and over
again, instead of reading first the broken extent and then other extent
- it will in other words destroy your data.

This patch was written specificly to fix a problem with LVM on one of
our workstations, and it is not intended for general use! If you still
choose to try it, i recommend first moving all the extents you can move
with the regular pe_move command - then install this one and move the
remaining extents one by one.

Be aware that you have to do make install to use it (or use
LD_LIBRARY_PATH), as the library is linken in dynamicly - if you do make
install - be sure to install the proper utilities afterwards so you
don't risk running this modified pe_move by accident later.

You have been warned....



-- 
Ragnar Kjorstad
Big Storage

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="LVM_ignore_read_errors.patch2"

diff -u -r LVM/1.0.1-rc2/tools/lib/pv_move.c LVM_ignore_read_errors/1.0.1-rc2/tools/lib/pv_move.c
--- LVM/1.0.1-rc2/tools/lib/pv_move.c	Thu Jul 19 17:19:01 2001
+++ LVM_ignore_read_errors/1.0.1-rc2/tools/lib/pv_move.c	Mon Sep 10 00:06:47 2001
@@ -494,12 +494,14 @@
    if ( opt_t == 0) {
       int lv_num = vg->pv[dst_pv_index]->pe[pe_dest].lv_num;
 
+/* Don't even try to lock
       if ( ( ret = pe_lock ( vg->vg_name, vg->pv[src_pv_index]->pv_dev,
                              le_remap_req.old_pe, vg->vg_number,
                              lv_num, vg->lv[lv_num-1]->lv_dev)) < 0) {
          ret = -LVM_EPV_MOVE_PE_LOCK;
-         goto pv_move_pe_end;
+         goto pv_move_pe_end; 
       }
+*/
    }
 
 
@@ -521,9 +523,13 @@
             fprintf ( stderr, "%s -- ERROR reading input "
                               "physical volume \"%s\" (still %d bytes to read)\n\n",
                       cmd, vg->pv[src_pv_index]->pv_name, size);
+	    fprintf( stderr, " -- IGNORED \n");
+	/*
             pe_unlock ( vg->vg_name);
             ret = -LVM_EPV_MOVE_PE_READ_IN;
             goto pv_move_pe_end;
+	*/
+	    red=to_read;
          }
          to_write = red;
       }
@@ -570,8 +576,9 @@
                            cmd, lvm_error ( ret),
                            pe_source,
                            vg->pv[src_pv_index]->pv_name);
-         ret = -LVM_EPV_MOVE_PE_UNLOCK;
-         goto pv_move_pe_end;
+	fprintf( stderr, "IGNORED\n");
+     /*    ret = -LVM_EPV_MOVE_PE_UNLOCK;
+         goto pv_move_pe_end; */
       }
    }
 

--J2SCkAp4GZ/dPZZf--
