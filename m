From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001301813.TAA08383@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My first time)
In-Reply-To: <38945D85.256215BF@alwan.com> from Chris Anderson at "Jan 30, 2000  9:49:25 am"
Date: Sun, 30 Jan 2000 19:13:05 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Chris,
IMO there's no obvious reason, why it should core there with size == 8.

Do you have an old libc in place by accident which might give us a
reason to assume an broken malloc()?
If so: try with an actual one.

Any ideas from other list members?

Heinz

> Heinz Mauelshagen wrote:
> 
> > > Heinz Mauelshagen wrote:
> > >
> > > > > Heinz Mauelshagen wrote:
> > > > >
> > > > > > Please have a look at the BUGS file on the <ftp://linux.msede.com/lvm/v0.8>
> > > > > > as well. The fixes in there should help.
> > > > >
> > > > > Thanks.  I just found that right before this email.
> > > >
> > > > Good.
> > > >
> > > > >
> > > > > Not that this is a big problem but maybe a little bug:
> > > > >
> > > > > $ vgdisplay -A
> > > > > Segmentation fault (core dumped)
> > >
> > > $  /sbin/vgdisplay -dA
> > > lvm_check_kernel_lvmtab_consistency -- CALLED
> > > vg_check_active_all_vg -- CALLED
> > > vg_status_get_count -- CALLED
> > > vg_status_get_count -- LEAVING with ret: 0  and  count: 1
> > > vg_status_get_namelist -- CALLED
> > > vg_status_get_namelist -- LEAVING
> > > vg_check_active_all_vg -- LEAVING
> > > lvm_tab_vg_check_exist_all_vg -- CALLED
> > > lvm_tab_read -- CALLED
> > > lvm_tab_read -- LEAVING with ret: 0  data: 804B740  size: 8
> > > lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
> > > lvm_check_kernel_lvmtab_consistency -- LEAVING with ret: 1
> > > lvm_get_iop_version -- CALLED
> > > lvm_get_iop_version -- AFTER ioctl ret: 0
> > > lvm_get_iop_version -- LEAVING with ret: 0
> > > vg_check_active_all_vg -- CALLED
> > > vg_status_get_count -- CALLED
> > > vg_status_get_count -- LEAVING with ret: 0  and  count: 1
> > > vg_status_get_namelist -- CALLED
> > > vg_status_get_namelist -- LEAVING
> > > vg_check_active_all_vg -- LEAVING
> > > vg_check_name -- CALLED
> > > vg_check_name -- vg_name: "main_vg"
> > > lvm_check_chars -- CALLED
> > > lvm_check_chars -- LEAVING
> > > vg_check_name -- LEAVING with ret: 0
> > > lvm_tab_vg_check_exist -- CALLED with vg_name: "main_vg"
> > > vg_check_name -- CALLED
> > > vg_check_name -- vg_name: "main_vg"
> > > lvm_check_chars -- CALLED
> > > lvm_check_chars -- LEAVING
> > > vg_check_name -- LEAVING with ret: 0
> > > lvm_tab_read -- CALLED
> > > Segmentation fault
> > >
> >
> > <SNIP>
> >
> > Would you please be so kind as to change "free ( data);" to
> >
> >    if ( data != NULL) {
> >       free ( data);
> >       data = NULL;
> >    }
> 
> Only found one of these in lvm_tab_vg_check_exist.c
> 
> But it cores in the lvm_tab_read.c function at the else if
> 
> around line 70 (not sure because of my debug code)
> 
> The below code is the problem.
> 
>          else if ( ( buffer = malloc ( stat_b.st_size)) == NULL) {
>            ret =  -LVM_ELVM_TAB_READ_MALLOC;
> 
> I placed debug statements in it to see this.
> 
> Note that stat_b.st_size = 8
> 
> I hope this helps.  I do not know enough (yet) about the code to know what buffer is
> and why it is setup this way.
> 
> >
> >
> > and recompile/retry.
> >
> > Heinz
> > --

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
