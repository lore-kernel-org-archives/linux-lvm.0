Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j56L4JO20705
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 17:04:19 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j56L4DGF025246
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 17:04:13 -0400
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <1118087611.5509.44.camel@localhost.localdomain>
References: <1118087310.5509.40.camel@localhost.localdomain>
	<1118087611.5509.44.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-m4f/JkHneDrxScziqZKw"
Date: Mon, 06 Jun 2005 17:04:04 -0400
Message-Id: <1118091844.5509.79.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] Re: VG vg1 metadata writing failed
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM <linux-lvm@redhat.com>


--=-m4f/JkHneDrxScziqZKw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

this is reproducible on another box.

[root@fc4t3 ~]# lvcreate --version
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.02 (2005-05-17)
  Driver version:  4.4.0
[root@fc4t3 ~]# uname -a
Linux fc4t3.localdomain 2.6.11-1.1366_FC4smp #1 SMP Mon May 30 00:12:23
EDT 2005 i686 i686 i386 GNU/Linux


same error when creating 283th LV.

ming


On Mon, 2005-06-06 at 15:53 -0400, Ming Zhang wrote:
> also i can meet same error when i just create LV not snapshot on a fresh
> system with a empty vg initially. this time i can create around 282 LV
> before fail.
>=20
> i run this script.
>=20
> #!/bin/bash
>=20
> LIMIT=3D300
> a=3D1
>=20
> while [ "$a" -le $LIMIT ]
> do
>         lvcreate -L20M -nv$a vgtest
>         free
>         let "a+=3D1"
> done
>=20
>=20
> [root@localhost ~]# lvcreate --version
>   LVM version:     2.01.10 (2005-05-03)
>   Library version: 1.01.02 (2005-05-17)
>   Driver version:  4.4.0
>=20
>=20
> ming
>=20
>=20
> On Mon, 2005-06-06 at 15:48 -0400, Ming Zhang wrote:
> > i always meet this error when i create 142th snapshot.
> >=20
> > I changed kernel dm code a bit so it now allow large # of snapshots to
> > be created. i do not think this is related since the traces shows that
> > it does not reach kernel part yet.
> >=20
> >=20
> >=20
> > #lvmcmdline.c:836         Processing: lvcreate -vvvvvvvv -s -L20M -
> > nv1s142 /dev/vg1/v1
> >=20
> > ...(removed some prints, otherwise too long)
> >=20
> > #archiver.c:109     Archiving volume group "vg1" metadata.
> > #metadata/pv_manip.c:231         /dev/sda1 0:      0     25: v1(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 1:     25      5: v1s1(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 2:     30      5: v1s2(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 3:     35      5: v1s3(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 4:     40      5: v1s4(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 5:     45      5: v1s5(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 6:     50      5: v1s6(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 7:     55      5: v1s7(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 8:     60      5: v1s8(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 9:     65      5: v1s9(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 10:     70      5: v1s10(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 11:     75      5: v1s11(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 12:     80      5: v1s12(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 13:     85      5: v1s13(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 14:     90      5: v1s14(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 15:     95      5: v1s15(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 16:    100      5: v1s16(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 17:    105      5: v1s17(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 18:    110      5: v1s18(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 19:    115      5: v1s19(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 20:    120      5: v1s20(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 21:    125      5: v1s21(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 22:    130      5: v1s22(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 23:    135      5: v1s23(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 24:    140      5: v1s24(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 25:    145      5: v1s25(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 26:    150      5: v1s26(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 27:    155      5: v1s27(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 28:    160      5: v1s28(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 29:    165      5: v1s29(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 30:    170      5: v1s30(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 31:    175      5: v1s31(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 32:    180      5: v1s32(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 33:    185      5: v1s33(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 34:    190      5: v1s34(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 35:    195      5: v1s35(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 36:    200      5: v1s36(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 37:    205      5: v1s37(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 38:    210      5: v1s38(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 39:    215      5: v1s39(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 40:    220      5: v1s40(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 41:    225      5: v1s41(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 42:    230      5: v1s42(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 43:    235      5: v1s43(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 44:    240      5: v1s44(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 45:    245      5: v1s45(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 46:    250      5: v1s46(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 47:    255      5: v1s47(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 48:    260      5: v1s48(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 49:    265      5: v1s49(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 50:    270      5: v1s50(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 51:    275      5: v1s51(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 52:    280      5: v1s52(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 53:    285      5: v1s53(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 54:    290      5: v1s54(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 55:    295      5: v1s55(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 56:    300      5: v1s56(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 57:    305      5: v1s57(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 58:    310      5: v1s58(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 59:    315      5: v1s59(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 60:    320      5: v1s60(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 61:    325      5: v1s61(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 62:    330      5: v1s62(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 63:    335      5: v1s63(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 64:    340      5: v1s64(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 65:    345      5: v1s65(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 66:    350      5: v1s66(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 67:    355      5: v1s67(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 68:    360      5: v1s68(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 69:    365      5: v1s69(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 70:    370      5: v1s70(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 71:    375      5: v1s71(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 72:    380      5: v1s72(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 73:    385      5: v1s73(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 74:    390      5: v1s74(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 75:    395      5: v1s75(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 76:    400      5: v1s76(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 77:    405      5: v1s77(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 78:    410      5: v1s78(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 79:    415      5: v1s79(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 80:    420      5: v1s80(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 81:    425      5: v1s81(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 82:    430      5: v1s82(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 83:    435      5: v1s83(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 84:    440      5: v1s84(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 85:    445      5: v1s85(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 86:    450      5: v1s86(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 87:    455      5: v1s87(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 88:    460      5: v1s88(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 89:    465      5: v1s89(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 90:    470      5: v1s90(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 91:    475      5: v1s91(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 92:    480      5: v1s92(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 93:    485      5: v1s93(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 94:    490      5: v1s94(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 95:    495      5: v1s95(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 96:    500      5: v1s96(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 97:    505      5: v1s97(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 98:    510      5: v1s98(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 99:    515      5: v1s99(0:0=
)
> > #metadata/pv_manip.c:231         /dev/sda1 100:    520      5: v1s100
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 101:    525      5: v1s101
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 102:    530      5: v1s102
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 103:    535      5: v1s103
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 104:    540      5: v1s104
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 105:    545      5: v1s105
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 106:    550      5: v1s106
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 107:    555      5: v1s107
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 108:    560      5: v1s108
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 109:    565      5: v1s109
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 110:    570      5: v1s110
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 111:    575      5: v1s111
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 112:    580      5: v1s112
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 113:    585      5: v1s113
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 114:    590      5: v1s114
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 115:    595      5: v1s115
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 116:    600      5: v1s116
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 117:    605      5: v1s117
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 118:    610      5: v1s118
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 119:    615      5: v1s119
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 120:    620      5: v1s120
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 121:    625      5: v1s121
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 122:    630      5: v1s122
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 123:    635      5: v1s123
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 124:    640      5: v1s124
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 125:    645      5: v1s125
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 126:    650      5: v1s126
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 127:    655      5: v1s127
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 128:    660      5: v1s128
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 129:    665      5: v1s129
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 130:    670      5: v1s130
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 131:    675      5: v1s131
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 132:    680      5: v1s132
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 133:    685      5: v1s133
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 134:    690      5: v1s134
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 135:    695      5: v1s135
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 136:    700      5: v1s136
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 137:    705      5: v1s137
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 138:    710      5: v1s138
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 139:    715      5: v1s139
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 140:    720      5: v1s140
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 141:    725      5: v1s141
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 142:    730      5: v4(0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 143:    735      5: v1s142
> > (0:0)
> > #metadata/pv_manip.c:231         /dev/sda1 144:    740    283: NULL(0:0=
)
> > #format_text/export.c:266         <backtrace>
> > #format_text/export.c:647         <backtrace>
> > #format_text/export.c:711         <backtrace>
> > #format_text/format-text.c:379   VG vg1 metadata writing failed
> > #metadata/metadata.c:770         <backtrace>
> > #lvcreate.c:564         <backtrace>
> > #lvcreate.c:656         <backtrace>
> > #locking/file_locking.c:59       Unlocking /var/lock/lvm/V_vg1
> > #device/dev-io.c:456         Closed /dev/md0
> > #device/dev-io.c:456         Closed /dev/hda1
> > #device/dev-io.c:456         Closed /dev/sda1
> > #device/dev-io.c:456         Closed /dev/hda2
> > #device/dev-io.c:456         Closed /dev/hda3
> >=20

--=-m4f/JkHneDrxScziqZKw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCpLpESYbkL5BnVYoRAlizAJ91VyWtYbs+pJpWunX7cZCFQVXgcACfb8eN
HZBj5Mw+5Gnvidf0dsHVmAY=
=Erzv
-----END PGP SIGNATURE-----

--=-m4f/JkHneDrxScziqZKw--
