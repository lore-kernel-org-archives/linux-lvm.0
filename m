Return-Path: <josv@osp.nl>
Date: Mon, 5 Feb 2001 06:16:01 -0800
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] lv extend
Message-ID: <20010205061601.L13880@jadzia.josv.com>
References: <20010205050101.A13880@jadzia.josv.com> <Pine.LNX.4.21.0102051501320.438-100000@munster.noc.fr.clara.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.21.0102051501320.438-100000@munster.noc.fr.clara.net>; from james@fr.clara.net on Mon, Feb 05, 2001 at 03:10:19PM +0100
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Why not:

- go into single user mode
- umount /usr
- e2fsck -f /dev/lvdev/usr
- run resize2fs manually
- mount /usr
- df -h /usr

++Jos

And thus it came to pass that James wrote:
(on Mon, Feb 05, 2001 at 03:10:19PM +0100 to be exact)

>=20
> Hmmm... Sorry to be daft but I'm having trouble doing the /usr
>=20
> I boot into single
>=20
> umount /usr (its on /dev/lvdev/usr)
> Then I do e2fsadm /dev/lvdev/usr -L+500M
>=20
> I get the message "succesfully extended" etc but also
>=20
> resize2fs 1.19
> please run e2fsck -f /dev/lvdev/usr first.
>=20
> Needles to say a=20
>=20
> munster:/home/james# df -h =20
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/hda1             4.6G  1.9G  2.4G  44% /
> /dev/lvdev/home       1.4G  322M  1.0G  23% /home
> /dev/lvdev/var        984M   93M  842M  10% /var
> /dev/lvdev/usr        984M  485M  450M  52% /usr
>=20
> Dosen't show the size increase. But a vgdisplay -v does show it(It shows
> that I have tried twice :-)
>=20
> --- Logical volume ---
> LV Name                /dev/lvdev/usr
> VG Name                lvdev
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                2.93 GB
> Current LE             750
> Allocated LE           750
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
>=20
> What is strange is that the same manip worked perfectly for /home=20
> What am I missing?
>=20
> cheers
>=20
> On Mon, 5 Feb 2001, Jos Visser wrote:
>=20
> > /usr is doable, because in single user mode you ought to be able to
> > umount /usr. Just make sure that your LVM tools are outside /usr (/sbin
> > would be a good idea).
> >=20
> > Resizing the / file system would require considerable more work (rescue
> > system et cetera).
> >=20
> > For the really brave, there are patches that allow online resizing of
> > partitions.
> >=20
> > ++Jos
> >=20
> > And thus it came to pass that James wrote:
> > (on Mon, Feb 05, 2001 at 01:58:27PM +0100 to be exact)
> >=20
> > >=20
> > > It worked any way :-) Using e2fsadm. I succesfully resized my /home
> > > But what about changing an important 'partition' like /usr ? Do I hav=
e to
> > > do it with a rescue disk or something.
> > >=20
> > >=20
> > > On Mon, 5 Feb 2001, S. Michael Denton wrote:
> > >=20
> > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > Hash: SHA1
> > > >=20
> > > > Yes, printing the informative message may be a good idea as long as
> > > > it doesn't interfere with function (ie no 'hit enter to continue' or
> > > > anything like that). :)
> > > >=20
> > > > On Monday, 05 February 2001 07:44, James [SMTP:james@fr.clara.net]
> > > > wrote:
> > > > >=20
> > > > > Yes, I do have to agree. By reading the Doc I did quickly realize
> > > > > my error. The idea of printing a message is not bad though.
> > > > >=20
> > > > >=20
> > > > > On Mon, 5 Feb 2001, S. Michael Denton wrote:
> > > > >=20
> > > > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > > > Hash: SHA1
> > > > > >=20
> > > > > > Speaking as one with extensive experience with LVM on nearly
> > > > > > every major unix vendor, it is not a -problem- but more of a la=
ck
> > > > > > of knowledge on the user/administrator's part.  As I recall, the
> > > > > > documentation clearly notes that a filesystem that resides on an
> > > > > > lv must be extended after extending the lv else the OS will not
> > > > > > address the newly-allocated space.  IMHO it would be a -very- b=
ad
> > > > > > idea to automatically run ext2resize as not everyone uses ext2 =
on
> > > > > > lvm and I think repeated offers to ask if you want to resize th=
is
> > > > > > ext2
> > > > > > filesystem (that perhaps isn't even a filesystem at all) would
> > > > > > get terribly annoying and NT-ish.  Also there's the issue with
> > > > > > reduction... if you reduce an lv, LVM (linux LVM is not differe=
nt
> > > > > > than the other major unixes either) assumes that you have alrea=
dy
> > > > > > reduced any filesystems, tablespaces, etc that might be using
> > > > > > that space before you do the reduction.  Automatic reduction of=
 a
> > > > > > filesystem can be extraordinarily dangerous.
> > > > > >=20
> > > > > > Perhaps as a compromise it could be a configuration flag in some
> > > > > > lvm config file as to whether or not to automatically/offer
> > > > > > to/never resize filesystems after extension/reduction.
> > > > > >=20
> > > > > > Just a thought...
> > > > > >=20
> > > > > > On Monday, 05 February 2001 07:25, James
> > > > > > [SMTP:james@fr.clara.net] wrote:
> > > > > > >=20
> > > > > > > That would be great :-)
> > > > > > >=20
> > > > > > > On Mon, 5 Feb 2001, Tom Dawes-Gamble wrote:
> > > > > > >=20
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > 	This seems a Frequent problem we get it on HP-UX LVM too.
> > > > > > > > People do an lvextend and then wonder why the filesystem has
> > > > > > > > not grown to fill the lvol.
> > > > > > > >=20
> > > > > > > > 	Perhaps a message like.
> > > > > > > >=20
> > > > > > > > [root@ocalhost /root]# lvextend -l 256 /dev/vg01/lvol2
> > > > > > > > lvextend -- extending logical volume "/dev/vg01/lvol2" to 1
> > > > > > > > GB lvextend -- doing automatic backup of volume group "vg01"
> > > > > > > > lvextend -- logical volume "/dev/vg01/lvol2" successfully
> > > > > > > > extended =20
> > > > > > > >=20
> > > > > > > > Note:  You need to run a resize utility such as ext2resize
> > > > > > > > before 	the space is available in the file system.
> > > > > > > >=20
> > > > > > > > [root@localhost /root]#
> > > > > > > >=20
> > > > > > > > Or lvextend could check the mount table and offer to run
> > > > > > > > ext2resize for you.  If that seems like a neat idea I would
> > > > > > > > be willing to write the code.
> > > > > > > >=20
> > > > > > > > Regards,
> > > > > > > > Tom.
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > James wrote:
> > > > > > > > > >=20
> > > > > > > > > > Hello
> > > > > > > > > >=20
> > > > > > > > > > Is it normal after growing an LV not to see the change
> > > > > > > > > > with df -h ? But it can be seen with vgdisplay -v ?=20
> > > > > > > > > Did you also resize the filesystem? df shows filesystem
> > > > > > > > > sizes. If so, maybe a remount of the filesystem could hel=
p.
> > > > > > > > > =20
> > > > > > > > >=20
> > > > > > > > > Bye...
> > > > > > > > >=20
> > > > > > > > > 	Dirk
> > > > > > > > > --=20
> > > > > > > > > Dirk Heinrichs		| Tel:	+49 (0)241 413 260
> > > > > > > > > QIS Systemhaus GmbH	| Fax:	+49 (0)241 413 2640
> > > > > > > > > J=EF=BF=BDlicher Str. 338b	| Mail:	heinrichs@qis-systemha=
us.de
> > > > > > > > > D-52070 Aachen		| Web:	http://www.qis-systemhaus.de
> > > > > > > > > _______________________________________________
> > > > > > > > > linux-lvm mailing list
> > > > > > > > > linux-lvm@sistina.com
> > > > > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > --
> > > > > > > >  int/* PROCEDURE DIVISION.*>*/b,g,l,n=3D'/'/'/'<<2;extern v=
oid
> > > > > > > > printf();int main=20
> > > > > > > >  (int
> > > > > > > > d,char**z){char*o,*c=3D"%.9s%.7s%.7s\n";l=3D*(c+d+d)-*(c+d)=
;g=3D*c-d
> > > > > > > > -l;b =3Dl+n++;=20
> > > > > > > >    o=3D"  DISPLAY'tmdg@uksr'    '.hp.com'
> > > > > > > > *>"+g++;printf(c,o-b++,o+l,o);l=3D~++n;=20
> > > > > > > >    o=3D"  DISPLAY'http://www.itrc.hp.com/'
> > > > > > > > *>"+g++;printf(c,o-b++,o+l,o);exit();}
> > > > > > > > _______________________________________________
> > > > > > > > linux-lvm mailing list
> > > > > > > > linux-lvm@sistina.com
> > > > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > > >=20
> > > > > > >=20
> > > > > > > _______________________________________________
> > > > > > > linux-lvm mailing list
> > > > > > > linux-lvm@sistina.com
> > > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > >=20
> > > > > >=20
> > > > > > Scott Denton
> > > > > > smdenton@bellsouth.net
> > > > > > EFnet Handle: SteelWyng
> > > > > > ICQ UIN: 24149258
> > > > > > AIM Screen Name: SteelWyng
> > > > > >=20
> > > > > > -----BEGIN PGP SIGNATURE-----
> > > > > > Version: PGPfreeware 6.5.3 for non-commercial use
> > > > > > <http://www.pgp.com> =20
> > > > > >=20
> > > > > > iQA/AwUBOn6ehnC+DNfF0nVpEQJHSACcCDGbtHNQW+j+4uNASe7YvM4aUUgAnjtb
> > > > > > XiRAAN7W/5HQFuSbly6U3EK5
> > > > > > =3DFTvP
> > > > > > -----END PGP SIGNATURE-----
> > > > > >=20
> > > > > > _______________________________________________
> > > > > > linux-lvm mailing list
> > > > > > linux-lvm@sistina.com
> > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > >=20
> > > > >=20
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > >=20
> > > >=20
> > > > Scott Denton
> > > > smdenton@bellsouth.net
> > > > EFnet Handle: SteelWyng
> > > > ICQ UIN: 24149258
> > > > AIM Screen Name: SteelWyng
> > > >=20
> > > > -----BEGIN PGP SIGNATURE-----
> > > > Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.c=
om>
> > > >=20
> > > > iQA/AwUBOn6gg3C+DNfF0nVpEQK4zQCgw4Tx/ckW6bCzRk3XzARNNffXOMwAnif3
> > > > fH0z5syYCyRz2m+/5QbJJe3j
> > > > =3DJGAT
> > > > -----END PGP SIGNATURE-----
> > > >=20
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > >=20
> > >=20
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >=20
> > --=20
> > I have no need for a spirituality which can not encompass my humanness.
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
I have no need for a spirituality which can not encompass my humanness.
