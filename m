Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NK3nGn014075
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 15:03:49 -0500
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NK3cCC024644
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 15:03:38 -0500
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p1NK2m8u018083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:02:48 -0600
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p1NK3ZXB023050
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:03:36 -0600
Message-ID: <4D656817.6060900@gmail.com>
Date: Wed, 23 Feb 2011 14:03:35 -0600
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>
	<4D655459.6050806@gmail.com>
	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 2/23/2011 1:39 PM, Stuart D. Gathman wrote:
> On Wed, 23 Feb 2011, Les Mikesell wrote:
>
>>>> Actually, if you never (or rarely) write to the origin, lots of snapshots
>>>> should be fine.
>>>
>>>> But every write to the origin will first copy the
>>>> original origin data to every snapshot.
>>>>
>>> Why would origin data be copied over to the snapshot after the snapshot
>>> has been created? Surely the point of a snapshot is to have "frozen" data?
>>
>> Yes, is the way this actually works explained somewhere?  I would have
>> expected the 'copy-on-write' blocks to be copied only on the side where the
>> write is happening and relocated instead of rewriting all the snapshots that
>> might be outstanding with the old data.
>
> It should be obvious when you think about it.

Well, maybe if you've never used a NetApp.  They seem to make a big deal 
out of only writing once.

> You go to write to the origin,
> to a block you've never written to since creating the snapshot.  Where
> are you going to save that original data?  Why in the *-cow LV of course.
>
> The origin and snapshot LVs do not have data of their own.  The
> origin data is in *-real, and new writes to the origin first read *-real,
> write *-cow, then finally do the new write to *-real.  This read-write-write
> cycle is tolerable for a single snapshot, but quickly gets out of hand
> with multiple snapshots.

Which is why re-writing stuff that was already correct and not being 
modified doesn't make much sense.

> Writes to the snapshot, on the other hand, simply write to the *-cow with
> some mapping, no need to update the origin.

I would have guessed that snapshots were read-only. If you can write, it 
isn't really a snapshot, is it?

-- 
   Les Mikesell
     lesmikesell@gmail.com
