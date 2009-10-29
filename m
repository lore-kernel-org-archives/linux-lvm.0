Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9TNxdvr024404
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 19:59:39 -0400
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9TNxTwA006477
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 19:59:29 -0400
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail2.stercomm.com (Postfix) with ESMTP id C40F4341E5
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 19:59:28 -0400 (EDT)
Subject: Re: [linux-lvm] Best Practices deploying LVM
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <868096450910291645k49ebb1dfn1e55e5132805011e@mail.gmail.com>
References: <868096450910291645k49ebb1dfn1e55e5132805011e@mail.gmail.com>
Date: Thu, 29 Oct 2009 18:58:32 -0500
Message-Id: <1256860712.31532.217.camel@geeko>
Mime-Version: 1.0
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

On Fri, 2009-10-30 at 00:45 +0100, Abraham P=C3=A9rez wrote:
> Hi everyone,
>=20
> I'm looking for some whitepapper or similar document to find any kind
> of best practices using LVM.
>=20
> For example, usually i make only one volume group in each server and
> inside it I create different logical volumes for different purposes,
> but talking with one colleague, we discover that he makes one volume
> group for each logical volume (more or less)... so my final question
> is: in performance terms, what configuration is more efficient and
> why?

Define "efficient"... anyhow, the idea of a volume group is
to present a pool of storage.  So making a volume group per logical
volume sort of defeats the intended purpose.

So... a volume group has more to do with defining a class of
storage pool.  Ideally physical volumes inside of a single volume
group have some kind of relationship (e.g. maybe they are all
of the same speed or type or raid, etc).  It's common for low
end systems to have just one volume group.  However, you COULD
segment storage pool types by function.  Thus you could have
a System volume group for the OS volumes and a Data volume group
for user data (just an example).

There is a lot of ways to look at it.

Personally, just because of pvmove, I see physical volumes
as whole disks and not a myriad of piece meal partitions.
That way you get the potential ability to move data off
of a physical volume in a volume group to free areas on
different drives in that same group and remove a drive
from the volume group and from the system (e.g. think of upgrading
the size of drives you use inside of a volume group... you could
use this to upgrade the drives without having to necessarily
take anything down).

So my best practices...

1. Use multiple volume groups to define classes of storage.

2. Use full disk physical volumes over partitions.

3. I like unique naming of volume groups just so that if
a drive lands else where, and it presents itself to the system,
it will not collide with existing volume group names.
(but there is good reason for not doing this... and really
only a factor if you have a tendency to throw drives into
different computers all of the time)

>=20
> Please excuse my writen english, but I don't use it very often.

I use english all of the time.... it doesn't seem to help.
