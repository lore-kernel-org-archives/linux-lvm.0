Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103232236.f2NMa5h24294@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
In-Reply-To: <3ABB63F7.F776CCEA@in.tum.de> from David Vidal Rodriguez at "Mar
 23, 2001 03:55:52 pm"
Date: Fri, 23 Mar 2001 15:36:05 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

You write:
> > You don't need the beta6 kernel patch to run vgcfgrestore to restore UUIDs,
> > only the beta6 user tools.
> 
> OK, but see what appears if I try to restore the VGDA... (the messages aren't
> exact)
> 
> # vgcfgrestore -n <vg_name> -f <vgda_backup> <path_to_pv>
> Error "parameter error" while trying to restore

Bug in the code.  Exact error would help.

> # cp <vgda_backup> /etc/lvmtab.d/<vg_name>
> # vgcfgrestore -n <vg_name> <path_to_pv>
> vgcfgrestore -- VGDA of vg <vg_name> successfully restored in <path_to_pv>
> 
> # pvdata -U <path_to_pv>
> List of UUIDs:
> uuid0: <uuid1>
> uuid1: <uuid2>
> uuid2: --EMPTY--

It _should_ work, but why it doesn't, I don't know.  Can you try running
"vgcfgrestore -v -d -n <vg_name> <path_to_pv>" and send the output
(compressed probably).

If possible, apply the following patch first, so we can be sure that it is
doing the right thing.

Cheers, Andreas
=========================================================================
diff -u -u -r1.1.2.2 pv_write_uuidlist.c
--- tools/lib/pv_write_uuidlist.c	2001/02/19 10:04:34	1.1.2.2
+++ tools/lib/pv_write_uuidlist.c	2001/03/23 22:27:15
@@ -45,7 +45,7 @@
    int size = 0;
    char *pv_uuid_list = NULL;
 
-   debug_enter ( "pv_write_uuidlist -- CALLED\n");
+   debug_enter ( "pv_write_uuidlist -- CALLED for %s\n", pv_name);
 
    if ( pv_name == NULL || pv_check_name ( pv_name) < 0 ||
         vg == NULL || vg_check_name ( vg->vg_name) < 0) ret = -LVM_EPARAM;
@@ -77,6 +79,8 @@
             memcpy(u, pv->pv_uuid, UUID_LEN);
             u += NAME_LEN;
          }
+         debug( "pv_write_uuidlist -- writing %d UUIDs on %s\n",
+                ( u - pv_uuid_list) / NAME_LEN, pv_name);
          if ( write ( pv_handle, pv_uuid_list, size) != size)
             ret = -LVM_EPV_WRITE_UUIDLIST_WRITE;
          free ( pv_uuid_list);
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
