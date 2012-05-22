Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4MGeeUg013374
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 12:40:40 -0400
Received: from hobgoblin.beer.org.uk (beer.org.uk [91.84.48.107])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4MGeda5030678
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 12:40:40 -0400
Received: from hobgoblin.beer.org.uk (hobgoblin [127.0.0.1] (may be forged))
	by hobgoblin.beer.org.uk (8.13.1/8.13.1) with ESMTP id q4MGecJD013946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 17:40:39 +0100
Message-ID: <54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
In-Reply-To: <4FBBB834.302@redhat.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
Date: Tue, 22 May 2012 17:40:36 +0100 (BST)
From: "Vic" <lvm@beer.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fun and games with mirroring
Reply-To: lvm@beer.org.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

>> You can do it to a box that hasn't been set up with mdadm...
>
> Sure but you will need LVM set up.

I always have.

> In that case, why not use LVM's snapshot capabilities?

Because that doesn't do what I want.

I'm not looking to have a LVM snapshot. I'm looking to have a duplicate
disk. This allows me to experiment on one, whilst keeping the other safe.
Alternatively, it allows me to migrate from one disk to another without
too much risk - before anyone points me at pvmove, I lost a filesystem
when that fell over on a live machine once :-(

> You might find this works better for this particular use of mirroring
> but you can also try the --splitmirrors option to the lvconvert
> command (but it will be less efficient since it will take a
> block-by-block copy of the origin during the lvconvert -m1 rather than
> just recording changes as a snapshot would). Mirror splitting was
> added in 2.02.88 (about nine months old).

--splitmirrors would seem to do what I'm after *except* that it will leave
the mirror unbootable without further attention (the machine won't boot
with the wrong name on the LVs)

> I've found that dracut doesn't always handle LVM errors particularly
> gracefully (in particular if there is a problem the dracut main loop
> appears to reset state after leaving the interactive shell so even if
> you do fix the problem such that the system could continue to boot it
> will just fail in the same way again) and by the sound of it this
> could be improved for your case too.

This is true - but sorta misses the point; a LV mirror is not a LV mirror
if it won't activate. Adding a mirror means that a faliure of *either*
side renders the whole unusable.

> Ideally you'd want the initramfs scripts to carry out the same actions
> as the defined mirror repair policy during startup (or to invoke
> lvconvert --repair to do the same).

Well, we can call it Somebody Else's Problem, or perhaps LVM should be
able to use a broken mirror - that's how every other mirror system works,
and is generally the very reason for having a mirror at all. I consider
this to be a bug within LVM.

Vic.
