From: Adam McDaniel <adamm@array.org>
Subject: Re: [linux-lvm] accidently formatted a physical volume...
Message-ID: <20020820175543.GA8709@grimlock>
References: <20020819192319.GB25631@grimlock> <284650000.1029786116@[192.168.200.4]> <1265620671.20020819224124@tnonline.net> <20020819205005.GA26781@grimlock> <3D6159EA.1070406@birddog.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <3D6159EA.1070406@birddog.com>
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
Date: Tue Aug 20 12:56:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2002 at 03:49:46PM -0500, Kirby C. Bohling wrote:
> I'd imagine that doing a vgcfgrestore to the device, followed by=20
> mounting the filesystem without fsck'ing it will get you some data.=20

Unfortunatly, I don't have any data for vgcfgrestore to build upon.
Here's the current status:

/dev/loop0 is pointing to /root/lvm/hde1
/dev/loop1 is pointing to /root/lvm/hdf1
(built via 'dd if=3D/dev/hd?1 of=3D/root/lvm/hd?1')

/dev/loop0 is the good image
/dev/loop1 is the fubar'd one.

pvdisplay /dev/loop0:

---
PV Name               /dev/loop0
VG Name               data
PV Size               14.31 GB [30009357 secs] / NOT usable 1.01 MB [LVM: 1=
35 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              3663
Free PE               0
Allocated PE          3663
PV UUID               3IRYim-Lpgb-2N1Y-6TPu-C8mZ-58hy-exlmBm
---

pvdisplay /dev/loop1:

---
PV Name               /dev/loop1
VG Name               data
PV Size               9.44 GB [19792017 secs] / NOT usable 4.07 MB [LVM: 13=
0 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              2415
Free PE               0
Allocated PE          2415
PV UUID               P7xAxa-J36q-2C8i-2vKc-5KJO-2tQ6-H3eGiz
---

First I tried running pvscan:

---
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/loop0"  is associated to unknown VG "data" (run=
 vgscan)
pvscan -- inactive PV "/dev/loop1"  is associated to unknown VG "data" (run=
 vgscan)
pvscan -- total: 2 [23.75 GB] / in use: 2 [23.75 GB] / in no VG: 0 [0]
---

fair enough.. so I run vgscan -v:

---
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "data" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of vo=
lume group "data" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume gr=
oup
---

ofcourse /etc/lvmtab and /etc/lvmtab.d/* are all blank/empty.

If anything, I'm just about at the point where the dead drive is a
writeoff (/dev/loop1).. but I would like to try to salvage the data on
/dev/loop0

Any ideas?

Thanks.

--=20
Adam McDaniel
Array Networks
Calgary, AB, Canada

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9YoKfIHy9fg7fMMMRAqp1AJ9YaW/5W+NaECvigv5HwWJaQD8J7QCfS2P6
qm94mey7UKM00APNmio/m8s=
=M+ln
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
