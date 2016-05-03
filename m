Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43ALBcm008778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 06:21:11 -0400
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 3598D627F5
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 10:21:10 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.04) id 57173DDE00B8AD13 for linux-lvm@redhat.com;
	Tue, 3 May 2016 12:15:45 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 958D2268645
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 12:15:44 +0200 (CEST)
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <57287A50.5020506@assyoma.it>
Date: Tue, 3 May 2016 12:15:44 +0200
MIME-Version: 1.0
In-Reply-To: <CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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


On 02/05/2016 16:32, Mark Mielke wrote:
>
> 2) Frequent snapshots. In many of our use cases, we may take snapshots
> every 15 minutes, every hour, and every day, keeping 3 or more of each.
> If this storage had to be allocated in full, this amounts to at least
> 10X the storage cost. Using snapshots, and understanding the rate of
> churn, we can use closer to 1X or 2X the storage overhead, instead of
> 10X the storage overhead.
>
> 3) Snapshot as a means of achieving a consistent backup at low cost of
> outage or storage overhead. If we "quiesce" the application (flush
> buffers, put new requests on hold, etc.) take the snapshot, and then
> "resume" the application, this can be achieved in a matter of seconds or
> less. Then, we can mount the snapshot at a separate mount point and
> proceed with a more intensive backup process against a particular
> consistent point-in-time. This can be fast and require closer to 1X the
> storage overhead, instead of 2X the storage overhead.
>

This is exactly my main use case.

>
>
> The WARNING is a cover-your-ass type warning that is showing up
> inappropriately for us. It is warning me something that I should already
> know, and it is training me to ignore warnings. Thinp doesn't have to be
> the answer to everything. It does, however, need to provide a block
> device visible to the file system layer, and it isn't invalid for the
> file system layer to be able to query about the nature of the block
> device, such as "how much space do you *really* have left?"

As this warning appears on snapshots, it is quite annoying in fact. On 
the other hand, I fully understand that the developers want to avoid 
"blind" overprovisioning. A commmand-line (or a lvm.conf) option to 
override the warning would be welcomed, though.

> This seems to be a crux of this debate between you and the other people.
> You think the block storage should be as transparent as possible, as if
> the storage was not thin. Others, including me, think that this theory
> is impractical, as it leads to edge cases where the file system could
> choose to fail in a cleaner way, but it gets too far today leading to a
> more dangerous failure when it allocates some block, but not some other
> block.
>
> ...
>
>
> It is your opinion that extending thin volumes to allow the file system
> to have more information is breaking some fundamental law. But, in
> practice, this sort of thing is done all of the time. "Size", "Read
> only", "Discard/Trim Support", "Physical vs Logical Sector Size", ...
> are all information queried from the device, and used by the file
> system. If it is a general concept that applies to many different device
> targets, and it will help the file system make better and smarter
> choices, why *shouldn't* it be communicated? Who decides which ones are
> valid and which ones are not?

This seems reasonable. After all, a simple "lsblk" already reports 
plenty of information to the upper layer, so adding a 
"REAL_AVAILABLE_SPACE" info should not be infeasible.

>
> I didn't disagree with all of your points. But, enough of them seemed to
> be directly contradicting my perspective on the matter that I felt it
> important to respond to them.
>

Thinp really is a wonderful piece of technology, and I really thanks the 
developer for it.

>
>
> --
> Mark Mielke <mark.mielke@gmail.com <mailto:mark.mielke@gmail.com>>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
