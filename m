Return-Path: <james@fr.clara.net>
Date: Mon, 5 Feb 2001 15:10:19 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] lv extend
In-Reply-To: <20010205050101.A13880@jadzia.josv.com>
Message-ID: <Pine.LNX.4.21.0102051501320.438-100000@munster.noc.fr.clara.net>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hmmm... Sorry to be daft but I'm having trouble doing the /usr

I boot into single

umount /usr (its on /dev/lvdev/usr)
Then I do e2fsadm /dev/lvdev/usr -L+500M

I get the message "succesfully extended" etc but also

resize2fs 1.19
please run e2fsck -f /dev/lvdev/usr first.

Needles to say a=20

munster:/home/james# df -h =20
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1             4.6G  1.9G  2.4G  44% /
/dev/lvdev/home       1.4G  322M  1.0G  23% /home
/dev/lvdev/var        984M   93M  842M  10% /var
/dev/lvdev/usr        984M  485M  450M  52% /usr

Dosen't show the size increase. But a vgdisplay -v does show it(It shows
that I have tried twice :-)

--- Logical volume ---
LV Name                /dev/lvdev/usr
VG Name                lvdev
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                2.93 GB
Current LE             750
Allocated LE           750
Allocation             next free
Read ahead sectors     120
Block device           58:1

What is strange is that the same manip worked perfectly for /home=20
What am I missing?

cheers

On Mon, 5 Feb 2001, Jos Visser wrote:

