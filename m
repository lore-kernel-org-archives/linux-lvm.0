Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3SIPx8T014132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 14:25:59 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91356C05681D
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 18:25:56 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 2D9B27F48F
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 20:25:55 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 28 Apr 2016 20:25:55 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <445afc4b9ae3fbf477f8f66db9d28580@dds.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Continuing from previous mail I guess. But I realized something.

> A responsible sysadmin who chose to use thin pools might configure the
> initial FS size to be some modest size well within the constraints of
> the actual block store, and then as the FS hit say 85% utilization to
> run a script that investigated the state of the block layer and use
> resize2fs and friends to grow the FS and let the thin-pool likewise 
> grow
> to fit as IO gets issued. But at some point when the competing demands
> of other FS on thin-pool were set to breach actual block availability
> the FS growth would be denied and thus userland would get signaled by
> the FS layer that it's out of space when it hit 100% util.

Well of course what you describe here are increasingly complex 
strategies
that require development and should not be put on invidual 
administrators
(or even organisations) to devise and come up with.

Growing filesystems? If you have a platform where continous thin pool
growth is possible (and we are talking of well developed, complex setups
here) then maybe you have in-house tools to take care of all of that.

So you suggest a strategy here that involves both intelligent automatic
administration of the FS layer as well as the block layer.

A concerted strategy where for example you do have a defined thin volume
size but you constrain your FS artificially AND depend its intelligence 
on
knowledge of your thin pool size. And then you have created an
intelligence where the "filesystem agent" can request growth, and 
perhaps
the "block level agent" may grant or deny it such that FS growth is 
staged
and given hard limits at every point. And then you have the same
functionality as what I described other than that it is more sanely
constructed at intervals.

No continuous updating, but staged growth intervals or moments.

> But either way if you have a sudden burst of I/O from competing
> interests in the thin-pool, what appeared to be a safe growth 
> allocation
> at one instant of time is not likely to be true when actual writes try
> to get fulfilled.

So in the end monitoring is important but because you use a thin pool
there are like 3 classes of situations that change:

* Filesystems will generally have more leeway because you are /able/ to
provide them with more (virtual) space to begin with, in the assumption
that you won't readily need it, but it's normally going to be there when
it does.

* Hard limits in the filesystem itself is still a use case that has no
good solution; most applications will start crashing or behaving weirdly
when out of diskspace. Freezing a filesystem (when it is not a system
disk) might be equally well of a good mitigation strategy as anything 
that
involves "oh no, I am out of diskspace and now I am going to ensure
endless trouble as processes keep trying to write to that empty space -
that nonexistent space". If anything I don't think most systems 
gracefully
recover from that.

Creating temporary filesystems for important parts is not all that bad.

* Thin volumes do allow you to make better use of the available space 
(as
per btrfs, I guess) and give many advantages in moving data around.

The only detriment really to thin for a desktop power user, so to speak
is:

1. Unless you monitor it directly in some way, the lack of information 
is
going to make you feel rather annoyed and insecure

2. Normally user tools do inform you of system status (a user-run "ls" 
or
"df" is enough) but you cannot have lvs information unless run as root.

The system-config-lvm tool just runs as setuid. I can add volumes 
without
authenticating as root.

Regular command line tools are not accessible to the user.


So what I have been suggesting obviously seeks to address point 2. I am
more than willing to address point 1 by developing something, but I'm 
not
sure I will ever be able to develop again in this bleak sense of decay I
am experiencing life to be currently ;-).

Anyhow, it would never fully satisfy for me.

Even with a perfect LVM monitoring tool, I would experience a consistent
lack of feedback.

Just a simple example: I can adjust "df" to do different stuff. But any
program reporting free diskspace is going to "lie" to me in that sense. 
So
yes I've chosen to use thin LVM because it is the best solution for me
right now.

At the same time indeed, I lack information and this information cannot 
be
sourced directly from the block layer because that's not how computer
software works. Computer software doesn't interface with the block 
layer.
They interface with filesystems and report information from there.

Technically I consider autoextend not that great of a solution either.

It begs the question: why did you not start out with a larger volume in
the first place? You going to keep adding disks as the thing grows?

I mean, I don't know. If I'm some VPS user and I'm running on a
thinly-provisioned host. Maybe it's nice to be oblivious. But unless my
host has a perfect failsafe setup, the only time I am going to be 
notified
of failure is if my volume (that I don't know about) drops or freezes.

Would I personally like having a tool that would show at some point
something going wrong at the lower level? I think I would.

An overprovisioned system with individual volumes that individually 
cannot
reach their max size is a bad system.

That they can't do it all at the same time is not that much of a 
problem.
That is not very important.

Yet considering a different situation -- suppose this is a host with few
clients but high data requirements. Suppose there are only 4 thin 
volumes.
And suppose every thin volume is going to be something of 2TB or make it
anything as large as you want.

(I just have 50GB on my vps). Suppose you had a 6TB disk and you
provisioned it for 4 clients x 2TB. Economies of scale only start to
really show their benefit with much higher number of clients. With 200
clients the "averaging" starts to work in your favour giving you a
dependable system that is not going to suddenly do something weird.

But with smaller numbers you do run into the risk of something going
amiss.

The only reason lack of feedback would not be important for your clients
is if you had a large enough pool, and individual volumes would be just 
a
small part of that pool, say 50-100 volumes per pool.

So I guess I'm suggesting there may be a use case for thin LVM in which
you do not have this >10 number of volumes sitting in any pool.

And at that point personally even if I'm the client of that system, I do
want to be informed.

And I would prefer to be informed *through* the pipe that already 
exists.

Thin pools lie. Yes. But it's not a lie of the space is available. It's
only a lie if the space is no longer available!!!!!!!.

It is not designed to lie.
