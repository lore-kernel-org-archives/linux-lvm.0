Message-ID: <47406.192.168.100.1.1038000111.squirrel@router.ebola>
Subject: Re: [linux-lvm] Recovery of LVM after kernelupdate (2.4.10 -> 2.4.19)
From: "Thomas Mellenthin" <melle@gmx.at>
In-Reply-To: <20021121114712.A8329@sistina.com>
References: <9282.1037748645@www19.gmx.net>
        <20021121114712.A8329@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Nov 22 15:49:10 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

> Under SuSE 8.1:
>         - what does vgscan display ?
router:/home/melle # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "hxvg01" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group
>         - what does pvscan display ? Does it show your PVs on hd[cd]1 ?
router:/home/melle # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "hxvg01"
(run vgscan)pvscan -- inactive PV "/dev/hdd1" is in no VG  [41.93 GB]
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "hxvg01"
(run vgscan)pvscan -- total: 3 [160.54 GB] / in use: 2 [118.62 GB] / in no VG: 1
[41.93 GB]
> No need to vgcfgrestore, because your metadata should still be on hd[cd]1
> unless you (or yast) write somethig onto hd[cd]1. You didn't create files
> systems during the update ther, did you ? ;)
uhm... no. But I created a logical volume on a new VG
(I thought it's just a naming problem and tried to create VG
and LV with the same names. Mounting the file system failed and
I stopped any 'experimental' actions). So the filesystem should
be ok, but the metadata on the PV is somehow damaged.

I guess that the job is to force the assignemt of /dev/hdd1 to
VG "hxvg01" and to make this VG 'known' to the LVM and activate
the PVs.
I'm a bit lost know, because I don't know how to 'write back'
these information from the hxvg01.conf file to the PVs.

Any help would be deeply appreciated.

// melle
