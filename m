Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NJnD5N009313
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:49:13 -0500
Received: from aspen.rjl.com (aspen.rjl.com [66.35.48.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NJn29T019675
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:49:02 -0500
Received: from stardust.rjl.com (173-16-199-31.client.mchsi.com
	[173.16.199.31])
	by aspen.rjl.com (vPostMaster) with ESMTP id 288321D028A
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 11:49:30 -0800 (PST)
Message-ID: <4D6564AD.9040605@rjl.com>
Date: Wed, 23 Feb 2011 11:49:01 -0800
From: Nataraj <incoming-redhat@rjl.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>
	<4D655459.6050806@gmail.com>
In-Reply-To: <4D655459.6050806@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
To: linux-lvm@redhat.com

On 02/23/2011 10:39 AM, Les Mikesell wrote:
> On 2/23/2011 12:19 PM, Jonathan Tripathy wrote:
>>
>>>> So you're not worried about the security implication of leftovers in
>>>> free
>>>> space, and just want a base image to clone for new customers?
>>>>
>>>> The logical thing to do is to keep the origin volume untouched (except
>>>> for upgrading now and then), and take a snapshot for each customer.
>>>> Each snapshot would then be a new clone of the origin. Unfortunately,
>>>> large numbers of snapshots are inefficient for writes to new data,
>>>> so you'd likely have to "dd" to an independent LV instead. (This is
>>>> being
>>>> worked on, and there are 3rd party products like Zumastor that fix it
>>>> now.)
>>> Actually, if you never (or rarely) write to the origin, lots of
>>> snapshots
>>> should be fine.
>>
>>> But every write to the origin will first copy the
>>> original origin data to every snapshot.
>>>
>> Why would origin data be copied over to the snapshot after the snapshot
>> has been created? Surely the point of a snapshot is to have "frozen"
>> data?
The content of the snapshot is not changing. Previously the data in the
snapshot was a pointer to the origin.  When you rewrite data in the
origin, the old data gets moved to the cow device which is owned by the
snapshot, not by the origin.  So the view of the snapshot does not
change, only that for the underlying data that was changed in the
origin, the previous data is moved to the snapshot's cow and now the
snapshot points to that data in the cow instead of in the origin volume.

 I would be careful of using the word frozen, because you can actually
make changes to the snapshot volume if you wanted to, so it is not
really frozen.

>
> Yes, is the way this actually works explained somewhere?  I would have
> expected the 'copy-on-write' blocks to be copied only on the side
> where the write is happening and relocated instead of rewriting all
> the snapshots that might be outstanding with the old data.
>
I don't know for sure, but it sounds like it is currently done this
way.  Ideally there could be some kind of data sharing between multiple
snapshots.  I suspect the data gets copied (instead of just changing
pointers) to avoid excessive fragmentation in the origin volume.

Nataraj
