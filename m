From: Ragnar =?unknown-8bit?Q?Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] [Q] patch to overcome 2TB block device limit?
Message-ID: <20030510002217.GE16354@vestdata.no>
References: <b9fsao$k3s$1@main.gmane.org> <20030509194249.GB6189@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030509194249.GB6189@localhost>
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
Date: Fri May  9 19:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, May 09, 2003 at 09:42:49PM +0200, Jose Luis Domingo Lopez wrote:
> On Friday, 09 May 2003, at 18:29:46 +0900,
> A. S. wrote:
> > Is there any kernel patches to exceed the 2TB kernel block device lim=
it ?
> > I want to be able to create about single 5TB LV.
> >=20
> Yes, and it has been in mainline 2.5.x kernels for a while now. Do a
> "make menuconfig" and under "Block devices" the last option is=20
> "[ ] Support for Large Block Devices". From the help:
>=20
>   x CONFIG_LBD:                                                        =
     x  =20

But does it support > 2 GB LVM logical volumes too now, or just > 2GB md-
devices like it used to?

--=20
Ragnar Kj=F8rstad
Zet.no
