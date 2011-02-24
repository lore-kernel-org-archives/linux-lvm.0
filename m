Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1O09hJ4017296
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:09:44 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1O09UTK026795
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:09:31 -0500
Message-ID: <4D65A1A9.1040205@abpni.co.uk>
Date: Thu, 24 Feb 2011 00:09:13 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>
	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>
	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
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


On 23/02/11 23:25, Stuart D. Gathman wrote:
> On Wed, 23 Feb 2011, Jonathan Tripathy wrote:
>
>> Give that I currently follow the current procedure for removing and adding
>> customers:
>>
>> To remove customer: zero out customer LV, then remove LV
>> To add customer: create a new LV
>>
>> And I want to run backups of a customer's LV using snapshots I just:
>> create a snapshot of the customer LV, then use rsync, then remove the
>> snapshot. Is there anything I should do to prevent cross-customer data
>> leakage?
> You are still ambiguous.  If by "create a new LV", you mean a new LV
> that is not an LVM snapshot, then just zero it out when you create it
> (rather than when you delete it).
This is exactly what I mean. However I was hoping to avoid zeroing an LV 
on creation due to the long amount of time it takes to perform such a 
task (about 40 mins). It takes so long as I have to select a small 
enough block size so that disk bandwidth is still available to the other 
customers using their VPSes.

This is why I'm trying to understand where data is stored while a 
snapshot is created for an origin. All my snapshots will be read only.

So I'm guessing then, that when a snapshot is created for an origin, 
then there are 2 physical copies of the data on disk? (Albeit only one 
is accessible at the regular filesystem level)

> IDEA - it seems that the device mapper could logically zero an LV by
> simply returning blocks of zero on reads until the corresponding block
> it written.  Yeah, would require overhead to track which blocks have
> been written.  That overhead could be 1 bit for each of fairly large blocks,
> and be fairly small, fit into ram easily, and be stored in a logically
> zeroed block and discarded when the last block is written.  So effectively
> it only requires storing a pointer in meta-data to the current block where
> the bitmap is stored.  I can see that compared to the simplicity of
> simply writing zeroes on allocation, it might not be worth it.
>
This sounds like a really good idea. Would be very useful in a 
multi-tenant environment. However it should be an option feature.
