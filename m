Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4MEoEww029070
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 10:50:14 -0400
Received: from hobgoblin.beer.org.uk (beer.org.uk [91.84.48.107])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4MEoDsc025131
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 10:50:13 -0400
Received: from hobgoblin.beer.org.uk (hobgoblin [127.0.0.1] (may be forged))
	by hobgoblin.beer.org.uk (8.13.1/8.13.1) with ESMTP id q4MEoC7K000887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 15:50:12 +0100
Message-ID: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
Date: Tue, 22 May 2012 15:50:12 +0100 (BST)
From: "Vic" <lvm@beer.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Fun and games with mirroring
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
To: linux-lvm@redhat.com


Hi All.

Forgive me if this has been dealt with before - I couldn't find a search
tool for the archives...

I've just had a play with LVM mirroring. It appears to have a rather
serious usability issue.

I added a new drive to my system, created a PV, then used lvconvert -m1 to
mirror my various volumes. Sure enough, the new PV eventually contained my
data. As far as I knew, I now had failure resilience at the LVM layer.

So I simulated a failure - I powered down the machine and removed the new
drive. And then it all went wrong.

The boot sequence went through Grub, then failed. It could not find my
root FS. Swapping drives to the other one did exactly the same - neither
disk from my "mirror" was bootable.

After a bit of poking at it, I found that the LVM system would not start
the VG with a missing PV. Even after starting it manually (and mounting
it, and looking at it) at a recovery shell (dracut? I'm not sure), I still
couldn't get the machine booted.

I fixed it eventually by booting into a LiveUSB. The only thing I could
get to work was to vgreduce --removemissing --force each of the disks.
This is clearly not the sort of thing we ought to be doing for something
as simple as a disk failure...

So it is that using LVM mirrors, we end up with the machine being rendered
unbootable if either disk fails. That can't be right, can it?

Vic.

p.s. The reason I want to do this with LVM mirrors rather than MD RAID is
that this is potentially a very useful way of grabbing a backup snapshot
of a machine prior to some risky operation - it allows me to "fork" a
machine onto two sets of media. But if it leaves the result unbootable,
that's something of a problem...
