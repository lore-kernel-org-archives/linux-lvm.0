Return-Path: <root@srv.sistina.com>
Date: Wed, 7 Feb 2001 21:36:03 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with LVM.
Message-ID: <20010207213603.R8914@srv.sistina.com>
References: <Pine.LNX.4.20.0102072051410.604-100000@menswerk.cyclone.se>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.20.0102072051410.604-100000@menswerk.cyclone.se>; from h@ns.engren.org on Wed, Feb 07, 2001 at 09:01:26PM +0100
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

This is most likely fixed with my recent code change to pv_read_all_pv_of_vg.c.
Could you check the recent CVS code or wait for 0.9.1 beta4 which we like
to release tomorrow?

Thanks,
Heinz

On Wed, Feb 07, 2001 at 09:01:26PM +0100, Hans Engren wrote:
> 
> Hi,
> 
> After rebooting my system a couple of days ago, I ran into a real strange
> problem with the volume group "mw1" I am using.
> 
> Doing a vgscan locates no volume groups what so ever.
> After doing a `vgcfgrestore -f /etc/lvmconf/mw1.conf -n mw1 /dev/<DISK>`,
> I am able to do a `vgchange -a y`, and actually mount /dev/mw1/ftpd.
> 
> Doing a vgscan at this point locates no volume groups either.
> 
> This means that I can't mount the volume group automatically during
> bootup, neither can I use any of the vg* commands in the system. I am just
> able to use the volume group as it is, for data storage, without any
> possibility to use the LVM features.
> 
> I tried to reboot the system, used vgcfgrestore to re-add the
> configuration to the disks, and do a vgcfgbackup after that. It produces
> the following (with -v):
> 
> vgcfgbackup -- finding all volume groups
> vgcfgbackup -- volume group found: mw1 
> vgcfgbackup -- locking logical volume manager
> vgcfgbackup -- checking volume group name "mw1"
> vgcfgbackup -- checking existence of volume group "mw1"
> vgcfgbackup -- ERROR: volume group "mw1" has an invalid number of physical volumes
> vgcfgbackup -- ERROR "vg_cfgbackup(): vg_check_exist" backing up volume group "mw1"
> 
> Output from pvscan:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sda"  is in no VG  [4 GB]
> pvscan -- inactive PV "/dev/sdb1" of VG "mw1" [3.99 GB / 0 free]
> pvscan -- inactive PV "/dev/sdc"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sde"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdf"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdg"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdh"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdi"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdj"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdk"  of VG "mw1" [8.43 GB / 0 free]
> pvscan -- inactive PV "/dev/sdl"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdm"  of VG "mw1" [8.43 GB / 0 free]
> pvscan -- inactive PV "/dev/sdn"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdo"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdp"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdq"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdr"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sds"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdt"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdu"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdv"  of VG "mw1" [4 GB / 0 free]
> pvscan -- inactive PV "/dev/sdw"  of VG "mw1" [4 GB / 264 MB free]
> pvscan -- inactive PV "/dev/hdb1" of VG "mw1" [57.24 GB / 0 free]
> pvscan -- inactive PV "/dev/hdc1" of VG "mw1" [16.11 GB / 0 free]
> pvscan -- inactive PV "/dev/hdd1" of VG "mw1" [16.11 GB / 0 free]
> pvscan -- total: 25 [186.3 GB] / in use: 24 [182.3 GB] / in no VG: 1 [4 GB]
> 
> I hope you see what my problem is, otherwise, tell me what output that
> would be needed, and I'll provide it.
> 
> Thank you.
> 
>  -- Hans.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
