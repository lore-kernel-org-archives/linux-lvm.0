Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2EKGxY12755
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2005 15:16:59 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2EKGwOE025375
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2005 15:16:58 -0500
Subject: Re: [linux-lvm] LVM Woes (hope this isn't a repeat. sorry)
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <a3558a9805031323525124c37c@mail.gmail.com>
References: <200503131732.40512.andy_b@softhome.net>
	<a3558a9805031323525124c37c@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-UH0sBZtiF3xwTdbxyw8h"
Date: Mon, 14 Mar 2005 12:16:46 -0800
Message-Id: <1110831406.22452.92.camel@seki.nac.uci.edu>
Mime-Version: 1.0
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
To: go0ogl3 <go0ogl3@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>


--=-UH0sBZtiF3xwTdbxyw8h
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


If it's just the MBR that got wiped, you may be able to just reinstall
grub/lilo and be good to go, but you may also need to use some sort of
partition guesser to see all of your filesystems again.

The group I work in automatically collects our MBR's via our usual,
automated system-statistics collection, the relevant portion of which
looks like:

dd if=3D/dev/$disk bs=3D512 count=3D1 2> /dev/null | \
    openssl base64 -e | \
    sed "s#^#mbr-$disk #"

HTH.

On Mon, 2005-03-14 at 09:52 +0200, go0ogl3 wrote:
> Hello!
>=20
>   I'm new at lvm but maybe Windows just overwrited the first 512 bytes
> of that disk. Try dd_rescue or search the list arhive you'll find some
> similar situation (oliver with a hex editor).
>=20
> I hope you'll make it!
>=20
> On Sun, 13 Mar 2005 19:48:47 -0500, Andrew <andy_b@softhome.net> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > My problem is that I accidentally left my LVM disks in my system when I
> > installed windows XP On a seperate drive.  I did not install windows to
> > either of the LVM's so that should not be an issue.
> >=20
> > However when I replaced my linux drive, and booted into linux, I got th=
e
> > following error when my system tried to start up LVM
> > (for vgchange -ay)
> > mog root # vgchange -ay
> > 2 logical volume(s) in volume group "vg0" now active
> > Logical volume (lv0) contains an incomplete mapping table
> > Unable to find volume group "vg_samsung"
> >=20
> > vg0 is my other lvm which thankfully is still there.
> >=20
> > now, whenever I do any of the 'scan' tools (vgscan, pvscan, lvscan) I g=
et the
> > following errors:
> > vgscan:
> > ...
> > Logical volume (lv0) contains an incomplete mapping table
> > Unable to find volume group "vg_samsung"
> >=20
> > pvscan:
> > Logical volume (lv0) contains an incomplete mapping table
> > ...
> >=20
> > lvscan:
> > ...
> > Logical volume (lv0) contains an incomplete mapping table
> > Unable to find volume group "vg_samsung"
> >=20
> > however, if I do pvdisplay on my 2 drives I get some info
> > mog root # pvdisplay /dev/hde     <--my 160gig drive, I think the secon=
d drive
> > in the LVM
> >=20
> > - --- NEW Physical volume ---
> > PV Name         /dev/hde
> > VG Name         /vg_samsung
> > PV Size         19.84 MB
> > Allocatable     NO
> > PE Size (K..)   0
> > Total PE                0
> > Free PE         0
> > Allocated PE    0
> > PV UUID         fXhdbW-S1KK-lSNs-kGSQ-dsb6-9Kkn-Q7xeTk
> >=20
> > That looks bad to me, but the first drive in the volume looks ok:
> >=20
> > mog root # pvdisplay /dev/hdg <--my 80gig drive
> > - --- Physical volume ---
> > PV Name         /dev/hdg
> > VG Name         /vg_samsung
> > PV Size         74.56 GB / not usable 31.57 MB
> > Allocatable     yes (but full)
> > PE Size (K..)   16384
> > Total PE                4770
> > Free PE         0
> > Allocated PE    4770
> > PV UUID         aE0Tfs-UX8r-oTma-Eo35-mxSg-ZT5w-ZHPPTW
> >=20
> > so it looks like windows only blasted the second of the two drives  (wh=
ich
> > came first in the bios) (or the
> > first one it found?)
> >=20
> > I am desperate to get this data back (and unfortunately my /etc/lvm/bac=
kup or
> > archive are empty :(
> >=20
> > Thankyou very much in advance!
> > - --
> >=20
> > - --Andrew Bovill
> > PGP fingerprint:  A00A 1E75 3AB0 610E 2300  6855 1890 C61E E590 F777
> > Link to PGP key:  http://linuxboy.dyndns.org/~andy/public_key.gpg
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.2.1 (GNU/Linux)
> >=20
> > iD8DBQFCNN9xGJDGHuWQ93cRAtPnAJ9FbTYTo4qQHq4KAtCgchboewhtRQCfce/l
> > Bk3ODWAXSpgnJz0i55RJK/Y=3D
> > =3DbymV
> > -----END PGP SIGNATURE-----
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--=-UH0sBZtiF3xwTdbxyw8h
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCNfEuo0feVm00f/8RAtHlAKCDE5wLwozmtKOiqXF6ikCkMWFNeACfdCk6
WVToUk55z9R7MlcjXGFVCYY=
=Kqoj
-----END PGP SIGNATURE-----

--=-UH0sBZtiF3xwTdbxyw8h--
