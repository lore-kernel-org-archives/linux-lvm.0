Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NIK9Vc023634
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 13:20:09 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NIJuBF018511
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 13:19:57 -0500
Message-ID: <4D654FBD.8030504@abpni.co.uk>
Date: Wed, 23 Feb 2011 18:19:41 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On 23/02/11 18:05, Stuart D. Gathman wrote:
> On Wed, 23 Feb 2011, Stuart D. Gathman wrote:
>
>> So you're not worried about the security implication of leftovers in free
>> space, and just want a base image to clone for new customers?
>>
>> The logical thing to do is to keep the origin volume untouched (except
>> for upgrading now and then), and take a snapshot for each customer.
>> Each snapshot would then be a new clone of the origin.  Unfortunately,
>> large numbers of snapshots are inefficient for writes to new data,
>> so you'd likely have to "dd" to an independent LV instead.  (This is being
>> worked on, and there are 3rd party products like Zumastor that fix it now.)
> Actually, if you never (or rarely) write to the origin, lots of snapshots
> should be fine.

> But every write to the origin will first copy the
> original origin data to every snapshot.
>
Why would origin data be copied over to the snapshot after the snapshot 
has been created? Surely the point of a snapshot is to have "frozen" data?
