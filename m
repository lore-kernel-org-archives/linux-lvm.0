Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3LEQ1FL006068
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 10:26:01 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [134.68.220.30])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3LEPpWh001187
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 10:25:52 -0400
Received: from rocket by smtp.gentoo.org with local (Exim 4.54)
	id 1FWwZu-0006Ap-IX
	for linux-lvm@redhat.com; Fri, 21 Apr 2006 14:25:46 +0000
Date: Fri, 21 Apr 2006 14:25:46 +0000
Subject: Re: [linux-lvm] LVM2 release 2.02.03 / device-mapper 1.02.04
Message-ID: <20060421142546.GA32359@toucan.gentoo.org>
References: <20060414214357.GE4521@agk.surrey.redhat.com>
	<1145564732.2658.15.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <1145564732.2658.15.camel@localhost>
From: Eric Edgar <rocket@gentoo.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just wanted to add that I am seeing this issue as well.  2.02.03 and
2.02.04 both seem to suffer the same problem.  Downgrading to 2.02.02
  seems to fix this issue.

   vgscan --version
     LVM version:     2.02.02 (2006-02-07)
	  Library version: 1.02.05 (2006-04-19)
	  Driver version:  4.4.0
  vgscan
  Reading all physical volumes.  This may take a while...
    Found volume group "vg01" using metadata type lvm2
      Found volume group "vg02" using metadata type lvm2



 with 2.02.03 or 2.02.04 I get this
 vgscan
   Reading all physical volumes.  This may take a while...
     WARNING: Duplicate VG name vg01: Existing
     xqKVwB-P68M-GG6h-iGpn-eOaw-09Nv-jp8Ddp (created here) takes
     precedence over xqKVwB-P68M-GG6h-iGpn-eOaw-09Nv-jp8Ddp
       WARNING: Duplicate VG name vg01: Existing
       xqKVwB-P68M-GG6h-iGpn-eOaw-09Nv-jp8Ddp (created here) takes
       precedence over xqKVwB-P68M-GG6h-iGpn-eOaw-09Nv-jp8Ddp
         Found volume group "vg01" using metadata type lvm2
	   Found volume group "vg02" using metadata type lvm2
	  =20
I have not rebooted between these upgrades I am not sure if that would
matter.  However, it appears that there are other people who have seen
this issue as well as noted in gentoo's bug reports and forums system.



	  =20
On 22:25 Thu 20 Apr     , Simone Gotti wrote:
> On Fri, 2006-04-14 at 22:43 +0100, Alasdair G Kergon wrote:
> > Some bug fixes and minor enhancements. (See the WHATS_NEW files.)
> >=20
> >   ftp://sources.redhat.com/pub/dm/device-mapper.1.02.04.tgz
> >   ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.03.tgz
> >=20
> > The tools should cope better now if faced with multiple distinct
> > VGs with the same name.  'pvs -P /dev/whatever -o+vg_uuid' output
> > should be reliable, and vgrename accepts a VG uuid as first
> > argument.
> >=20
> > And libdevmapper has support again for older 2.6 kernels that=20
> > can't handle mapped device referencing by device number.
> >=20
> > Alasdair
>=20
> Hi All,
>=20
> Last day I tried out these new versions but the new lvm2 release gave me
> some issues. I was thinking that it was a my compilation mistake but
> today I updated my fedora rawhide and the latest version of lvm2
> (2.02.04) was installed and I had the same problems.
> Here's the list of actions I did to create the pv, vg and lv and some
> tries to activate them:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [root@localhost ~]# pvcreate /dev/hda10
>   Physical volume "/dev/hda10" successfully created
>=20
> [root@localhost ~]# vgcreate vg_test01 /dev/hda10
>   Volume group "vg_test01" successfully created
>=20
> [root@localhost ~]# lvcreate -L 500m -n lv_test01 vg_test01
>   Volume group for uuid not found:
> gqq5eaIEAauBYPjLXWZ51b38BRXjYKbNTQVtf2rw5RkX7KIvU4d3bGfHZGhF6QVk
>   Failed to activate new LV.
>=20
> [root@localhost ~]# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/vg_test01/lv_test01
>   VG Name                vg_test01
>   LV UUID                TQVtf2-rw5R-kX7K-IvU4-d3bG-fHZG-hF6QVk
>   LV Write Access        read/write
>   LV Status              NOT available
>   LV Size                500.00 MB
>   Current LE             125
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>=20
> [root@localhost ~]# lvchange -ay /dev/vg_test01/lv_test01
>   Volume group for uuid not found:
> gqq5eaIEAauBYPjLXWZ51b38BRXjYKbNTQVtf2rw5RkX7KIvU4d3bGfHZGhF6QVk
>=20
> [root@localhost ~]# lvremove /dev/vg_test01/lv_test01
>   Volume group for uuid not found:
> gqq5eaIEAauBYPjLXWZ51b38BRXjYKbNTQVtf2rw5RkX7KIvU4d3bGfHZGhF6QVk
>   Unable to deactivate logical volume "lv_test01"
>=20
> [root@localhost ~]# vgchange -ay vg_test01
>   Volume group for uuid not found:
> SJoVm40jn03BxZ8KWAOLIp9QyWH3RBRKQElo5tpSIeGayuMmV56DHxzSdBC94hkY
>   0 logical volume(s) in volume group "vg_test01" now active
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>=20
> The volume and also the volume group cannot be activated or removed.
>=20
> Some more informations:
>=20
> [root@localhost ~]# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/hda10
>   VG Name               vg_test01
>   PV Size               964.00 MB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              241
>   Free PE               116
>   Allocated PE          125
>   PV UUID               hWTMJb-d8C7-85R2-eikX-u91F-4gAk-EU3hUV
>=20
> [root@localhost ~]# vgdisplay
>   --- Volume group ---
>   VG Name               vg_test01
>   System ID
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  2
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               0
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               964.00 MB
>   PE Size               4.00 MB
>   Total PE              241
>   Alloc PE / Size       125 / 500.00 MB
>   Free  PE / Size       116 / 464.00 MB
>   VG UUID               SJoVm4-0jn0-3BxZ-8KWA-OLIp-9QyW-H3RBRK
>=20
> [root@localhost ~]# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/vg_test01/lv_test01
>   VG Name                vg_test01
>   LV UUID                QElo5t-pSIe-Gayu-MmV5-6DHx-zSdB-C94hkY
>   LV Write Access        read/write
>   LV Status              NOT available
>   LV Size                500.00 MB
>   Current LE             125
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>=20
>=20
> Going back to a previous version of lvm (a CVS snapshot previous to the
> cache changes) everything worked again.
>=20
> Let me know if this is a my mistake or how can help you debugging the
> problem.
>=20
> Thanks!
>=20
> Bye!
>=20
>=20
>=20
> =20
> =20
>  --
>  Email.it, the professional e-mail, gratis per te: http://www.email.it/f
> =20
>  Sponsor:
>  Conto Arancio, il migliore amico dei tuoi risparmi.Prova la differenza!
>  Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D5040&d=3D20-4
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFESOtqG1H288hHbuMRArS5AKC0vQ1t2rdNK+npQS+mViWo4R4+2QCgxyu9
Mlk9T6W/mwqOQ1vOE+g68O4=
=meXR
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
