Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r76HbO60023135
	for <linux-lvm@redhat.com>; Tue, 6 Aug 2013 13:37:24 -0400
Received: from mail.waldi.eu.org (moeglingen.blank.eu.org [82.139.201.30])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r76HbLh2024848
	for <linux-lvm@redhat.com>; Tue, 6 Aug 2013 13:37:22 -0400
Date: Tue, 6 Aug 2013 19:37:19 +0200
From: Bastian Blank <waldi@debian.org>
Message-ID: <20130806173719.GB15184@mail.waldi.eu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
Subject: [linux-lvm] Missing error handling in lv_snapshot_remove
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

I tried to tackle a particular bug that shows up in Debian for some time
now. Some blamed the udev rules and I still can't completely rule them
out. But this triggers a much worse bug in the error cleanup of the
snapshot remove. I reproduced this with Debian/Linux 3.2.46/LVM 2.02.99
without udevd running and Fedora 19/LVM 2.02.98-10.fc19.

On snapshot removal, LVM first converts the device into a regular LV
(lv_remove_snapshot) and in a second step removes this LV
(lv_remove_single). Is there a reason for this two step removal? An
error during removal leaves a non-snapshot LV behind.

I hold the cow device open so it will run into the error condition:
| $ sleep 100 < /dev/mapper/vg-test_snap-cow&

Then try to remove the LV:
| $ lvremove vg/test_snap

lv_remove_snapshot first suspends all devices:

| #metadata/lv_manip.c:4429     Removing snapshot test_snap
| #libdm-deptree.c:1314     Suspending vg-test_base (253:8) with device flu=
sh
| #ioctl/libdm-iface.c:1724         dm suspend   (253:8) NFS    [16384] (*1)
| #libdm-common.c:210         Suspended device counter increased to 1
| #ioctl/libdm-iface.c:1724         dm info   (253:9) NF   [16384] (*1)
| #libdm-deptree.c:1314     Suspending vg-test_snap (253:9) with device flu=
sh
| #ioctl/libdm-iface.c:1724         dm suspend   (253:9) NFS    [16384] (*1)
| #libdm-common.c:210         Suspended device counter increased to 2
| #ioctl/libdm-iface.c:1724         dm info   (253:10) NF   [16384] (*1)
| #libdm-deptree.c:1314     Suspending vg-test_base-real (253:10) with devi=
ce flush
| #ioctl/libdm-iface.c:1724         dm suspend   (253:10) NFS    [16384] (*=
1)
| #libdm-common.c:210         Suspended device counter increased to 3
| #ioctl/libdm-iface.c:1724         dm info   (253:11) NF   [16384] (*1)
| #libdm-deptree.c:1314     Suspending vg-test_snap-cow (253:11) with devic=
e flush
| #ioctl/libdm-iface.c:1724         dm suspend   (253:11) NFS    [16384] (*=
1)
| #libdm-common.c:210         Suspended device counter increased to 4

Commits the VG:

| #format_text/format-text.c:735         Committing vg metadata (1276) to /=
dev/xvdb header@4096

Resumes three of the devices, but not vg-test_base:

| #libdm-deptree.c:1263     Resuming vg-test_snap-cow (253:11)
| #ioctl/libdm-iface.c:1724         dm resume   (253:11) NF   [16384] (*1)
| #libdm-common.c:1338         vg-test_snap-cow: Stacking NODE_ADD (253,11)=
 0:6 0660 [trust_udev]
| #libdm-common.c:1348         vg-test_snap-cow: Stacking NODE_READ_AHEAD 0=
 (flags=3D0)
| #libdm-common.c:221         Suspended device counter reduced to 3
| #libdm-deptree.c:1263     Resuming vg-test_base-real (253:10)
| #ioctl/libdm-iface.c:1724         dm resume   (253:10) NF   [16384] (*1)
| #libdm-common.c:1338         vg-test_base-real: Stacking NODE_ADD (253,10=
) 0:6 0660 [trust_udev]
| #libdm-common.c:1348         vg-test_base-real: Stacking NODE_READ_AHEAD =
0 (flags=3D0)
| #libdm-common.c:221         Suspended device counter reduced to 2
| #libdm-deptree.c:1263     Resuming vg-test_snap (253:9)
| #ioctl/libdm-iface.c:1724         dm resume   (253:9) NF   [16384] (*1)
| #libdm-common.c:1338         vg-test_snap: Stacking NODE_ADD (253,9) 0:6 =
0660 [trust_udev]
| #libdm-common.c:1348         vg-test_snap: Stacking NODE_READ_AHEAD 256 (=
flags=3D1)
| #libdm-common.c:221         Suspended device counter reduced to 1

Now it fails to do lv_activate on the cow device, because it is still
open:

| #libdm-deptree.c:1562   Unable to deactivate open vg-test_snap-cow (253:1=
1)
| #metadata/snapshot_manip.c:291   Failed to activate test_snap.

And exits without further error handling and with one suspended device:

|  libdevmapper exiting with 1 device(s) still suspended.

Bastian

--=20
Beam me up, Scotty, there's no intelligent life down here!

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIBNE8ACgkQnw66O/MvCNHUGACfTj6Rc+StIIpTWSXRxdquHLXl
fH4Anj4kqUvXvpTs9kGbnZBcgNexKUwx
=Nufb
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
