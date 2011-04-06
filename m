Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p360SEAc003932
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:28:14 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p360S9HW008757
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:28:10 -0400
Message-ID: <4D9BB398.5070007@abpni.co.uk>
Date: Wed, 06 Apr 2011 01:28:08 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!
	kh.org> <4D9BAD26.5010405@abpni.co.uk> <4D9BB0D4.8050401@ankh.org>
In-Reply-To: <4D9BB0D4.8050401@ankh.org>
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


> No you are confused pvs are created on disk partitions, one or more 
> pvs then make you vg.
>
> LVs are created on top of VGs, VGs are created on top of PVs, PVs are 
> created on partitions on block devices or whole block devices.
>
> (Ok we shall stop here however blocks devices could be loop back, meta 
> devices like raid 0/1/5 etc hardware/software or real disks however 
> that is not LVM any more.)

Ok, i think I get it now. At the minute, my vg (vg0) only has on PV in 
it (/dev/md3 which you can tell is a mdadm RAID device). I wasn't aware 
you could add more PVs (that's pretty cool!). So, let's say I had a 
spare partition (/dev/hdb7 as an example). To my vg0 volume group, I 
would firstly:

pvcreate /dev/hdb7
vgextend /dev/hdb7

Then, every time I create a new customer LV, I would do:

lvcreate -nNewCustomerLV -L20G vg0 /dev/md3

Then, every time I wanted to create a snapshot:

lvcreate -L20G -s -n data_snap /dev/vg0/NewCustomerLV /dev/hdb7

Is that correct? No Leakage? And no zeroing needed?

Side note: Since I didn't partition my servers with this in mind, my new 
PV will probably have to be an iSCSI device located on a remote target 
:( Either that or use a loopback device with an image, but I'd be scared 
that the system would not boot properly. Can you give me any tips on how 
to use an image file as a PV just for snapshots?

Thanks
