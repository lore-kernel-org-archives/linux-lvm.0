From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] duplicate volume group names
Message-ID: <20030417160638.B11844@sistina.com>
References: <20030414203656.GA7936@ubik>
Mime-Version: 1.0
In-Reply-To: <20030414203656.GA7936@ubik>; from pokryfka@druid.if.uj.edu.pl on Mon, Apr 14, 2003 at 10:36:56PM +0200
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
Date: Thu Apr 17 09:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Michal,

detach the 2nd HDD, vgrename "vg0" to something, reattach the 2nd HDD,
run "vgscan;vgchange -ay" and you should be able to access both.
Keep necessary /etc/fstab changes in mind doing so.

Regular procedure for such VG moves from one computer to another is
"vgchange -an VG ; vgexport VG" on the 1st one, move PVs to the 2nd computer
and run "vgimport VG PVPath [PVPath...]" there.

Regards,
Heinz    -- The LVM Guy --



On Mon, Apr 14, 2003 at 10:36:56PM +0200, MichalAdamczak wrote:
> hi,
> 
> ------------
> 
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "vg0"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> # vgchange -a y
> vgchange -- volume group "vg0" already active
> 
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/ide/host2/bus0/target0/lun0/part3" of VG
> "vg0" [55.71 GB / 14.14 GB free]
> pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part3" of VG
> "vg0" [37.07 GB / 280 MB free]
> pvscan -- total: 2 [92.79 GB] / in use: 2 [92.79 GB] / in no VG: 0 [0]
> 
> ----------
> 
> and the question:
> is it possible to get data from the second hdd if it has the same volume
> name?
> the second hardrive comes from a different computer and has nothing to
> do with the 'vg0' of the first (system) hdd
> 
> do i need to change the name of the volume group name of the system disk
> first?
> 
> regards
> 
> ps. plz respond to private email as i am not subscribed to the list
> 
> -- 
> Michal Adamczak
> pokryfka @ druid.if.uj.edu.pl
> GS dpu C+++ UL+++++ L+++(++++) w--- !tv h*
> I code AND I bathe. (seen on slashdot)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
