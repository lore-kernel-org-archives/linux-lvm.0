Return-Path: <bs@infologic.fr>
Message-ID: <3A6ECF2F.87A006EF@infologic.fr>
Date: Wed, 24 Jan 2001 13:48:47 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fwd: 2.4.0 kernel doesn't see LVM
References: <OF48A10ED6.E78FC82F-ONC12569DE.00339875@icos.be>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

dirk.derycke@icos.be wrote:
>=20
> Hi all,
>=20
> for me the upgrade from 2.4.0-test12 to 2.4.0 was simple. I upgraded the
> user tools to 0.9
> rebooted with 2.4.0. Important note: my root partition is NOT LVM.
> Then I executed the vgscan from the 0.9 tools which detected the 0.8 LVM
> data, then I activated the volume group and mounted the LV's.
>=20
> A backup however is always a safe thing to do. But normally the above
> procedure should work fine...
> Note that I had a 2.2.14 with 0.7 tools first before 2.4.0-testXX and
> didn't have to backup and restore data...
>=20
> What would be the point of having industrial strength disk management when
> you have to backup and restore
> every software upgrade (imagine hundreds of gigs)?.
>=20
> regards,
>=20
> Dirk
>=20

I'm not sure that playing with version of critical software layers such
as LVM is a good idea if you value your data.

My experience say that you should make a backup of your data before
trying to upgrade to 0.9, but I'm parano=EF=BF=BDd.
