Date: Wed, 17 Mar 2004 15:34:13 +0100
From: Heinz Mauelshagen <heinzm@redhat.com>
Subject: Re: [linux-lvm] Hard disk failure, restore problem
Message-ID: <20040317143413.GB14348@redhat.com>
References: <40520E04.5090505@howest.be> <20040315124721.GB17078@redhat.com>
	<40561772.5070302@howest.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40561772.5070302@howest.be>
Reply-To: heinzm@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Berton <thomas.berton@howest.be>
Cc: hjm@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


Thomas,

don't run vgscan after the procedure below.

Remember this is a workaround *just* to get you to the point to be able
to backup your data and recreate your VG.

Run vgmknodes to create your device nodes in /dev/bigspace/
after step "vgchange -ay" below.

Regards,
Heinz    -- The LVM Guy --


On Mon, Mar 15, 2004 at 09:52:02PM +0100, Thomas Berton wrote:
> Hello,
> 
> I've done
> 
> > o identify your actual metadata backup (say, bigspace.conf)
> >
> > o mkdir /etc/lvmtab.d
> >
> > o cp bigspace.conf /etc/lvmtab.d/bigspace
> >
> > o echo -ne "bigspace\0" > /etc/lvmtab
> >
> > o vgchange -ay
> 
> 
> after being sure to restore the metadata I have
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdg1" of VG "bigspace" [74.47 GB / 768 MB free]
> pvscan -- inactive PV "/dev/hde1" of VG "bigspace" [149 GB / 0 free]
> pvscan -- inactive PV "/dev/hdf1" of VG "bigspace" [149 GB / 139.16 GB free]
> pvscan -- inactive PV "/dev/hdc1" of VG "bigspace" [111.75 GB / 0 free]
> pvscan -- inactive PV "/dev/hdd1" of VG "bigspace" [74.47 GB / 0 free]
> pvscan -- inactive PV "/dev/hda1" of VG "bigspace" [74.47 GB / 8.22 GB free]
> pvscan -- inactive PV "/dev/hdb1" of VG "bigspace" [74.47 GB / 0 free]
> pvscan -- total: 7 [708 GB] / in use: 7 [708 GB] / in no VG: 0 [0]
> 
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- only found 17904 of 17876 LEs for LV /dev/bigspace/bigspace1 (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "bigspace" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> => after the vgscan the echo -ne "bigspace\0" > /etc/lvmtab is gone gone
> again....
> 
> [root@ment root]# lvscan
> lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
> run vgscan
> 
> after doing the vgscan, I get
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- inactive PV "/dev/hda1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG
> "bigspace" (run vgscan)
> pvscan -- total: 7 [708 GB] / in use: 7 [708 GB] / in no VG: 0 [0]
> 
> again.
> 
> 
> the /dev/bigspace/bigspace1 doesn't exists, so I can't mount.
> 
> should I recreate bigspace and force an import ?
> 
> I 've alse rebooted once after the vgchange -ay, but he also didn't find
> the bigspace.
> 
> thanx again for your help!!
> 
> kind regards,
> Thomas.

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
