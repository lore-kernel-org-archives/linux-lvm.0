From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] lvcreate distributed extent option
Message-ID: <20021130170037.A15308@vestdata.no>
References: <615A249B783CD41192F400D0B747AC860898265A@hesse.bbn.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <615A249B783CD41192F400D0B747AC860898265A@hesse.bbn.hp.com>; from holger_zecha@hp.com on Sat, Nov 30, 2002 at 03:02:38PM +0100
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
Date: Sat Nov 30 10:01:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: oolon@pzat.meep.org, lvm-devel@sistina.com

On Sat, Nov 30, 2002 at 03:02:38PM +0100, ZECHA,HOLGER (HP-Germany,ex1) w=
rote:
> > How about striping with the strip size equal to that of a logical ext=
ent?
>=20
> This allows us to do more I/O's per second

Only if you're only using a single or a few files at the time. If you're
using many files in parallel you will get more I/O's per second by
concatenating the devices instead if striping them. (that's what LVM
does by default)



--=20
Ragnar Kj=F8rstad
