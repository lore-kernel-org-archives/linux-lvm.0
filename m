From: Andreas Pakulat <ap125@informatik.uni-rostock.de>
Subject: Re: [linux-lvm] Repair inconsistent PV
In-reply-to: <20030816154556.GA23415@debian.pakulat>
Message-id: <20030817012336.GA26462@debian.pakulat>
MIME-version: 1.0
Content-type: multipart/signed; boundary=AqsLC8rIMeq19msA;
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-disposition: inline
References: <20030816154556.GA23415@debian.pakulat>
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
Date: Sun Aug 17 12:03:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16.Aug 2003 - 17:45:56, Andreas Pakulat wrote:
> Hi,
>=20
> yesterday I lost my / partition due to hardware problem. Now to reinstall
> the system I had to reduce the size of my VG, i did that using the
> KNOPPIX CD and first all went Ok. But during the Removal of one LV one
> harddisk "crashed", had several read errors. I could fix this, as It was
> due to a broken connection to the drive. But now the PV that was on that
> drive is inconsisten:
>=20
> root@tty2[/]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "vgmatrix"
> vgscan -- ERROR "pv_check_consistency_all_pv(): PE" volume group
> "vgmatrix" is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "vgmatrix"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group
> "vgmatrix" from "/etc/lvmtab"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> root@tty2[/]#
>=20
> If i do a pvcreate -ff /dev/hdc2 the inconsistency is gone, but also the
> metadata and as my / is also gone, I have no backup of the
> Metadata. So the Question is, can I somehow repair the PV Metadata or am
> I lost? It is also hard for me at the moment to get a Kernel with
> device-mapper support, so using LVM2 is only the last option for me.
>=20
> Please say if you need any additional Information, here is pvdisplay=20
> of the problematic PV:
>=20
> root@tty2[/]# pvdisplay -v /dev/hdc2
> --- Physical volume ---
> PV Name               /dev/hdc2
> VG Name               vgmatrix
> PV Size               5.84 GB [12241530 secs] / NOT usable 4.19 MB [LVM:
> 133 KB]
> PV#                   2
> PV Status             available
> Allocatable           NO
> Cur LV                2
> PE Size (KByte)       4096
> Total PE              1493
> Free PE               444
> Allocated PE          1049
> PV UUID               v7FOLU-uCS4-ZD8R-2z6S-GIKR-RCbf-RI2Nax

I now installed a 2.6.0-test2 Kernel and tried to get further using
lvm2. From that I know that the VG Metadata differs between the PV on
hdc2 and the PV on hda7. I also experimented with the Partial-Option but
the LV I need cannot be mounted ;( Is there a way to create the
VG-Metadata of one PV from the Data on the other? How? I could create a
text-file using vgcfgbackup from lvm2, the interesting thing is that it
contains the PV-Data from hdc2, but I think that is the PV with the
wrong Information. Anyway I hope someone here can help me soon.

Andreas

--=20
Verwirrung ist die h=F6chste Form der Kommunikation.
		-- Dali

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/PtkYuekl0h+nrMIRAhHnAKCiYoWDQpvOIKXjQgM2H5D5/YqZ/gCguW5F
OVGqN3XcFuDIsdYZxxfD+xw=
=sbOO
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
