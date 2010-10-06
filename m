Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o96H3cpe003663
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 13:03:38 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o96H3QBW022971
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 13:03:27 -0400
Date: Wed, 6 Oct 2010 13:03:22 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <86106.13599.qm@web120714.mail.ne1.yahoo.com>
Message-ID: <Pine.LNX.4.64.1010061255250.12083@bmsred.bmsi.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
	<4CAB46FE.9050309@cfl.rr.com>
	<86106.13599.qm@web120714.mail.ne1.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Phillip Susi <psusi@cfl.rr.com>

On Wed, 6 Oct 2010, Jay wrote:

> Thank you for your answer and advice.  How unfortunate about lvm mirroring
> being broken.  I like your suggestion about how it SHOULD work.   In fact,
> long ago in a different age when I was working with rs6000s, I believe that
> is how reliable mirroring was accomplished with the ibm lvm.  Either that or

Yes, AIX mirroring was great.

The current LVM strategy could work, just use the option to store the 
mirror log on the same PV as one of the mirrors.  If you lose the PV
without the log - no problem.  If you lose the PV *with* the log, it
reverts to an in-core log, which is not a problem with the single remaining
leg.  The drawback to this is performance.  The main reason to put the
mirror log on a 3rd device is so the 3 writes occasioned by every write
to the LV can be done in parallel.

I don't know how LVM handles issues of PVs that are not permanently dead
and come back on line again later.  The md driver uses a generation count in
the super block to determine which is newer. (How is that updated without loss
of efficiency?)

I still use the md driver myself.  The LVM mirror support just doesn't "feel"
reliable yet.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
