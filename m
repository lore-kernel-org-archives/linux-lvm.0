Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net>
	<3BA0AE16.1A4F69F@carolina.rr.com>
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Date: 19 Sep 2001 13:12:57 +0200
In-Reply-To: <3BA0AE16.1A4F69F@carolina.rr.com>
Message-ID: <87u1xzv3gm.fsf@arm.t19.ds.pwr.wroc.pl>
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

Jason Edgecombe <jedgecombe@carolina.rr.com> writes:

> you MUST run lvmcreate_initrd and use the initrd it creates if you run
> an LVM root fs.
btw. lvmcreate_initrd is broken. It copies /bin/bash and /bin/sh while
on some systems /bin/sh is link to /bin/othershell (like /bin/ksh on
my systems), so initrd created by lvmcreate_initrd is not usable on
these machines.

--=20
Arkadiusz Mi=EF=BF=BDkiewicz   IPv6 ready PLD Linux at http://www.pld.org.pl
misiek at pld.org.pl    AM2-6BONE, 1024/3DB19BBD, arekm@IrcNet, PWr
