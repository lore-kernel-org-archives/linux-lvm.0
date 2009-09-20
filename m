Received: from [10.36.4.21] (vpn1-4-21.ams2.redhat.com [10.36.4.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8K8CQQG002920
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2009 04:12:27 -0400
Message-ID: <4AB5E3EA.7030106@redhat.com>
Date: Sun, 20 Sep 2009 10:12:26 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question on compatibility with 2.6.31 kernel.
References: <4AB3DE8E.9080301@candelatech.com>
	<4AB3E3F7.2060704@redhat.com>	<4AB3F3EE.5040004@candelatech.com>	<4AB520E3.4080209@Media-Brokers.com>
	<20090920001727.536e396c@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <20090920001727.536e396c@fixlaptop.gillibert.homelinux.net>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

Andr=C3=A9 Gillibert wrote:
>> Or, if I updated the kernel first and compiled it with the above
>> options, when lvm2 gets updated, will I need to recompile the kernel
>> with the above options disabled before the next reboot?
>>
>=20
> I don't think so. LVM guys are not evil. :)

Are you sure? ;-)=20

Well in fact this is not lvm2  problem, but problem with incompatible
changes in sysfs design.
(Recent lvm2 userspace code will recognise devices in all cases.)

But maybe there can be other problems, not related to lvm2 with these
deprecated options set - see e.g. http://lkml.org/lkml/2009/3/24/628

So for new kernel with old userspace (like udev etc) enable it, for new
distro with recent userspace keep it disabled.

Milan
