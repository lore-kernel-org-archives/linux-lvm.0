Return-Path: <smdenton@bellsouth.net>
Message-ID: <01C08F47.ADAB2B60.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] lv extend
Date: Mon, 5 Feb 2001 07:45:55 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yes, printing the informative message may be a good idea as long as
it doesn't interfere with function (ie no 'hit enter to continue' or
anything like that). :)

On Monday, 05 February 2001 07:44, James [SMTP:james@fr.clara.net]
wrote:
>=20
> Yes, I do have to agree. By reading the Doc I did quickly realize
> my error. The idea of printing a message is not bad though.
>=20
>=20
> On Mon, 5 Feb 2001, S. Michael Denton wrote:
>=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > Speaking as one with extensive experience with LVM on nearly
> > every major unix vendor, it is not a -problem- but more of a lack
> > of knowledge on the user/administrator's part.  As I recall, the
> > documentation clearly notes that a filesystem that resides on an
> > lv must be extended after extending the lv else the OS will not
> > address the newly-allocated space.  IMHO it would be a -very- bad
> > idea to automatically run ext2resize as not everyone uses ext2 on
> > lvm and I think repeated offers to ask if you want to resize this
> > ext2
> > filesystem (that perhaps isn't even a filesystem at all) would
> > get terribly annoying and NT-ish.  Also there's the issue with
> > reduction... if you reduce an lv, LVM (linux LVM is not different
> > than the other major unixes either) assumes that you have already
> > reduced any filesystems, tablespaces, etc that might be using
> > that space before you do the reduction.  Automatic reduction of a
> > filesystem can be extraordinarily dangerous.
> >=20
> > Perhaps as a compromise it could be a configuration flag in some
> > lvm config file as to whether or not to automatically/offer
> > to/never resize filesystems after extension/reduction.
> >=20
> > Just a thought...
> >=20
> > On Monday, 05 February 2001 07:25, James
> > [SMTP:james@fr.clara.net] wrote:
> > >=20
> > > That would be great :-)
> > >=20
> > > On Mon, 5 Feb 2001, Tom Dawes-Gamble wrote:
> > >=20
> > > > Hi,
> > > >=20
> > > > 	This seems a Frequent problem we get it on HP-UX LVM too.
> > > > People do an lvextend and then wonder why the filesystem has
> > > > not grown to fill the lvol.
> > > >=20
> > > > 	Perhaps a message like.
> > > >=20
> > > > [root@ocalhost /root]# lvextend -l 256 /dev/vg01/lvol2
> > > > lvextend -- extending logical volume "/dev/vg01/lvol2" to 1
> > > > GB lvextend -- doing automatic backup of volume group "vg01"
> > > > lvextend -- logical volume "/dev/vg01/lvol2" successfully
> > > > extended =20
> > > >=20
> > > > Note:  You need to run a resize utility such as ext2resize
> > > > before 	the space is available in the file system.
> > > >=20
> > > > [root@localhost /root]#
> > > >=20
> > > > Or lvextend could check the mount table and offer to run
> > > > ext2resize for you.  If that seems like a neat idea I would
> > > > be willing to write the code.
> > > >=20
> > > > Regards,
> > > > Tom.
> > > >=20
> > > > >=20
> > > > > James wrote:
> > > > > >=20
> > > > > > Hello
> > > > > >=20
> > > > > > Is it normal after growing an LV not to see the change
> > > > > > with df -h ? But it can be seen with vgdisplay -v ?=20
> > > > > Did you also resize the filesystem? df shows filesystem
> > > > > sizes. If so, maybe a remount of the filesystem could help.
> > > > > =20
> > > > >=20
> > > > > Bye...
> > > > >=20
> > > > > 	Dirk
> > > > > --=20
> > > > > Dirk Heinrichs		| Tel:	+49 (0)241 413 260
> > > > > QIS Systemhaus GmbH	| Fax:	+49 (0)241 413 2640
> > > > > J=FClicher Str. 338b	| Mail:	heinrichs@qis-systemhaus.de
> > > > > D-52070 Aachen		| Web:	http://www.qis-systemhaus.de
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > >=20
> > > >=20
> > > >=20
> > > > --
> > > >  int/* PROCEDURE DIVISION.*>*/b,g,l,n=3D'/'/'/'<<2;extern void
> > > > printf();int main=20
> > > >  (int
> > > > =
d,char**z){char*o,*c=3D"%.9s%.7s%.7s\n";l=3D*(c+d+d)-*(c+d);g=3D*c-d
> > > > -l;b =3Dl+n++;=20
> > > >    o=3D"  DISPLAY'tmdg@uksr'    '.hp.com'
> > > > *>"+g++;printf(c,o-b++,o+l,o);l=3D~++n;=20
> > > >    o=3D"  DISPLAY'http://www.itrc.hp.com/'
> > > > *>"+g++;printf(c,o-b++,o+l,o);exit();}
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
> >=20
> > Scott Denton
> > smdenton@bellsouth.net
> > EFnet Handle: SteelWyng
> > ICQ UIN: 24149258
> > AIM Screen Name: SteelWyng
> >=20
> > -----BEGIN PGP SIGNATURE-----
> > Version: PGPfreeware 6.5.3 for non-commercial use
> > <http://www.pgp.com> =20
> >=20
> > iQA/AwUBOn6ehnC+DNfF0nVpEQJHSACcCDGbtHNQW+j+4uNASe7YvM4aUUgAnjtb
> > XiRAAN7W/5HQFuSbly6U3EK5
> > =3DFTvP
> > -----END PGP SIGNATURE-----
> >=20
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


Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOn6gg3C+DNfF0nVpEQK4zQCgw4Tx/ckW6bCzRk3XzARNNffXOMwAnif3
fH0z5syYCyRz2m+/5QbJJe3j
=3DJGAT
-----END PGP SIGNATURE-----
