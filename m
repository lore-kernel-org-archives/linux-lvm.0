Return-Path: <bagfors@bagfors.nu>
Message-Id: <200102052117.WAA03621@detrius.engohol.se>
Subject: Re: [linux-lvm] lv extend
From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
In-Reply-To: <20010205143445.A5041@jhereg.dmeyer.net>
References: <01C08F47.ADAB2B60.smdenton@bellsouth.net>  
	<20010205143445.A5041@jhereg.dmeyer.net>
Content-Transfer-Encoding: quoted-printable
Date: 05 Feb 2001 22:17:03 +0100
Mime-Version: 1.0
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

On 05 Feb 2001 14:34:45 -0500,  wrote:
> In article <Pine.LNX.4.21.0102051355290.698-100000@munster.noc.fr.clara.n=
et> you write:
> >=20
> > It worked any way :-) Using e2fsadm. I succesfully resized my /home
> > But what about changing an important 'partition' like /usr ? Do I have =
to
> > do it with a rescue disk or something.
>=20
> FYI, reiserfs apparently allows resizing of a mounted filesystem.
> Mind you, I'd do a backup before trying anything resembling that, but
> then backing up before resizing is always a good idea.
>=20


I have resized reiserfs online alot.  I have never had any problems with
it.  Am at the point=20
where I don't do backups at all because everything just works so good. =20

Ofcourse.. I live alittle bit dangerous when doing that I know...

/Erik

--=20
Erik B=E5gfors               | http://erik.bagfors.nu/   =20
erik@bagfors.nu            | Erik.Bagfors@engohol.se
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
