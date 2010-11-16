Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAG09bkG011983
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 19:09:37 -0500
Received: from mail-qy0-f174.google.com (mail-qy0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAG09ODH009227
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 19:09:24 -0500
Received: by qyk12 with SMTP id 12so4108909qyk.12
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 16:09:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1011151846160.4947@bmsred.bmsi.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
	<4CDDE2CE.90907@bmsi.com>
	<AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
	<Pine.LNX.4.64.1011151846160.4947@bmsred.bmsi.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Mon, 15 Nov 2010 16:09:03 -0800
Message-ID: <AANLkTi=0C5Bn==LQJ+KG02UFGGo9FfVoh43LUtF+u79K@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2010 at 15:51, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Mon, 15 Nov 2010, chris (fool) mccraw wrote:
>
>> > BTW, rewriting that 1G file would be normal speed, since
>> > the modified chunks have already been copied to the snapshot.
>>
>> i'd think that, and you'd think that, but it is not the case. �most of
>> my tests were done by rewriting the file 4x, and while the snap %used
>> (monitored with the 'lvs' command) doesn't keep going up, performance
>> stays the same.
>
> Are you writing to the snapshot or the origin? �If writing to the
> snapshot, and if your snap% is stable, then you are getting the addition seek
> time to jump over to the COW for those sectors.

I've never written to the snapshot, or even mounted it except to prove
that i could...


> Once the COW has the copy of the original data for a chunk, then reads/writes
> to that chunk on the origin should be identical to reads/writes without the
> snapshot, except for some minor CPU overhead.

i don't doubt that, but i don't even want to write to a snapshot.  i
want to write to the primary, and only occasionally even read from the
snapshot.  it is the writes to the primary that i have been
documenting.


> Another possibility is that while the snap% is not visibly increasing, you
> are in fact updating new areas with each test.

and it's also possible i've been misremembering about the snap% not
growing.  in fact in a quick test, it did grow with each rewrite.
perhaps i am remembering a test on an ext3 parent, whereas i am now
using xfs.
