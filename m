From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Strange lvm on raid1 on top of multipath problem
Message-ID: <20030602113636.C5039@sistina.com>
References: <200305291506.29805.krienke@uni-koblenz.de>
Mime-Version: 1.0
In-Reply-To: <200305291506.29805.krienke@uni-koblenz.de>; from krienke@uni-koblenz.de on Thu, May 29, 2003 at 03:06:25PM +0200
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
Date: Mon Jun  2 04:47:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

LVM1 is likely struggling with your multi-level MD setup :(
(it should be able to handle a one-level MD config fine)

LVM2s device name filters can handle this much better, because you
can exclude md13 and md10 from being recognized by the LVM2 tools in
/etc/lvm/lvm.conf.

Regards,
Heinz    -- The LVM Guy --


On Thu, May 29, 2003 at 03:06:25PM +0200, Rainer Krienke wrote:
> Hello,
> 
> I'am in trouble running lvm (lvm-1.0.6 on a suse8.2 system with kernel 2.4.20) 
> on a raid md device which in turn is based on two md multiptah devices:
>  
>                          /dev/md20  (raid1)
>               /dev/md10 (mp)     /dev/md13 (mp)   mp=multipath
>     	         disk1                              disk2
> 
> cat /proc/mdstat says this (just to make things clearer):
> 
> md20 : active raid1 md10[0] md13[1]
>       903371648 blocks [2/2] [UU]
> 
> md13 : active multipath sde2[0] sdh2[1]
>       903371712 blocks [2/2] [UU]
> 
> md10 : active multipath sdd1[0] sdg1[1]
>       903373696 blocks [2/2] [UU]
> 
> The basic setup worked just fine. I created one physikal volume on /dev/md20 
> (800GB) then one volumegroup "data" and then several logical volumes. So far 
> everything was fine. Then I deleted one logical volume and trouble started. 
> After the deletion I can no longer run vgscan. It keeps telling me (please 
> see attachment for vgscan -d output):
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "data"
> vgscan -- ERROR "pv_check_consistency_all_pv(): PE" volume group "data" is 
> inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "data"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "data" 
> from "/etc/lvmtab"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> I noticed that something must have gone wrong with the physical volume. It 
> seems to me that lvm did not only recognice the physical volume on /dev/md20 
> but somehow also on the underlying sub mirror devices /dev/md10 and 
> /dev/md13. Right after I created the logical volumes lvmdiskscan showed this:
> ...
> lvmdiskscan -- /dev/md10   [     861.52 GB] free meta device
> lvmdiskscan -- /dev/md13   [     861.52 GB] free meta device
> lvmdiskscan -- /dev/md20   [     861.52 GB] USED LVM meta device
> ...
> 
> Since the deletion of the logical volume it says:
> 
> ...
> lvmdiskscan -- /dev/md10   [     861.52 GB] USED LVM meta device
> lvmdiskscan -- /dev/md13   [     861.52 GB] USED LVM meta device
> lvmdiskscan -- /dev/md20   [     861.52 GB] USED LVM meta device
> ...
> 
> Is there any known problem with lvm on raid1 on top of multipath devices? 
> Could it be that lvm wrote a pv-signature not only one the real physical 
> volume on /dev/md20 but also on /dev/md10 and /dev/md13 or is this a suse 
> bug?
> 
> I have to note that I did the changes to the PVs, VGs, LVs all with yast from 
> suse not with the pv* vg* lv* commandline tools. Is this a know source of 
> trouble?
> 
> Would  be very greatful for any help since the system in question actually 
> should go into production very soon.....
> 
> Thanks Rainer
> -- 
> ---------------------------------------------------------------------------
> Rainer Krienke, Universitaet Koblenz, Rechenzentrum
> Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
> Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
> Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
> ---------------------------------------------------------------------------

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
