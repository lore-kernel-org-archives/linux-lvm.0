Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5M3Exph001481
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 23:15:00 -0400
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.1.38])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5M3EwZP010936
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 23:14:58 -0400
Date: Thu, 21 Jun 2007 23:14:57 -0400 (EDT)
Message-Id: <200706220314.XAA27738@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <Pine.LNX.4.44.0706201722500.12479-100000@bmsred.bmsi.com>
	(stuart@bmsi.com)
Subject: [linux-lvm] Does pv failure effect whole vg?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

    Date: Wed, 20 Jun 2007 17:36:23 -0400 (EDT)
    From: "Stuart D. Gathman" <stuart@bmsi.com>

    On Wed, 20 Jun 2007, Richard van den Berg wrote:

    > To answer my own question: when a pv is not available at boot time, the
    > vg using that pv does not come up. So splitting vgs makes sense when you
    > want to minimize the impact of one disk failure.

    Hmmm.  On AIX LVM, vgs still boot when physical volumes fail, provided
    there is a "quorum".  The metadata is redundantly stored on all PVs,
    so a "quorum" means that more than half of the metadata copies
    are available and at the same version.

    I think Linux LVM stores only metadata for that PV on a PV, but there
    is a backup in /etc/lvm.

    If the system truly won't boot with a failed disk, that kind of adds another
    reason why current LVM mirroring support is useless.

I can also confirm that Linux LVM won't activate a VG that's missing
PVs.  Under Ubuntu Breezy, I had a VG divided into one tiny LV for
the usual OS dirs (/bin /etc /home /var etc etc) and one large LV
(spanning both the boot disk and a second disk) for a single large
filesystem.  While I was doing some hardware reconfiguration (details
irrelevant), I tried booting with the second disk disconnected, and
LVM couldn't activate any of the VG, including the LV that held the OS
itself, even though that LV definitely didn't cross into the second
disk.  (It was created months before the second disk was added, was
never extended, and thus consisted of a single PV.)

Once I discovered that, and since I was reconfiguring how its disks
worked anyway, I started over and created two VGs.  The first held a
single LV, which held the OS, and the second VG held another LV, which
spans boths disks and holds the large filesystem.  -That- will boot
with the second disk disconnected:  the first VG is activated and the
OS boots, and the second VG won't activate (unless, I assume, I force
it with --partial) because it's missing one of its PVs, but since the
filesystem that the OS is on isn't in that VG, at least the machine
boots.

(Yes, it'd probably be possible to make my own initrd that did
everything the normal one does but supplies --partial in the right
place, but that'd be a total pain to keep up-to-date across every
automatic kernel update, etc.  Given that I knew I'd be blowing away
the entire disk structure and starting over, it was far easier to just
create two VGs; presumably there'd have been some sneaky way [not using
the normal LVM API] to have changed the on-disk data structures in-place
if I'd been desperate, since in theory nothing about the size or placement
of the LVs would necessarily have changed.)
