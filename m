Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net>
	<3BA0AE16.1A4F69F@carolina.rr.com>
	<87u1xzv3gm.fsf@arm.t19.ds.pwr.wroc.pl>
	<20010919165134.R14526@turbolinux.com>
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Date: 22 Sep 2001 13:51:51 +0200
In-Reply-To: <20010919165134.R14526@turbolinux.com>
Message-ID: <87bsk3cujs.fsf@arm.t19.ds.pwr.wroc.pl>
MIME-Version: 1.0
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

Andreas Dilger <adilger@turbolabs.com> writes:

> > btw. lvmcreate_initrd is broken. It copies /bin/bash and /bin/sh while
> > on some systems /bin/sh is link to /bin/othershell (like /bin/ksh on
> > my systems), so initrd created by lvmcreate_initrd is not usable on
> > these machines.
>=20
> Please try the below patch.  If it works I can check it into CVS.
It follows symlink when copying shell, so IMO it's ok to commit.

Anyway created initrd won't work on PLD kernels due to other reason
- we don't have ext2 compiled into kernel; all filesystems
except ROMFS are compiled as modules because are kernels are highly
modularized (ROMFS is used on our initrd ramdisks). It will be nice
thing to see support for other FSes when creating ramdisks in
lvmcreate_initrd. Our tool for generating initrd ramdisks (geninitrd)
can use rom, ext2 and cram as FS but it doesn't support lvm yet :-)

> Cheers, Andreas

--=20
Arkadiusz Mi=EF=BF=BDkiewicz   IPv6 ready PLD Linux at http://www.pld.org.pl
misiek(at)pld.org.pl   AM2-6BONE, 1024/3DB19BBD, arekm(at)ircnet, PWr
