Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: what i need is a little attention-RE [linux-lvm] SoftRaid and LVM   Jean-Eric Cuendet
Date: Wed, 5 Sep 2001 07:44:01 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FD77@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I'll give you my setup.
I have a 5 36Gb SCSI disks machine which do MD+LVM+ext2 on them
Each disk is splitted in 4 (~9Gb each partition) and then grouped 5 by 5
to form 4 MD (md5, md6, md7, md8) each ~36Gb in RAID5.
Then these 4 MDs are added in a VG and LVs are created for each need
(CVS, HOMES, FILES, ...).=20
The machine is a PIII 733 with 256Mb RAM and has RH7.1 installed
I use MD 0.90.0, LVM 1.0.1rc1 and e2fsprogs 1.23. I have NO reiserfs nor
XFS nor JFS.

All that works fine for me with little problems since upgrade to
LVM-0.9.1-beta7

Each partition on the physical disk is marked as fd (Linux RAID
autodectect) then pvcreate is made on /dev/md[5678] . There is no need
to put either "Linux Native (83)" nor "Linux LVM (8e)" on the /dev/md1
or something like that. Just the fd on physical partitions will do the
trick.

Hope this helps.
-jec

> -----Original Message-----
> From: svetljo [mailto:galia@st-peter.stw.uni-erlangen.de]=20
> Sent: mardi, 4. septembre 2001 19:44
> To: bluca@comedia.it; linux-lvm@sistina.com
> Subject: Re: what i need is a little attention-RE [linux-lvm]=20
> SoftRaid and LVM Jean-Eric Cuendet
>=20
>=20
> well the problem currently is that i can not format the LV=20
> with ext2 or=20
> reiserfs
> in the beginning i could access the LV only with IBM's JFS and i had=20
> troubles mounting it with XFS
> but i've upgraded to 2.4.10-pre2-xfs-cvs and now i have no=20
> problem with XFS but i still have the problem with ext2 and=20
> reiserfs which i think is not=20
> normal
> and i'm wondering whether it's safe to use the LV
>=20
> i used e2fsprogs-1.23 and 1.24 and reiserfs progs  3.x.0j
> but when i try to format the LV mke2fs and mkreiserfs segfaults
>=20
> and i can format normal partitions and software raid with mke2fs and=20
> mkreiserfs
>=20
>=20
> the VG :
>=20
> /dev/hdh10
> /dev/md6  software linear RAID
> /dev/md7 software linear RAID
>=20
> the LV's are striped over the 3 PV's
>=20
> Luca Berra wrote:
>=20
> >On Tue, Sep 04, 2001 at 07:08:10PM +0200, svetljo wrote:
> >
> >>if smbd take a look at all meseages with sender svetljo and with=20
> >>subject
> >>releated to PB's with LVM on software RAID
> >> i think he'll get the idea what is all about
> >>
> >OK i am using lvm over softraid
> >can you please do a recap.
> >
> >L.
> >
>=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com=20
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the=20
> LVM HOW-TO at=20
> http://www.sistina.com/lvm/Pages/howto.html
>=20
