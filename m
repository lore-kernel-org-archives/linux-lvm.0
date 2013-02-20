Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1KDUmlQ032270
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 08:30:48 -0500
Received: from jajo.eggsoft.pl (eggsoft.sp.imz.pl [212.106.158.142])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1KDUkrU032563
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 08:30:46 -0500
Date: Wed, 20 Feb 2013 14:30:43 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20130220143043.3a35f495@jajo.eggsoft>
In-Reply-To: <5124CD1F.1020506@pse-consulting.de>
References: <51238003.3050709@pse-consulting.de>
	<20130219145940.411cd271@jajo.eggsoft>
	<5124CD1F.1020506@pse-consulting.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] resize and snapshots with clvm
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: pgadmin@pse-consulting.de

On Wed, 20 Feb 2013 14:18:23 +0100
Andreas Pflug <pgadmin@pse-consulting.de> wrote:
> I would have expected lvm to take that exclusive lock implicitely
> when necessary?

I would not expect that. LVM provides means to activate in a shared or
exclusive way, but it does not choose itself.

> > When the LV is exclusively activated (lvchange -aey) snapshots
> > should work (and they do work for me).
>=20
> The volume is "lvchange -aly" active on one node and in use there
> (e.g. mounted or attached to a VM). If I try to lvchange -aey on that
> node, I get "Error locking on node xxxx: Device or resource busy".

I do not use '-aly' (in fact I am not sure what it does), so I cannot
relate.

> Actually, lock exclusive will even fail if the device is not in use,
> but only active locally.
>=20
> A workaround would probably be to activate the lv exclusively
> _before_ using it, but then it would be impossible to migrate the vm
> to another host later on.

I use clustered LVM for my VMs too and always use "-aey" locking mode =E2=
=80=93
each volume can be active on a single cluster node a time. When doing VM
migration I first deactivate the volume on one host, then activate
it (exclusively) on the other. I feel safer knowing none of the volumes
will ever be active on more than one host.

Is your scenario much different?

Greets,
	Jacek
