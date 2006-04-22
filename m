Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3M873g7031899
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 04:07:03 -0400
Received: from admin-box.com (admin-box.com [81.169.166.147])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3M86tqS016569
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 04:06:55 -0400
Message-ID: <4449E411.7050505@admin-box.com>
Date: Sat, 22 Apr 2006 10:06:41 +0200
From: Daniel Troeder <daniel@admin-box.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDC9E02AE913D8C778ADEA2F2"
Subject: [linux-lvm] Existing VG (created here) takes precedence over VG
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDC9E02AE913D8C778ADEA2F2
Content-Type: multipart/mixed; boundary="------------070308020406050908060008"

This is a multi-part message in MIME format.
--------------070308020406050908060008
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hallo :)

When shutting down my PC yesterday I saw something from LVM complaining,
but that scrolled to fast... When booting it today all my LVs were
inaccessible. Problem seems to be some error in some metadata (?) this
is the first error message:

-------------------------------------------------------------------------=
-
Apr 22 08:17:34 [lvm] WARNING: Duplicate VG name vg0: Existing
K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L (created here) takes precedence
over K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
-------------------------------------------------------------------------=
-

I googled for somebody with a similar problem, but found nothing...
After successful scanning for my LVs (they are all there :) I tried some
renaming of the PVs UUIDs, which worked, but never removed that old
reference to the VGs UUID (K0qKAk...) I even renamed the VG (vg0 ->
vg1), exported it, imported it... now all PVs and the VG have different
UUIDs than before, but I still can't get my device-nodes, so that I can
access my data.

Original UUID of the VG is "K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L", an
"vg0" was it's original name. Now it's "vg1" and
"JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5". Sorry... maybe I was a bit
desperate to get to my data when fooling around with the LVM-tools...

-------------------------------------------------------------------------=
-
 akira ~ # lvm version
     Logging initialised at Sat Apr 22 09:54:11 2006

     Set umask to 0077
   LVM version:     2.02.04 (2006-04-19)
   Library version: 1.02.03 (2006-02-08)
   Driver version:  4.5.0
     Wiping internal VG cache


 akira ~ # pvscan -u
     Logging initialised at Sat Apr 22 09:46:30 2006

     Set umask to 0077
     Wiping cache of LVM-capable devices
     Wiping internal VG cache
     Walking through all physical volumes
   WARNING: Duplicate VG name vg1: Existing
JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5 takes precedence over exported
K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
   WARNING: Duplicate VG name vg1: Existing
JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5 (created here) takes precedence
over K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
   PV /dev/sda7  with UUID ZKdlL6-18Z7-YX8T-bH2J-IS3u-azbG-bUMLel  is in
exported VG vg1 [4.66 GB / 4.66 GB free]
   PV /dev/sda8  with UUID ezIhm5-iaCJ-YhCl-Mtdg-2m66-z35A-9OdFJW  is in
exported VG vg1 [4.66 GB / 4.66 GB free]
   PV /dev/sda11 with UUID n8POw9-c8fg-E39z-whvX-9lgA-P2ls-8n1jMa  is in
exported VG vg1 [56.76 GB / 20.76 GB free]
   Total: 3 [66.09 GB] / in use: 3 [66.09 GB] / in no VG: 0 [0   ]
     Wiping internal VG cache


 akira ~ # vgscan -v
     Logging initialised at Sat Apr 22 09:47:30 2006

     Set umask to 0077
     Wiping cache of LVM-capable devices
     Wiping internal VG cache
   Reading all physical volumes.  This may take a while...
     Finding all volume groups
   WARNING: Duplicate VG name vg1: Existing
JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5 takes precedence over exported
K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
   WARNING: Duplicate VG name vg1: Existing
JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5 (created here) takes precedence
over K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
     Finding volume group "vg1"
   Found exported volume group "vg1" using metadata type lvm2
     Wiping internal VG cache


 akira ~ # lvscan -a -v
     Logging initialised at Sat Apr 22 09:22:16 2006

     Set umask to 0077
     Finding all logical volumes
   WARNING: Duplicate VG name vg1: Existing
JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5 takes precedence over exported
K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
   WARNING: Duplicate VG name vg1: Existing
JtUveN-SL2N-cTrH-X2GI-NVux-3kYH-NJwRt5 (created here) takes precedence
over K0qKAk-Ph5i-BcAX-y4yp-SPF3-TZgj-DufR3L
   inactive          '/dev/vg1/portagehome' [10.00 GB] inherit
   inactive          '/dev/vg1/dists' [10.00 GB] inherit
   inactive          '/dev/vg1/rootext' [2.00 GB] inherit
   inactive          '/dev/vg1/rootvar' [1.00 GB] inherit
   inactive          '/dev/vg1/oslices' [4.00 GB] inherit
   inactive          '/dev/vg1/root2ext' [1.00 GB] inherit
   inactive          '/dev/vg1/verdicd' [3.00 GB] inherit
   inactive          '/dev/vg1/games' [5.00 GB] inherit
     Wiping internal VG cache
-------------------------------------------------------------------------=
-

I attached /etc/lvm/backup/vg1 to this mail.

I'm running a gentoo-2006.0 stable, but with glibc 2.4 and gcc 4.1.0 on
an athlon-xp, 3ware 6000 ATA-RAID-controller running a RAID-0 on 2 HDDs,
but as it's a hardware-raid linux knows nothing about it, and it looks
like a SCSI-Disk to it.

-------------------------------------------------------------------------=
-
 akira ~ # fdisk -l

 Disk /dev/sda: 400.0 GB, 400097148928 bytes
 255 heads, 63 sectors/track, 48642 cylinders
 Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
 /dev/sda1               1         125     1004031   82  Linux swap /
Solaris
 /dev/sda2             126         612     3911827+   c  W95 FAT32 (LBA)
 /dev/sda3   *         613         619       56227+  83  Linux
 /dev/sda4             620       48642   385744747+   f  W95 Ext'd (LBA)
 /dev/sda5             620        1471     6843658+  83  Linux
 /dev/sda6            1472        1958     3911796    b  W95 FAT32
 /dev/sda7            1959        2567     4891761   8e  Linux LVM
 /dev/sda8            2568        3176     4891761   8e  Linux LVM
 /dev/sda9            3177        3542     2939863+  83  Linux
 /dev/sda10           3543       41232   302744893+  83  Linux
 /dev/sda11          41233       48642    59520793+  8e  Linux LVM
-------------------------------------------------------------------------=
-

I'd appreciate your help!

Bye,
Daniel


--=20
use PGP key @ http://www.pgp.net/wwwkeys.html
gpg --recv-keys --keyserver hkp://subkeys.pgp.net 0xBB9D4887

--------------070308020406050908060008
Content-Type: text/plain;
 name="vg1"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="vg1"

