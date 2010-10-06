Received: from twilight.int.mornfall.net ([10.3.112.5])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o96HedI3011436
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 13:40:43 -0400
From: Petr Rockai <prockai@redhat.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
	<4CAB46FE.9050309@cfl.rr.com>
	<86106.13599.qm@web120714.mail.ne1.yahoo.com>
	<Pine.LNX.4.64.1010061255250.12083@bmsred.bmsi.com>
Date: Wed, 06 Oct 2010 19:40:22 +0200
In-Reply-To: <Pine.LNX.4.64.1010061255250.12083@bmsred.bmsi.com> (Stuart
	D. Gathman's message of "Wed, 6 Oct 2010 13:03:22 -0400 (EDT)")
Message-ID: <87ocb7jk3d.fsf@twilight.int.mornfall.net.>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM mirror questions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Phillip Susi <psusi@cfl.rr.com>

"Stuart D. Gathman" <stuart@bmsi.com> writes:
> The current LVM strategy could work, just use the option to store the 
> mirror log on the same PV as one of the mirrors.  If you lose the PV
> without the log - no problem.  If you lose the PV *with* the log, it
> reverts to an in-core log, which is not a problem with the single remaining
> leg.  The drawback to this is performance.  The main reason to put the
> mirror log on a 3rd device is so the 3 writes occasioned by every write
> to the LV can be done in parallel.

Yes, (write) performance is a concern. Otherwise, what you describe is
perfectly valid and achievable with LVM.

> I don't know how LVM handles issues of PVs that are not permanently dead
> and come back on line again later.  The md driver uses a generation count in
> the super block to determine which is newer. (How is that updated without loss
> of efficiency?)

LVM has a generation counter as well. It's only updated on metadata
writes though, so it doesn't cost anything. (Log is not part of metadata
in this sense.) When you lose a leg (and use dmeventd), the metadata on
the remaining PVs is updated to say that. The leg is also yanked from
the mirror. You can add it as a fresh image (with full resync) if it
ever comes back.

If you yank disks out of mirrors often (and plug them back afterwards),
you should maybe use replication instead of mirroring.

Yours,
   Petr.