> /usr is doable, because in single user mode you ought to be able to
> umount /usr. Just make sure that your LVM tools are outside /usr (/sbin
> would be a good idea).
>=20
> Resizing the / file system would require considerable more work (rescue
> system et cetera).
>=20
> For the really brave, there are patches that allow online resizing of
> partitions.
>=20
> ++Jos
>=20
> And thus it came to pass that James wrote:
> (on Mon, Feb 05, 2001 at 01:58:27PM +0100 to be exact)
>=20
> >=20
> > It worked any way :-) Using e2fsadm. I succesfully resized my /home
> > But what about changing an important 'partition' like /usr ? Do I have =
to
> > do it with a rescue disk or something.
> >=20
> >=20
> > On Mon, 5 Feb 2001, S. Michael Denton wrote:
> >=20
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >=20
> > > Yes, printing the informative message may be a good idea as long as
> > > it doesn't interfere with function (ie no 'hit enter to continue' or
> > > anything like that). :)
> > >=20
> > > On Monday, 05 February 2001 07:44, James [SMTP:james@fr.clara.net]
> > > wrote:
> > > >=20
> > > > Yes, I do have to agree. By reading the Doc I did quickly realize
> > > > my error. The idea of printing a message is not bad though.
> > > >=20
> > > >=20
> > > > On Mon, 5 Feb 2001, S. Michael Denton wrote:
> > > >=20
> > > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > > Hash: SHA1
> > > > >=20
> > > > > Speaking as one with extensive experience with LVM on nearly
> > > > > every major unix vendor, it is not a -problem- but more of a lack
> > > > > of knowledge on the user/administrator's part.  As I recall, the
> > > > > documentation clearly notes that a filesystem that resides on an
> > > > > lv must be extended after extending the lv else the OS will not
> > > > > address the newly-allocated space.  IMHO it would be a -very- bad
> > > > > idea to automatically run ext2resize as not everyone uses ext2 on
> > > > > lvm and I think repeated offers to ask if you want to resize this
> > > > > ext2
> > > > > filesystem (that perhaps isn't even a filesystem at all) would
> > > > > get terribly annoying and NT-ish.  Also there's the issue with
> > > > > reduction... if you reduce an lv, LVM (linux LVM is not different
> > > > > than the other major unixes either) assumes that you have already
> > > > > reduced any filesystems, tablespaces, etc that might be using
> > > > > that space before you do the reduction.  Automatic reduction of a
> > > > > filesystem can be extraordinarily dangerous.
> > > > >=20
> > > > > Perhaps as a compromise it could be a configuration flag in some
> > > > > lvm config file as to whether or not to automatically/offer
> > > > > to/never resize filesystems after extension/reduction.
> > > > >=20
> > > > > Just a thought...
> > > > >=20
> > > > > On Monday, 05 February 2001 07:25, James
> > > > > [SMTP:james@fr.clara.net] wrote:
> > > > > >=20
> > > > > > That would be great :-)
> > > > > >=20
> > > > > > On Mon, 5 Feb 2001, Tom Dawes-Gamble wrote:
> > > > > >=20
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > =09This seems a Frequent problem we get it on HP-UX LVM too.
> > > > > > > People do an lvextend and then wonder why the filesystem has
> > > > > > > not grown to fill the lvol.
> > > > > > >=20
> > > > > > > =09Perhaps a message like.
> > > > > > >=20
> > > > > > > [root@ocalhost /root]# lvextend -l 256 /dev/vg01/lvol2
> > > > > > > lvextend -- extending logical volume "/dev/vg01/lvol2" to 1
> > > > > > > GB lvextend -- doing automatic backup of volume group "vg01"
> > > > > > > lvextend -- logical volume "/dev/vg01/lvol2" successfully
> > > > > > > extended =20
> > > > > > >=20
> > > > > > > Note:  You need to run a resize utility such as ext2resize
> > > > > > > before =09the space is available in the file system.
> > > > > > >=20
> > > > > > > [root@localhost /root]#
> > > > > > >=20
> > > > > > > Or lvextend could check the mount table and offer to run
> > > > > > > ext2resize for you.  If that seems like a neat idea I would
> > > > > > > be willing to write the code.
> > > > > > >=20
> > > > > > > Regards,
> > > > > > > Tom.
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > James wrote:
> > > > > > > > >=20
> > > > > > > > > Hello
> > > > > > > > >=20
> > > > > > > > > Is it normal after growing an LV not to see the change
> > > > > > > > > with df -h ? But it can be seen with vgdisplay -v ?=20
> > > > > > > > Did you also resize the filesystem? df shows filesystem
> > > > > > > > sizes. If so, maybe a remount of the filesystem could help.
> > > > > > > > =20
> > > > > > > >=20
> > > > > > > > Bye...
> > > > > > > >=20
> > > > > > > > =09Dirk
> > > > > > > > --=20
> > > > > > > > Dirk Heinrichs=09=09| Tel:=09+49 (0)241 413 260
> > > > > > > > QIS Systemhaus GmbH=09| Fax:=09+49 (0)241 413 2640
> > > > > > > > J=FClicher Str. 338b=09| Mail:=09heinrichs@qis-systemhaus.d=
e
> > > > > > > > D-52070 Aachen=09=09| Web:=09http://www.qis-systemhaus.de
> > > > > > > > _______________________________________________
> > > > > > > > linux-lvm mailing list
> > > > > > > > linux-lvm@sistina.com
> > > > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > --
> > > > > > >  int/* PROCEDURE DIVISION.*>*/b,g,l,n=3D'/'/'/'<<2;extern voi=
d
> > > > > > > printf();int main=20
> > > > > > >  (int
> > > > > > > d,char**z){char*o,*c=3D"%.9s%.7s%.7s\n";l=3D*(c+d+d)-*(c+d);g=
=3D*c-d
> > > > > > > -l;b =3Dl+n++;=20
> > > > > > >    o=3D"  DISPLAY'tmdg@uksr'    '.hp.com'
> > > > > > > *>"+g++;printf(c,o-b++,o+l,o);l=3D~++n;=20
> > > > > > >    o=3D"  DISPLAY'http://www.itrc.hp.com/'
> > > > > > > *>"+g++;printf(c,o-b++,o+l,o);exit();}
> > > > > > > _______________________________________________
> > > > > > > linux-lvm mailing list
> > > > > > > linux-lvm@sistina.com
> > > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > >=20
> > > > > >=20
> > > > > > _______________________________________________
> > > > > > linux-lvm mailing list
> > > > > > linux-lvm@sistina.com
> > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > >=20
> > > > >=20
> > > > > Scott Denton
> > > > > smdenton@bellsouth.net
> > > > > EFnet Handle: SteelWyng
> > > > > ICQ UIN: 24149258
> > > > > AIM Screen Name: SteelWyng
> > > > >=20
> > > > > -----BEGIN PGP SIGNATURE-----
> > > > > Version: PGPfreeware 6.5.3 for non-commercial use
> > > > > <http://www.pgp.com> =20
> > > > >=20
> > > > > iQA/AwUBOn6ehnC+DNfF0nVpEQJHSACcCDGbtHNQW+j+4uNASe7YvM4aUUgAnjtb
> > > > > XiRAAN7W/5HQFuSbly6U3EK5
> > > > > =3DFTvP
> > > > > -----END PGP SIGNATURE-----
> > > > >=20
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > >=20
> > > >=20
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >=20
> > >=20
> > > Scott Denton
> > > smdenton@bellsouth.net
> > > EFnet Handle: SteelWyng
> > > ICQ UIN: 24149258
> > > AIM Screen Name: SteelWyng
> > >=20
> > > -----BEGIN PGP SIGNATURE-----
> > > Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com=
>
> > >=20
> > > iQA/AwUBOn6gg3C+DNfF0nVpEQK4zQCgw4Tx/ckW6bCzRk3XzARNNffXOMwAnif3
> > > fH0z5syYCyRz2m+/5QbJJe3j
> > > =3DJGAT
> > > -----END PGP SIGNATURE-----
> > >=20
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >=20
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
> --=20
> I have no need for a spirituality which can not encompass my humanness.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
