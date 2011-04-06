Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p360oebY007793
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:50:40 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p360oZY1024513
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:50:36 -0400
Message-ID: <4D9BB8DB.6070906@abpni.co.uk>
Date: Wed, 06 Apr 2011 01:50:35 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!	kh.org>	<4D9BAD26.5010405@abpni.co.uk>
	<4D9BB0D4.8050401@ankh.org>	<4D9BB398.5070007@abpni.co.uk>
	<4D9BB703.3030101@ankh.org>
In-Reply-To: <4D9BB703.3030101@ankh.org>
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



On 06/04/2011 01:42, James Hawtin wrote:
> On 06/04/2011 00:28, Jonathan Tripathy wrote:
>> Ok, i think I get it now. At the minute, my vg (vg0) only has on PV 
>> in it (/dev/md3 which you can tell is a mdadm RAID device). I wasn't 
>> aware you could add more PVs (that's pretty cool!). So, let's say I 
>> had a spare partition (/dev/hdb7 as an example). To my vg0 volume 
>> group, I would firstly:
>>
>> pvcreate /dev/hdb7
>> vgextend /dev/hdb7
>
> Right however danger warnings are going off in my mind now!
>
>> Then, every time I create a new customer LV, I would do:
>>
>> lvcreate -nNewCustomerLV -L20G vg0 /dev/md3
>
> yes that would work
>
>>
>> Then, every time I wanted to create a snapshot:
>>
>> lvcreate -L20G -s -n data_snap /dev/vg0/NewCustomerLV /dev/hdb7
>>
>
> Yes
>
>> Is that correct? No Leakage? And no zeroing needed?
> Indeed
>
>>
>> Side note: Since I didn't partition my servers with this in mind, my 
>> new PV will probably have to be an iSCSI device located on a remote 
>> target :( Either that or use a loopback device with an image, but I'd 
>> be scared that the system would not boot properly. Can you give me 
>> any tips on how to use an image file as a PV just for snapshots?
>
> Ok, there has been alot of dangerous talk here, i assume you are using 
> an md device so you can mirror things. 
Correct
> If you added a single disk to that, and that disk failed you would 
> have a major problem. Likewise if you rebooted with open snaps and 
> iscsi you would need that iscsi device available during computer boot. 
> I REALLY hope you do not have your local FS on the same vg as your 
> data. As this would result in a non booting machine.
Nope. My root partition is not on LVM at all, but just on a regular md 
partition. The LVM LVs are used for virtual machine hosting for 
customers. Also, I used just /dev/hdb7 as an example, but it does bring 
up some interesting questions:

If the PV used for snapshots were to fail while the snapshot was open, 
or the server rebooted and the PV wasn't available at boot, what would 
happen? I ask these questions because a loopback device or iSCSI is 
really my only feasible option right now for the snapshot PV...
