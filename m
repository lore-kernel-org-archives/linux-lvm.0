Return-Path: <smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] Re: vgscan - volume group not found, panic!
Date: Mon, 28 May 2001 06:57:26 -0400
Message-ID: <000c01c0e764$fc142b60$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010528110803.G26710@sistina.com>
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

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

IMHO I see no problem continuing with keeping driver and tools/lib in
sync by patching kernel just before tools/lib build as it currently
stands.  Then again, I haven't used a standard distribution of linux
in quite some time so I don't mind hacking about in the kernel all
that much either :)

Oh, one weirdness I saw recently after a system panic (unrelated to
LVM, it was a stupid user trick by yours truly)... all my LVM'd
reiserfs vols reported that they couldn't mount since they were
already mounted (during rc.S mountall)... I doubt that it is LVM
itself but I wanted to see if anyone else on this list has seen this
before going to reiserfs-list.

Thanks.

- -----Original Message-----
From: linux-lvm-admin@sistina.com
[mailto:linux-lvm-admin@sistina.com]On
Behalf Of Heinz J. Mauelshagen
Sent: Monday, 28 May 2001 07:08
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Re: vgscan - volume group not found, panic!


On Fri, May 25, 2001 at 09:14:21AM +0200, Luca Berra wrote:
> On Fri, May 25, 2001 at 12:38:04AM +0200, Gerben Meijer wrote:
> > Dear LVM users and developers,
> >=20
> > I am experiencing problems with LVM. I am running Debian
> > GNU/Linux 2.2 with a 2.4.3-ac11 kernel, and LVM utils v0.9 (i use
> > the packages from bunk at
> > http://people.debian.org/~bunk/debian/dists/potato/main/binary-i38
> > 6/). I had=20
>=20
> (note to developers: i am starting to believe taht bumping IOP in
> b6 was not such a bad idea, if that helps us getting rid of broken
> tools.
> mebbe we should bump IOP in vanilla kernel....)

Thanks Luca, you are the first who argues for that beside us :-)

But people did complain about the need to upgrade both driver and
tools/lib
at the same time.
IMHO not a big deal, because the patch is automagically created by
the make process anyway; just the additional kernel compile/install
might
suck a little bit.

Any additional votes?

Regards,
Heinz    -- The LVM Guy --

>=20
> > Then I decided to try to upgrade to the latest LVM version, both
> > in the kernel and the userspace utilities. So i patched my 2.4.3
> > kernel with the latest LVM patches (0.9.1beta7). I got an error
> > while compiling my kernel though, get_hardblocksize wasn't
> > defined anywhere. So i went back digging on=20
>=20
> just replace get_hardblock_size with get_hardsect_size in
> drivers/md/lvm.c or get latest version from cvs
>=20
> > google and found one patch that fixed that for me:
> > http://www.stacken.kth.se/pub/linux/kernel/people/andrea/kernels/v
> > 2.4/2.4.4a a2.bz2.
>=20
> i dunno which LVM version does andrea use in his patches
>=20
> > So finally i had a working kernel with the latest LVM drivers,
> > and i had the latest LVM userspace utils, and i had my hopes up.
> > Unfortunately, vgscan still didn't see anything, and vgcfgrestore
> > gave me an error
> > (vg_check_consistency_with_pv_and_lv).
> >=20
> > Next, I tried using 2.4.4-ac9 with the original 0.9 userspace
> > utilities. Still nothing.
>=20
> in case you did not guess it from my note above original 0.9
> userspace utils are bad for your health
>=20
> > I'm out of options here, and I am hoping that you can help me
> > rescue my data. If you have any idea what I could try to fix
> > this, please let me know. =20
> >=20
> > Debugged output i created:
> sigh this debug output is very hard to read, anyway at the end you
> see <55555> pv_read_uuidlist -- LEAVING with ret: 2
> this means it only found the uiid for 2 PV (not 3)
> they are u9.... and M4.... (sda1 and hda2)
> cross checking with pvdata output shows you have a known problem
>=20
> i'll attach a mail from Andreas Dilger with a solution for this.
>=20
> good luck!
> L.
>=20
>=20
> --=20
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \

