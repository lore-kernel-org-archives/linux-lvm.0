From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] crash
Message-ID: <20021009130523.B23965@sistina.com>
References: <Pine.LNX.4.44.0210071516210.13211-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0210071516210.13211-100000@server.piarista-kkt.sulinet.hu>; from nagyz@piarista-kkt.sulinet.hu on Mon, Oct 07, 2002 at 03:19:23PM +0200
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
Date: Wed Oct  9 06:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

NagyZ,

some of your PVs have faded away with the RAID controller.

BTW:
you can check with "pvdata -U /dev/hdm1" which UUIDs belong to "apolloftp".
"pvscan -u" tells you which ones are still accessable by comparing the UUIDs.

On Mon, Oct 07, 2002 at 03:19:23PM +0200, NagyZ wrote:
> hi!
> 
> i have some problem with lvm, after a crash, my raid controller has gone, 
> and i cant access my vg and lv -s..
> now:
> ~# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdm1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdi1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdj1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hda4"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "apolloftp" 
> (run vgscan)
> pvscan -- total: 9 [545.98 GB] / in use: 9 [545.98 GB] / in no VG: 0 [0]
> 
> lvscan:
> ~# lvscan
> lvscan -- no volume groups found
> 
> ~# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
> volume group "apolloftp" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> group
> 
> 
> 1, if i cant replace my the raid controloler, then how can i save my 
> datas?

You need to know, which extents of the LVs are NOT allocated to the gone PVs
(the ones accessable through the RAID controller). If that makes up some
complete LVs, you are able to access the data on those PVs. For the rest it
is unlikely, that the filesystem will like the data with holes in.

> 
> 2, if i can replace it, then it will be okay? vgscan and lvscan will work?

If your replacement controller will bring up the RAID devices fine -> Yes.
Run "vgscan ; vgchange -ay" and you should have your "apolloftp" VG back with
all its LVs.

> 
> 3, if the winchesters has gone, then what should i do? :)

You can try this hack in order to get the rest of your VG up:

# mkdir /etc/lvmtab.d
# cp /etc/lvmconf/apolloftp.conf /etc/lvmtab.d/apollo
# echo -ne "apollo\0" > /etc/lvmtab
# vgchange -ay

Don't run vgscan because it will remove /etc/lvmtab* again!

> 
> there was 12 winchester in lvm..

Remember to take backups of your data and *metadata*. For LVM the later
is /etc/lvmtab, /etc/lvmtab/* and /etc/lvmconf/*.

> 
> please help
> 
> NagyZ
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
