From: Anselm Kruis <A.Kruis@science-computing.de>
Subject: Re: [linux-lvm] snapshot safetynet?
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJIEOHJEAA.steve.wray@paradise.net.nz>
Message-Id: <Pine.LNX.4.02.10202190931010.14840-100000@murnau.science-computing.de>
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
Date: Tue Feb 19 02:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, 19 Feb 2002, Steve Wray wrote:

> Ok, heres a thought;
> Resizing filesystems is a risky operation,
> by and large, especially shrinking them.
>=20
> So I had the thought;
> Take a snapshot of the filesystem to shrink,
> use fs tools and lvm tools to shrink it,
> if it goes wrong, restore the snapshot!

I'vd done something similar. I use a patch to enable writes on snapshots.
Once I had to shrink a root filesytem on LVM. I created an writeable
snapshot, rebooted with the snapshot as root filesystem. Thisway the real=
=20
root fs wasn't mounted and I could shrink it without problems.

>=20
> Will it work tho? I'm wondering it lvreduce
> will get confused about the snapshot or if
> the snapshot system will cope with such a huge
> change...
No problem. But I use a patched LVM to allow writeable snapshots.

>=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20

---
 Anselm Kruis                                 Tel. +49 (0)89-356386-74
 science + computing ag=09=09              FAX  +49 (0)89-356386-37
 Ingolst=E4dter Str. 22             mailto: A.Kruis@science-computing.de
 D-80807 M=FCnchen                 WWW: http://www.science-computing.de/

**********************************************************************
***     CeBIT 2002                                                 ***
***     Besuchen Sie uns auf der CeBIT vom 13.-20.03.2002          ***
***     auf dem Messegel=E4nde in Hannover, Halle 11                 ***
**********************************************************************
