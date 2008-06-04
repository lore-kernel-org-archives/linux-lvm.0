Received: from engineering.redhat.com (engineering.redhat.com [10.10.36.82])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m54B74ti001442
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:07:04 -0400
Received: from engineering.redhat.com (localhost.localdomain [127.0.0.1])
	by engineering.redhat.com (8.13.1/8.13.1) with ESMTP id m54B74tw006590
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:07:04 -0400
Received: from localhost (mpatocka@localhost)
	by engineering.redhat.com (8.13.1/8.13.1/Submit) with ESMTP id
	m54B73ZY006585
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:07:03 -0400
Date: Wed, 4 Jun 2008 07:07:03 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212525167.29076.191.camel@pc.ilinx>
Message-ID: <Pine.LNX.4.64.0806040656380.2902@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525167.29076.191.camel@pc.ilinx>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>



On Tue, 3 Jun 2008, Brian J. Murrell wrote:

> On Tue, 2008-06-03 at 15:26 -0400, Mikulas Patocka wrote:
>> Hi
>
>> Merging allows you to copy data in snapshot back to the origin device.
>
> Cool.
>
>> During merging, aby
> typo? ------------^^^

Yes, there should be "any".

>>  reads and writes to the origin device are identical to
>> accesses to the merging snapshots.
>
> So the origin looks 100% merged as soon as the merging starts?

Yes. You can immediatelly mount the origin read-write and you see the 
content of the snapshot being merged.

>> There may be multiple snapshots while one of them is being merged ---
>> exceptions in other snapshots are being allocated and there snapshots are
>> kept stable.
>
> So basically, before blocks are copied up from the merging snapshot to
> the origin, the blocks to be overwritten (in the origin) are first
> copied down to other snapshots of the same origin?

Yes.

> Is it smart about a block that is to be copied up to the origin being
> the same as the corresponding blocks in peer snapshots?  By "smart" I
> mean erase the block in the peer's snapshot and put back the pointer up
> to the origin.

No.

> A pedantic example would be to create an origin, O1 and then a snapshot
> of O1 called S1.  Make a bunch of changes to S1 and then create another
> snapshot of O1 called S2 and then block copy from S1 to S2 (presumably,
> although I don't know for sure, S2 only contains the same changed blocks
> as S1).

No, if you block copy over /dev/vg/snapshot device, it will contain all 
the blocks (regardless if they differ from the origin or not).

There could theoretically be compare function, testing if the write equals 
to actual data and dropping the write eventually --- but it would be too 
much coding overhead for too little practical advantage.

> Now if you merge S1 up to O1, ideally S2 should be "empty".

Snapshots are never shrunk (except when being merged) --- the metadata 
format doesn't allow to remove arbitrary exception from the exception 
table.

Mikulas

>> Don't try to concurrently merge more than one snapshot
>
> Heh.
>
> b.
>
>
