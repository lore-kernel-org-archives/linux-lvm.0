Return-Path: <jones@hpc.utexas.edu>
Message-Id: <4.2.0.58.20010113145757.01bc3820@127.0.0.1>
Date: Sat, 13 Jan 2001 14:59:29 -0600
From: "William L. Jones" <jones@tacc.cc.utexas.edu>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available
  at www.sistina.com
In-Reply-To: <20010113190810.A5517@fb0442.mathematik.tu-darmstadt.de>
References: <20010113170408.A4296@gondor.com>
 <20010113011532.B21587@srv.t-online.de>
 <20010113170408.A4296@gondor.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.comlinux-lvm@sistina.com

Please fix this problem.  I just a hour banging my head the wall tring to track
down this problem.    It really can trip you up.

Bill Jones



At 07:08 PM 1/13/01 +0100, Holger Grothe wrote:
>On Sat, Jan 13, 2001 at 05:04:08PM +0100, Jan Niehusmann wrote:
> > On Sat, Jan 13, 2001 at 01:15:32AM +0000, Heinz J. Mauelshagen wrote:
> > > We'ld appreciate a couple of days for test feedback before pushing a 
> 2.4.0
> > > patch to Linus.
> >
> > It still has the problem I reported on Dec 22. On Dec 23 I wrote:
> >
> > : Ok, I found the problem: The sort order of the pv's is wrong, and 0.9 is
> > : missing the code that sorts them. 0.8final's pv_read_all_pv_of_vg.c 
> contains
> > :
> > :       for ( p = 0; pv_tmp[p] != NULL; p++) {
> > :          if ( strcmp ( pv_tmp[p]->vg_name, vg_name) == 0) {
> > :             pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
> > :             np++;
> > :          }
> > :       }
> > :
> > : and 0.9's doesn't.
>
>You can see the problem Jan mentioned very easily.
>
># pvcreate /dev/hda2 /dev/hdc2
>pvcreate -- physical volume "/dev/hda2" successfully created
>pvcreate -- physical volume "/dev/hdc2" successfully created
># vgcreate vg00 /dev/hda2 /dev/hdc2
>vgcreate -- INFO: using default physical extent size 4 MB
>vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
>vgcreate -- doing automatic backup of volume group "vg00"
>vgcreate -- volume group "vg00" successfully created and activated
># vgscan
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- found active volume group "vg00"
>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>vgscan -- WARNING: This program does not do a VGDA backup of your volume group
>
>All is fine. But if vg00 is created with
>
># vgcreate vg00 /dev/hdc2 /dev/hda2
>vgcreate -- INFO: using default physical extent size 4 MB
>vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
>vgcreate -- doing automatic backup of volume group "vg00"
>vgcreate -- volume group "vg00" successfully created and activated
># vgscan
>vgscan -- reading all physical volumes (this may take a while...)
>vgscan -- found active volume group "vg00"
>vgscan -- ERROR "pv_check_consistency_all_pv(): PE" volume group "vg00" is 
>inconsistent
>vgscan -- ERROR: unable to do a backup of volume group "vg00"
>vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "vg00" 
>from "/etc/lvmtab"
>vgscan -- ERROR "lvm_tab_vg_remove(): unlink" creating "/etc/lvmtab" and 
>"/etc/lvmtab.d
>
>The following patch from Jan (with a minor correction "against" segfaults :-)
>corrected the problem for me:
>------------------------------------------------------------------------------
>*** pv_read_all_pv_of_vg.c.orig Mon Nov 20 03:47:20 2000
>--- pv_read_all_pv_of_vg.c.patched      Sat Jan 13 18:31:00 2001
>***************
>*** 101,117 ****
>         for ( p = 0; pv_tmp[p] != NULL; p++) {
>            if ( strncmp ( pv_tmp[p]->vg_name, vg_name, NAME_LEN) == 0) {
>               pv_this_sav = pv_this;
>               if ( ( pv_this = realloc ( pv_this,
>!                                        ( np + 2) * sizeof ( pv_t*))) == 
>NULL) {
>                  fprintf ( stderr, "realloc error in %s [line %d]\n",
>                                    __FILE__, __LINE__);
>                  ret = -LVM_EPV_READ_ALL_PV_OF_VG_MALLOC;
>                  if ( pv_this_sav != NULL) free ( pv_this_sav);
>                  goto pv_read_all_pv_of_vg_end;
>               }
>!             pv_this[np] = pv_tmp[p];
>!             pv_this[np+1] = NULL;
>!             np++;
>            }
>         }
>
>--- 101,117 ----
>         for ( p = 0; pv_tmp[p] != NULL; p++) {
>            if ( strncmp ( pv_tmp[p]->vg_name, vg_name, NAME_LEN) == 0) {
>               pv_this_sav = pv_this;
>+           if ( np < pv_tmp[p]->pv_number) np = pv_tmp[p]->pv_number;
>               if ( ( pv_this = realloc ( pv_this,
>!                                        ( np + 1) * sizeof ( pv_t*))) == 
>NULL) {
>                  fprintf ( stderr, "realloc error in %s [line %d]\n",
>                                    __FILE__, __LINE__);
>                  ret = -LVM_EPV_READ_ALL_PV_OF_VG_MALLOC;
>                  if ( pv_this_sav != NULL) free ( pv_this_sav);
>                  goto pv_read_all_pv_of_vg_end;
>               }
>!           pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
>!             pv_this[np] = NULL;
>            }
>         }
>
>------------------------------------------------------------------------------
>
>HTH, Holger
>--
>Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
>Fachbereich Mathematik, TU Darmstadt
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
