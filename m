content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <82706A2FAC4D08468A1652B4B7DD0C44CAC9E8@mx1.bouvet.no>
From: "Kjetil H. Paulsen" <kjetil.paulsen@bouvet.no>
Subject: [linux-lvm] Volume damaged, help please...
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
Date: Wed Dec  3 02:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

Still struggling with the disk loss. My logical volume is still mounted:
(df -h -> /dev/vol_grp/big      244G   93G  141G  40% /stuff/archive)

I can read the data in volume, however, I can't write to it, not so
strange I guess since the size isn't really 244G, but more like 180G
after the disk loss. When I run a=20
pvscan I get:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdh"  is associated to unknown VG "vol_grp"
(run vgscan)
pvscan -- ACTIVE   PV "/dev/hde"  is associated to unknown VG "vol_grp"
(run vgscan)
pvscan -- ACTIVE   PV "/dev/hdf"  is associated to unknown VG "vol_grp"
(run vgscan)
pvscan -- ACTIVE   PV "/dev/hda" of VG "vol_grp_small" [21.05 GB / 0
free]
pvscan -- ACTIVE   PV "/dev/hdb" of VG "vol_grp_small" [28.62 GB / 0
free]
pvscan -- total: 5 [258.43 GB] / in use: 5 [258.43 GB] / in no VG: 0 [0]

Trying to run vgscan:
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vol_grp"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "vol_grp" from physical volume(s)
vgscan -- found active volume group "vol_grp_small"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

So, getting a new disk of same type isn't an option, is there anyway
else I can repair this and reduce the logical volume and the file system
size without losing my data???
Any help appreciated.....


/kjetilhp
