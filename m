Date: Wed, 11 Jun 2014 09:59:49 +0200
From: Christian Hesse <mail@eworm.de>
Message-ID: <20140611095949.7c429a61@leda.localdomain>
In-Reply-To: <539722BD.20903@mooluv.com>
References: <53924E22.60403@mooluv.com> <53958348.3000501@redhat.com>
	<5395CA79.90508@mooluv.com> <5396BA8B.7060307@redhat.com>
	<539722BD.20903@mooluv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/EzDL/nirXcbMRr5dsvY7yyO";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] lvm Bug? - bad reaction to snapshot creation
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Leeman Strout <me@mooluv.com>
Cc: LVM, development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--Sig_/EzDL/nirXcbMRr5dsvY7yyO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Leeman Strout <me@mooluv.com> on Tue, 2014/06/10 11:22:
> On 06/10/2014 03:58 AM, Zdenek Kabelac wrote:
> > Dne 9.6.2014 16:53, Leeman Strout napsal(a):
> >> On 06/09/2014 05:50 AM, Zdenek Kabelac wrote:
> >>> Dne 7.6.2014 01:26, Leeman Strout napsal(a):
> >>> Hi
> >>>
> >>> Unsure if this relates to all your problem (since I'm not sure how
> >>> arch linux is in sync with udev rules & systemd version)
> >>>
> >>> At certain moment systemd added a new 'feature' about locking
> >>> devices while updating internal udev state - this locking ignores any
> >>> udev rule flags and opens internal lvm2 devices - so while for now
> >>> it's been again disabled for 'dm' devices - you might have installed
> >>> version of system which has the 'lock everything' feature in?
> >> systemd 213-6 is what Arch reports, as far as I can tell from the
> >> PKGBUILD
> >> it's vanilla 213 plus 2 patches:
> >> - backport fix for faily MACAddress matching (FS#40675)
> >> - backport fix for fsck/udev mess (FS#40706)
> >
> >
> > this commit should be fixing problems for lvm2 & latest systemd:
> >
> > e918a1b5a94f270186dca59156354acd2a596494
> >
> > and this is systemd commit which has introduced problem:
> >
> > 3d06f4183470d42361303086ed9dedd29c0ffc1b
> >
> > Unsure what do you have in your arch build.
>=20
> This patch:=20
> http://lists.freedesktop.org/archives/systemd-devel/2014-June/019863.html=
=20
> applied and tested in Arch solves the issue.

This has been applied to systemd-213-9 (and systemd upstream) already. ;)
--=20
Schoene Gruesse
Chris
                         O< ascii ribbon campaign
                   stop html mail - www.asciiribbon.org

--Sig_/EzDL/nirXcbMRr5dsvY7yyO
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTmAx1AAoJEFTtyRYJvJGDSSwP/0VkVzAsY/L+PXzL4Pwks+Lp
Ou/CecXtb6qaQOPKb+v9rVdtovRvjfQBNvaX9DbPLhQPANLkfwQpmKPfjUtulMCP
8Jpt7KaA0lELH32LIYCM+4kG2sOE6RFQQ9V8FvfpUVxTUI9W+OXwBXOVfR9YMhbg
1esfW56r9uzWZNRkOjLHK4jV0WrfwcbDTUTUp93V11QXjZHzDeliH2Lzzd59XhMk
Yd0Ijpx4z4xDjUko6SrzPzPt7yYUK8IFikUUw4J7JZaVUv3zLrFaFZm7oI1UD1n+
tG1mJ4CoM9ytKwkZAwTZcuH93XBULR5ymPEZpXIFfbrReeY69NwdX2e4Na3ir31T
bGNcxC0601zfmMWwQW3t70hqiNHlk0b6yvTBbA4ALN06IRCeUMmVGAIMa2pIrgIn
sujc7/B3WtVOOwDdyAXro3Q7ZwKjFBOu4EnU9Mak7ZJhX0vujJKXj6baaiECQQxF
4pub/T9+6F45GRhWwzOdeZgreiMw4TddEPPcflT0HtA6zSV4tn05Q46zgW/YHty+
2JHSR0KFDWn7RC4ZdzS1xVWcxx44i/QJNMdjhCrcuyJ+vptCIsZtf+T2yW1AfHiO
a7FY6htlgwt7HBVMfjAKgCRWr28GOGr6+6vnw1JZgBLquULBim+MxECEu5kvcX5i
ZFseityz96+TSYEceOj4
=OdxZ
-----END PGP SIGNATURE-----

--Sig_/EzDL/nirXcbMRr5dsvY7yyO--
