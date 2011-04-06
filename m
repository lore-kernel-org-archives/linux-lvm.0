Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p361lgoj007913
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:47:42 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p361lcaB004292
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:47:39 -0400
Message-ID: <4D9BC63A.9040306@abpni.co.uk>
Date: Wed, 06 Apr 2011 02:47:38 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!
	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!
	kh.org>	<4D9BAD26.5010405@abpni.co.uk>	<4D9BB0D4.8050401@ankh.org>	<4D9BB398.5070007@abpni.co.uk>	<alpine.LRH.2.00.1104052035080.21002@bmsred.bmsi.com>	<alpine.LRH.2.00.1104052040090.21075@bmsred.bmsi.com>
	<4D9BC3A8.1070005@ankh.org>
In-Reply-To: <4D9BC3A8.1070005@ankh.org>
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



On 06/04/2011 02:36, James Hawtin wrote:
> On 06/04/2011 00:43, Stuart D. Gathman wrote:
>> In fact, since you still have to zero an LV before removing, you 
>> might as well
>> zero an LV when you allocate.  Same overhead.  Then you don't need to 
>> mess
>> with any of these schemes to deal with snapshots.  Did we already cover
>> that obvious solution?  We did discuss a utility to optimize zeroing an
>> already mostly zero LV.
>>
>
> I think you mean and lv of a virtual machine rather than snap shot, 
> not sure how you could zero the cow. Stuart does have a good point 
> here, there is another source of leak outside of snapshots (and 
> probably worse), if you delete an lv the create a new one over the 
> same PEs the data from then old lv will be there, save a few k that is 
> zeroed at the front (to help with fs/label creation). This is worse as 
> it is in order data that the cow from a snap is not. Geting a while fs 
> back is very possible. 

Currently, as part of our procedure, we zero LVs once a customer has 
left our service. The reason why we don't zero on allocation is that 
customer usually expect quick setup times (under 10 minutes) and zeroing 
gigabytes worth of space can take too long. Getting new zeroed LVs ready 
before sign ups also isn't an option but for other reasons.
