From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Message-ID: <Pine.LNX.4.44.0210071516210.13211-100000@server.piarista-kkt.sulinet.hu>
MIME-Version: 1.0
Subject: [linux-lvm] crash
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
Date: Mon Oct  7 08:43:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi!

i have some problem with lvm, after a crash, my raid controller has gone, 
and i cant access my vg and lv -s..
now:
~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdm1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdi1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdj1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hda4"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "apolloftp" 
(run vgscan)
pvscan -- total: 9 [545.98 GB] / in use: 9 [545.98 GB] / in no VG: 0 [0]

lvscan:
~# lvscan
lvscan -- no volume groups found

~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "apolloftp" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group


1, if i cant replace my the raid controloler, then how can i save my 
datas?

2, if i can replace it, then it will be okay? vgscan and lvscan will work?

3, if the winchesters has gone, then what should i do? :)

there was 12 winchester in lvm..

please help

NagyZ
