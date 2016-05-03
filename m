Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43IJSJ7025750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 14:19:28 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BDD68E3E7
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 18:19:23 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id B99A47FBFD
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 20:19:21 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 May 2016 20:19:21 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <41ff0c37397feb2fe9e4af6f44d01522@dds.nl>
Subject: Re: [linux-lvm] thin handling of available space
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek Kabelac schreef op 03-05-2016 17:45:

> It's not  'continued' suggestion.
>=20
> It's just the example of solution where   'filesystem & block layer'
> are tied together.  Every solution has some advantages and
> disadvantages.

So what if more systems were tied together in that way? What would be=20
the result?

Tying together does not have to do away with layers.

It is not either/or, it is both/and.

You can have separate layers and you can have intregration.

In practice all it would require is for the LVM, ext and XFS people to=20
agree.

You could develop extensions to the existing protocols that are only=20
used if both parties understand it.

Then pretty much btrfs has no raison d'=C3=AAtre anymore. You would have an=
=20
integrated system but people can retain their own identities as much as=20
they want.

 From what you say LVM+ext4/XFS is already a partner system anyway.

It is CLEAR LVM+BTRFS or LVM+ZFS is NOT a popular system.

You can and you could but it does not synergize. OpenSUSE uses btrfs by=20
default and I guess they use LVM just as well. For LVM you want a=20
simpler filesystem that does its own work.

(At the same time I am not so happy with the RAID capability of LVM, nor=20
do I care much at this point).

LVM raid seems for me the third solution after firmware raid, regular=20
dmraid and .... and that.

I prefer to use LVM on top of raid really. But maybe that's not very=20
helpful.


> So far I'm convinced layered design gives user more freedom - for the=20
> price
> of bigger space usage.

Well let's stop directing people to btrfs then.

Linux people have a tendency and habit to send people from pillar to=20
post.

You know what that means.

It means 50% of answers you get are redirects.

They think it's efficient to spend their time redirecting you or wasting=20
your time in other ways, rather than using the same time and energy=20
answering your question.

If the social Linux system was a filesystem, people would run benchmarks=20
and complain that its organisation is that of a lunatic.

Where 50% of read requests get directed to another sector, of which 50%=20
again get redirected, and all for no purpose really.

Write requests get 90% deflected. The average number of write requests=20
before you hit your target is about ... it converges exactly to 10.

If I had been better at math I would have known that :p.

You say:

"Please don't compare software to real life".

No, let's compare the social world to technology. We have very bad=20
technology if you look at it like that. Which in turn doesn't make the=20
"real" technology much better.



SUM( i * p * (1-p)^(i-1) ) with i =3D (1, inf) =3D 1/p.

with p a chance of success at each hit.

The sum of that formula with i iterating from 1 to infinite is 1/p.

With a hit chance of 90% per attempt, the average number of hits to be=20
successful is 1/.9 =3D 10/9.

I'm not very brilliant today.
