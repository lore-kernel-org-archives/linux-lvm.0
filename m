From: Thorsten Pawlak <tpawlak@uni-paderborn.de>
Message-ID: <Pine.SOL.4.44.0209042228030.7297-100000@knecht>
MIME-Version: 1.0
Subject: [linux-lvm] vgscan -- only found 28926 of 28672 LEs for LV /dev/data/home (0)
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
Date: Wed Sep  4 15:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hello,

i've got a problem with lvm 1.0.5 (after upgrade from 1.0.3). I made a
vgreduce /dev/hdf1. It works fine but after the next reboot I can't access
my VG, a vgscan makes this:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- only found 28926 of 28672 LEs for LV /dev/data/home (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "data" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "data" (run
vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "data" (run
vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "data" (run
vgscan)
pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "data" (run
vgscan)
pvscan -- inactive PV "/dev/hda3"  is associated to unknown VG "data" (run
vgscan)
pvscan -- total: 5 [242.76 GB] / in use: 5 [242.76 GB] / in no VG: 0 [0]


I've tried nearly everything:
downgrading back to 1.0.3
pvcreate -yff /dev/hdxx and vgcfgrestore -n data /dev/xx
...

perhaps someone can help me.

thanks in advance!

Thorsten Pawlak
