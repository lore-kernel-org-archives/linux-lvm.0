From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] FW: Logical Volume Manager
Message-ID: <20020805210711.G20768@vestdata.no>
References: <FOEKLLKHFOMPIDEHNBHMMEAJCDAA.mmouw@sistina.com> <20020805182225.GA28108@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020805182225.GA28108@localhost>; from linux-lvm@24x7linux.com on Mon, Aug 05, 2002 at 08:22:25PM +0200
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
Date: Mon Aug  5 14:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Aug 05, 2002 at 08:22:25PM +0200, Jos=E9 Luis Domingo L=F3pez wro=
te:
> On Monday, 05 August 2002, at 12:17:47 -0500,
>=20
> > Hi There,
> >           I wonder if you can help me please, I want to setup a 11TB =
single
> > volume under Redhat Linux 7.3 but LVM appears to only support 300GB i=
s it
> > possible for it to support 11TB.
> >=20
>=20
> With the default settings (PE size of 4 MB) there is a limit of 256 GB
> per LV in current LVM versions (1.x series). For such a large LV choose
> a larger PE size at vgcreate time. From its manual page:

Even with a larger PE-size the maximum lv-size is 2TB.
Hopefully it will change soon.


--=20
Ragnar Kj=F8rstad
Big Storage.
