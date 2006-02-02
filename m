Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12M1p108210
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 17:01:51 -0500
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12M1gR2027543
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 17:01:42 -0500
Subject: Re: [linux-lvm] Question about hardware LVM
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <7cce3190602021308n184bcc43m@mail.gmail.com>
References: <7cce3190602021308n184bcc43m@mail.gmail.com>
Date: Thu, 02 Feb 2006 17:01:18 -0500
Message-Id: <1138917679.7774.148.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

i guess u can get that information from manual.

the hardware probably can grow the size dynamically. but it might still
depends on host to grow the fs.

linux seems can not handle the read_capacity data changed msg from san.
so probably u will need to grow it, reconnect from linux, find the
changed size, then run fs tools to grow it.

still, check manual is the way to go.

ming

On Thu, 2006-02-02 at 22:08 +0100, Javier de Miguel Rodr=C3=ADguez wrote:
> Hello
>=20
> I have been successfully using LVM on RedHat Linux Server with no
> hassle. We are now deploying a $BIGVENDOR expensive FiberChannel SAN.
> One of the main features of this SAN is that is able to grow a
> filesystem
>=20
> How does Linux handle this? Do I still have to use LVM? If I still
> have to use LVM I do NOT see the point of "hardware base growing".
> Simply, create a new LUN in the SAN and I can join to our LVM setup.
>=20
> Maybe this is a "Storage 101" questio, but I do not fully understand
> expensive SAN "hardware based"  filesystem grow.
>=20
> Thank you in advance
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
