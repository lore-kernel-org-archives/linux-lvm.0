Message-ID: <40067D39.20407@iku-ag.de>
From: Kurt Huwig <k.huwig@iku-ag.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigF1AEB6D5218CAE4076C450A2"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to recover a VG from another PC?
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
Date: Thu Jan 15 08:54:05 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF1AEB6D5218CAE4076C450A2
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi!

I've got the following problem:

I replaced an old SUSE 7.3, Kernel 2.4.10 (or so) by a current Debian=20
with 2.4.23. There was an IDE disk:

/dev/hdc2            65      5005  39688582+  8e  Linux LVM

There was a volume group called 'ide' containing only this one partition.

Unfortunately I did the reinstall before reading the LVM manual and so=20
did not use the export-feature. What I get from 'vgscan -d' is:

<333> pv_check_volume -- CALLED  dev_name: "/dev/hdc2"  pv: 804D110
<4444> pv_check_name -- CALLED with "/dev/hdc2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: ide
<55555> lvm_check_chars -- CALLED with name: "ide"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: -348
<333> pv_check_volume -- LEAVING with ret: 0
<22> pv_read_all_pv -- device /dev/hdc2 NOT used

but no volume group appears.

What can I do?


Kurt
--=20
Kurt Huwig             iKu Systemhaus AG        http://www.iku-ag.de/
Vorstand               Am R=EF=BF=BDmerkastell 4        Telefon 0681/96751-0
                        66121 Saarbr=EF=BF=BDcken        Telefax 0681/96751=
-66
GnuPG 1024D/99DD9468 64B1 0C5B 82BC E16E 8940  EB6D 4C32 F908 99DD 9468

--------------enigF1AEB6D5218CAE4076C450A2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFABn09TDL5CJndlGgRAntsAKDLoshTWH6Q0ieTtsFnih7uVf2eogCfSE4l
IC7oXNtwCiVE4yBXLF9NGew=
=Td0U
-----END PGP SIGNATURE-----

--------------enigF1AEB6D5218CAE4076C450A2--