> Return-Path: <linux-lvm-admin@sistina.com>
> Delivered-To: bluca@comedia.it
> Received: from sistina.com (hermes.sistina.com [208.210.145.141])
> 	by colombina.comedia.it (Postfix) with SMTP id 25049506D
> 	for <bluca@comedia.it>; Mon,  2 Apr 2001 21:27:59 +0000 ()
> Received: (qmail 5697 invoked from network); 2 Apr 2001 21:23:03
> -0000 Received: from localhost (HELO hermes.sistina.com)
> (127.0.0.1)
>   by localhost with SMTP; 2 Apr 2001 21:23:03 -0000
> Delivered-To: linux-lvm@sistina.com
> Received: (qmail 5640 invoked from network); 2 Apr 2001 21:22:57
> -0000 Received: from h24-65-193-28.cg.shawcable.net (HELO
> webber.adilger.int) (24.65.193.28)=20
>   by hermes.sistina.com with SMTP; 2 Apr 2001 21:22:57 -0000
> Received: (from adilger@localhost)
> 	by webber.adilger.int (8.11.2/8.11.1/Debian 8.11.0-6) id
> f32L0jL13101 	for linux-lvm@sistina.com; Mon, 2 Apr 2001 15:00:45
> -0600
> From: Andreas Dilger <adilger@turbolinux.com>
> Message-Id: <200104022100.f32L0jL13101@webber.adilger.int>
> Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
> In-Reply-To: <01040207434300.00937@darkvader> from Diederick van
> Dijk at "Apr=20
>  2, 2001 07:43:43 am"
> To: linux-lvm@sistina.com
> X-Mailer: ELM [version 2.4ME+ PL66 (25)]
> Sender: linux-lvm-admin@sistina.com
> Errors-To: linux-lvm-admin@sistina.com
> X-BeenThere: linux-lvm@sistina.com
> X-Mailman-Version: 2.0
> Precedence: bulk
> Reply-To: linux-lvm@sistina.com
> List-Help: <mailto:linux-lvm-request@sistina.com?subject=3Dhelp>
> List-Post: <mailto:linux-lvm@sistina.com>
> List-Subscribe:
> <http://lists.sistina.com/mailman/listinfo/linux-lvm>,=20
> <mailto:linux-lvm-request@sistina.com?subject=3Dsubscribe>
> List-Id: linux-lvm general discussion <linux-lvm.sistina.com>
> List-Unsubscribe:
> <http://lists.sistina.com/mailman/listinfo/linux-lvm>,=20
> <mailto:linux-lvm-request@sistina.com?subject=3Dunsubscribe>
> List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
> Date: Mon, 2 Apr 2001 15:00:44 -0600 (MDT)
>=20
> Diederick van Dijk writes:
> > I've a LVM of 8 physical volumes that I've created with LVM 0.9.1
> > beta 2. I've the know problem that vgscan reports that it can't
> > find my VG. So I upgraded to LVM 0.9.1 beta 6 (tools and kernel)
> > and runned on each physical disk a vgcfgrestore. Unfortunately I
> > didn't solve the problem. Attached is the output of the commands
> > vgdisplay -v and a pvdata -U for each  physical disk. Debug logs
> > a very huge so I won't attach them.
>=20
> OK, I have figured out why vgcfgrestore doesn't work properly with
> broken UUIDs.  It is because vgcfgrestore only restores the backup
> VGDA data to each disk separately.  This means it is not possible
> to have consistent UUIDs generated for all PVs in a VG when
> vgcfgrestore is run.
>=20
> You can try the following (experimental) procedure to fix the
> UUIDs: =20
>=20
> Check each PV with "pvdata -PP /dev/hdX" to ensure it has a valid
> UUID assigned.  Also get the PV numbers (starting with 1) for each
> of the PVs.  Finally, check the pv_uuidlist_on_disk.base for each
> PV. It will normally be 6144, but it does not have to be.
>=20
> for each PV (in PV# order)
>     dd if=3D/dev/hdX bs=3D1 skip=3D44 count=3D128 >> /tmp/uuids
>=20
> This should create a file /tmp/uuids which has all of the PV UUIDs
> in it. Make sure there are as many UUIDs in the file ("od -a
> /tmp/uuids" is good) as you have PVs (8 in your case).
>=20
> Now, we want to write the UUID list back to the PVs so vgscan is
> happy: =20
>=20
> for each PV (in any order)
>     dd if=3D/tmp/uuids of=3D/dev/hdX bs=3D1
> seek=3D<pv_uuidlist_on_disk.base for hdX> =20
>=20
> example:
>     dd if=3D/tmp/uuids of=3D/dev/hda2 bs=3D1 seek=3D6144
>=20
> Now vgscan should be able to detect all of the disks and work
> properly. =20
>=20
> Cheers, Andreas
> --=20
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of
> antipasto,=20
>                  \  would they cancel out, leaving him still
> hungry?" http://www-mddsp.enel.ucalgary.ca/People/adilger/        =20
>      -- Dogbert _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D-=3D-

Heinz Mauelshagen                                 Sistina Software
Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242
Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D-=3D-
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


-----BEGIN PGP SIGNATURE-----
Version: PGP 7.0.1

iQA/AwUBOxIvFnC+DNfF0nVpEQKmgwCfarpkfHIa1quSYmWmZI/jt/kos0UAn2H9
IG/9ISoYpGjVsBhPrktC8+yJ
=3DOo0s
-----END PGP SIGNATURE-----