IyBHZW5lcmF0ZWQgYnkgTFZNMjogU2F0IEFwciAyMiAwOToxNzoyOSAyMDA2Cgpjb250ZW50
cyA9ICJUZXh0IEZvcm1hdCBWb2x1bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlv
biA9ICJDcmVhdGVkICphZnRlciogZXhlY3V0aW5nICd2Z2NoYW5nZSAtLXV1aWQgLXYgdmcx
JyIKCmNyZWF0aW9uX2hvc3QgPSAiYWtpcmEiCSMgTGludXggYWtpcmEgMi42LjE2LWdlbnRv
by1yMi1ha2lyYSAjMSBTdW4gQXByIDE2IDAxOjQ0OjM0IENFU1QgMjAwNiBpNjg2CmNyZWF0
aW9uX3RpbWUgPSAxMTQ1NjkwMjQ5CSMgU2F0IEFwciAyMiAwOToxNzoyOSAyMDA2Cgp2ZzEg
ewoJaWQgPSAiSnRVdmVOLVNMMk4tY1RySC1YMkdJLU5WdXgtM2tZSC1OSndSdDUiCglzZXFu
byA9IDM3CglzdGF0dXMgPSBbIlJFU0laRUFCTEUiLCAiUkVBRCIsICJXUklURSJdCglleHRl
bnRfc2l6ZSA9IDgxOTIJCSMgNCBNZWdhYnl0ZXMKCW1heF9sdiA9IDAKCW1heF9wdiA9IDAK
CglwaHlzaWNhbF92b2x1bWVzIHsKCgkJcHYwIHsKCQkJaWQgPSAiWktkbEw2LTE4WjctWVg4
VC1iSDJKLUlTM3UtYXpiRy1iVU1MZWwiCgkJCWRldmljZSA9ICIvZGV2L3NkYTciCSMgSGlu
dCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJcGVfc3RhcnQgPSAzODQK
CQkJcGVfY291bnQgPSAxMTk0CSMgNC42NjQwNiBHaWdhYnl0ZXMKCQl9CgoJCXB2MSB7CgkJ
CWlkID0gImV6SWhtNS1pYUNKLVloQ2wtTXRkZy0ybTY2LXozNUEtOU9kRkpXIgoJCQlkZXZp
Y2UgPSAiL2Rldi9zZGE4IgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJM
RSJdCgkJCXBlX3N0YXJ0ID0gMzg0CgkJCXBlX2NvdW50ID0gMTE5NAkjIDQuNjY0MDYgR2ln
YWJ5dGVzCgkJfQoKCQlwdjIgewoJCQlpZCA9ICJuOFBPdzktYzhmZy1FMzl6LXdodlgtOWxn
QS1QMmxzLThuMWpNYSIKCQkJZGV2aWNlID0gIi9kZXYvc2RhMTEiCSMgSGludCBvbmx5CgoJ
CQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJcGVfc3RhcnQgPSAzODQKCQkJcGVfY291
bnQgPSAxNDUzMQkjIDU2Ljc2MTcgR2lnYWJ5dGVzCgkJfQoJfQoKCWxvZ2ljYWxfdm9sdW1l
cyB7CgoJCXBvcnRhZ2Vob21lIHsKCQkJaWQgPSAiUlJRQjN2LTVFSkstSGJYTi1EQU9SLXpv
UDMtOGg4SS1hOXRtaWsiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklURSIsICJWSVNJQkxF
Il0KCQkJc2VnbWVudF9jb3VudCA9IDIKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4dGVu
dCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDIwNDgJIyA4IEdpZ2FieXRlcwoKCQkJCXR5cGUg
PSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXIKCgkJCQlzdHJpcGVz
ID0gWwoJCQkJCSJwdjIiLCAwCgkJCQldCgkJCX0KCQkJc2VnbWVudDIgewoJCQkJc3RhcnRf
ZXh0ZW50ID0gMjA0OAoJCQkJZXh0ZW50X2NvdW50ID0gNTEyCSMgMiBHaWdhYnl0ZXMKCgkJ
CQl0eXBlID0gInN0cmlwZWQiCgkJCQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFyCgoJCQkJ
c3RyaXBlcyA9IFsKCQkJCQkicHYyIiwgOTk4NAoJCQkJXQoJCQl9CgkJfQoKCQlkaXN0cyB7
CgkJCWlkID0gIkduYjlSNC1ZRXhOLTdsTTEtRkcxVi1uOURvLVFROGQta21FWFFiIgoJCQlz
dGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUiLCAiVklTSUJMRSJdCgkJCXNlZ21lbnRfY291bnQg
PSAxCgoJCQlzZWdtZW50MSB7CgkJCQlzdGFydF9leHRlbnQgPSAwCgkJCQlleHRlbnRfY291
bnQgPSAyNTYwCSMgMTAgR2lnYWJ5dGVzCgoJCQkJdHlwZSA9ICJzdHJpcGVkIgoJCQkJc3Ry
aXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlwZXMgPSBbCgkJCQkJInB2MiIsIDIw
NDgKCQkJCV0KCQkJfQoJCX0KCgkJcm9vdGV4dCB7CgkJCWlkID0gIk13VUFodS1YaWVnLUl5
dHEtemgzZS1FWEZFLXJrVHQtT1VKaUdFIgoJCQlzdGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUi
LCAiVklTSUJMRSJdCgkJCXNlZ21lbnRfY291bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlz
dGFydF9leHRlbnQgPSAwCgkJCQlleHRlbnRfY291bnQgPSA1MTIJIyAyIEdpZ2FieXRlcwoK
CQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXIKCgkJ
CQlzdHJpcGVzID0gWwoJCQkJCSJwdjIiLCA2NjU2CgkJCQldCgkJCX0KCQl9CgoJCXJvb3R2
YXIgewoJCQlpZCA9ICJRZGx2aXgtWnBMNC1mQzA2LWVpZGktcHkwSi1sVXdRLWMyaEg0VCIK
CQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJCQlzZWdtZW50X2Nv
dW50ID0gMQoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50
X2NvdW50ID0gMjU2CSMgMTAyNCBNZWdhYnl0ZXMKCgkJCQl0eXBlID0gInN0cmlwZWQiCgkJ
CQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFyCgoJCQkJc3RyaXBlcyA9IFsKCQkJCQkicHYy
IiwgNzE2OAoJCQkJXQoJCQl9CgkJfQoKCQlvc2xpY2VzIHsKCQkJaWQgPSAiUWZQV0FGLWpK
MEMtNUlrOS1FZG9KLXFCQUQtc0V0YS1kbUg5aUYiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJX
UklURSIsICJWSVNJQkxFIl0KCQkJc2VnbWVudF9jb3VudCA9IDEKCgkJCXNlZ21lbnQxIHsK
CQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDEwMjQJIyA0IEdpZ2Fi
eXRlcwoKCQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5l
YXIKCgkJCQlzdHJpcGVzID0gWwoJCQkJCSJwdjIiLCA3NDI0CgkJCQldCgkJCX0KCQl9CgoJ
CXJvb3QyZXh0IHsKCQkJaWQgPSAiN2VBaG4yLXBvRlYtckxXMS11SUlFLXBVZjUtNXNyeC02
blZWUjMiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklURSIsICJWSVNJQkxFIl0KCQkJc2Vn
bWVudF9jb3VudCA9IDEKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJ
CWV4dGVudF9jb3VudCA9IDI1NgkjIDEwMjQgTWVnYWJ5dGVzCgoJCQkJdHlwZSA9ICJzdHJp
cGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlwZXMgPSBbCgkJ
CQkJInB2MiIsIDEwNDk2CgkJCQldCgkJCX0KCQl9CgoJCXZlcmRpY2QgewoJCQlpZCA9ICJV
cDFIbTQtTU5ycS0zNENTLVgyN0UtUVlDMS1EdWVhLVg4RlZyRSIKCQkJc3RhdHVzID0gWyJS
RUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJCQlzZWdtZW50X2NvdW50ID0gMQoKCQkJc2Vn
bWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2NvdW50ID0gNzY4CSMg
MyBHaWdhYnl0ZXMKCgkJCQl0eXBlID0gInN0cmlwZWQiCgkJCQlzdHJpcGVfY291bnQgPSAx
CSMgbGluZWFyCgoJCQkJc3RyaXBlcyA9IFsKCQkJCQkicHYyIiwgMTA3NTIKCQkJCV0KCQkJ
fQoJCX0KCgkJZ2FtZXMgewoJCQlpZCA9ICI5YnB3ejEtajRCcS1oeW1tLTdHT0YteGxUSS1O
N1JhLTJ4RmVXZyIKCQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJ
CQlzZWdtZW50X2NvdW50ID0gMQoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0g
MAoJCQkJZXh0ZW50X2NvdW50ID0gMTI4MAkjIDUgR2lnYWJ5dGVzCgoJCQkJdHlwZSA9ICJz
dHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlwZXMgPSBb
CgkJCQkJInB2MiIsIDExNTIwCgkJCQldCgkJCX0KCQl9Cgl9Cn0K
--------------070308020406050908060008--

--------------enigDC9E02AE913D8C778ADEA2F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFESeQVg3+4tbudSIcRArT6AJ9ZKiuxWmTQNW9DEy25hmJGTxzHtACfWIhT
dZZITRvQ8uHoge14ua5T5wE=
=Bpmk
-----END PGP SIGNATURE-----

--------------enigDC9E02AE913D8C778ADEA2F2--
