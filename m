Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NIdZP6030495
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 13:39:35 -0500
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NIdOvd029715
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 13:39:24 -0500
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p1NIcY0g019032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 12:38:34 -0600
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p1NIdLRZ021892
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 12:39:22 -0600
Message-ID: <4D655459.6050806@gmail.com>
Date: Wed, 23 Feb 2011 12:39:21 -0600
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk>
In-Reply-To: <4D654FBD.8030504@abpni.co.uk>
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

On 2/23/2011 12:19 PM, Jonathan Tripathy wrote:
>
>>> So you're not worried about the security implication of leftovers in
>>> free
>>> space, and just want a base image to clone for new customers?
>>>
>>> The logical thing to do is to keep the origin volume untouched (except
>>> for upgrading now and then), and take a snapshot for each customer.
>>> Each snapshot would then be a new clone of the origin. Unfortunately,
>>> large numbers of snapshots are inefficient for writes to new data,
>>> so you'd likely have to "dd" to an independent LV instead. (This is
>>> being
>>> worked on, and there are 3rd party products like Zumastor that fix it
>>> now.)
>> Actually, if you never (or rarely) write to the origin, lots of snapshots
>> should be fine.
>
>> But every write to the origin will first copy the
>> original origin data to every snapshot.
>>
> Why would origin data be copied over to the snapshot after the snapshot
> has been created? Surely the point of a snapshot is to have "frozen" data?

Yes, is the way this actually works explained somewhere?  I would have 
expected the 'copy-on-write' blocks to be copied only on the side where 
the write is happening and relocated instead of rewriting all the 
snapshots that might be outstanding with the old data.

-- 
   Les Mikesell
     lesmikesell@gmail.com
