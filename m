From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001301356.OAA06686@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My first time)
In-Reply-To: <3893A2CA.7E7BE688@alwan.com> from Chris Anderson at "Jan 29, 2000  8:32:42 pm"
Date: Sun, 30 Jan 2000 14:56:51 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Heinz Mauelshagen wrote:
> 
> > > Heinz Mauelshagen wrote:
> > >
> > > > Please have a look at the BUGS file on the <ftp://linux.msede.com/lvm/v0.8>
> > > > as well. The fixes in there should help.
> > >
> > > Thanks.  I just found that right before this email.
> >
> > Good.
> >
> > >
> > > Not that this is a big problem but maybe a little bug:
> > >
> > > $ vgdisplay -A
> > > Segmentation fault (core dumped)
> 
> $  /sbin/vgdisplay -dA
> lvm_check_kernel_lvmtab_consistency -- CALLED
> vg_check_active_all_vg -- CALLED
> vg_status_get_count -- CALLED
> vg_status_get_count -- LEAVING with ret: 0  and  count: 1
> vg_status_get_namelist -- CALLED
> vg_status_get_namelist -- LEAVING
> vg_check_active_all_vg -- LEAVING
> lvm_tab_vg_check_exist_all_vg -- CALLED
> lvm_tab_read -- CALLED
> lvm_tab_read -- LEAVING with ret: 0  data: 804B740  size: 8
> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
> lvm_check_kernel_lvmtab_consistency -- LEAVING with ret: 1
> lvm_get_iop_version -- CALLED
> lvm_get_iop_version -- AFTER ioctl ret: 0
> lvm_get_iop_version -- LEAVING with ret: 0
> vg_check_active_all_vg -- CALLED
> vg_status_get_count -- CALLED
> vg_status_get_count -- LEAVING with ret: 0  and  count: 1
> vg_status_get_namelist -- CALLED
> vg_status_get_namelist -- LEAVING
> vg_check_active_all_vg -- LEAVING
> vg_check_name -- CALLED
> vg_check_name -- vg_name: "main_vg"
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> vg_check_name -- LEAVING with ret: 0
> lvm_tab_vg_check_exist -- CALLED with vg_name: "main_vg"
> vg_check_name -- CALLED
> vg_check_name -- vg_name: "main_vg"
> lvm_check_chars -- CALLED
> lvm_check_chars -- LEAVING
> vg_check_name -- LEAVING with ret: 0
> lvm_tab_read -- CALLED
> Segmentation fault
> 

<SNIP>

Would you please be so kind as to change "free ( data);" to

   if ( data != NULL) {
      free ( data);
      data = NULL;
   } 

and recompile/retry.

Heinz
-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
