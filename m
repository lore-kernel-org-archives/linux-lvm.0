Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p35LaWO4031972
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 17:36:32 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p35LaRfK004238
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 17:36:27 -0400
Message-ID: <4D9B8B5A.2070104@abpni.co.uk>
Date: Tue, 05 Apr 2011 22:36:26 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>
	<4D9B82C5.3020704@ankh.org>
In-Reply-To: <4D9B82C5.3020704@ankh.org>
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



On 05/04/2011 21:59, James Hawtin wrote:
> On 05/04/2011 20:48, Jonathan Tripathy wrote:
>>
>> Yeah, I'll have to try this on a non-production server. Which kernel 
>> do you expect to crash? The Dom0 (Xen + LVM host) or the VM? Anyway, 
>> just thinking about it, it seems that pausing/saving/shutting down 
>> the VM is a must, as the VM may be writing to disk at the time of 
>> zeroing the cow (!!).
>>
>> In the hosting industy, what does everyone else do? Do they just 
>> ignore the issue???
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>> -----
>> No virus found in this message.
>> Checked by AVG - www.avg.com
>> Version: 10.0.1209 / Virus Database: 1500/3552 - Release Date: 04/05/11
>
> As an alturnative could you not?
>
> 1) Create snapshot lv using specific physical extents.
> lvcreate -s -l 100 ..... /dev/sdx1:0-99
> 2) Backup VM
> 3) Delete snapshot lv
> 4) create a normal lv using same physical extents
> lvcreate -l 100 ..... /dev/sdx1:0-99
> 5) zero normal lv
> 6) delete normal lv
>
> James 
Hi James,

Interesting, didn't know you could do that! However, how do I know that 
the PEs aren't being used by LVs? Also, could you please explain the 
syntax? Normally to create a snapshot, I would do:

lvcreate -L20G -s -n backup /dev/vg0/customerID

Thanks

Thanks
