Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104032136.f33LaKu17343@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
In-Reply-To: <01040322434600.00930@darkvader> from Diederick van Dijk at "Apr
 3, 2001 10:43:46 pm"
Date: Tue, 3 Apr 2001 15:36:20 -0600 (MDT)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Diederick van Dijk writes:
> Diederick van Dijk writes:
> > My current system is on kernel 2.4.2 with LVM support build into the
> > kernel. So I booted with a 2.2.18 kernel with no LVM support what so ever
> > and the dd commands worked fine. Then I booted with the 2.4.2 kernel again
> > and did a vgscan and this worked too ! I checked the UUID's on the PV's
> > with pvdata -U /dev/hdxx and the UUID lists are now as they have to be. If
> > guess that LVM support in the kernel and dd were in conflict. To check that
> > I will boot with a 2.4.2 kernel without LVM support and try the dd dd
> > commands later on.
> 
> Ok, I tested the dd commands with the 2.4.2 kernel without LVM support and 
> had no success.

Strange.  I just tried (on a 2.4.2 kernel):

# dd if=/dev/hda2 bs=1 skip=44 count=128 of=/tmp/uuids
128+0 records in
128+0 records out
# dd of=/dev/hda2 bs=1 seek=44 count=128 if=/tmp/uuids
128+0 records in
128+0 records out

It worked with no problems.  Maybe there is something strange about the
version of dd that you have?  I have:

# dd --version
dd (GNU fileutils) 4.0.35

Can you try running "strace dd of=/dev/hda2 bs=1 seek=6144 if=/tmp/uuids"
and see where it gets the error from?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
