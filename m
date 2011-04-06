Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p360GRnA032054
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:16:27 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p360GN1o006134
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:16:24 -0400
Received: from anubis.ankh.org ([172.22.128.3])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7GQ3-0006XL-7T
	for linux-lvm@redhat.com; Wed, 06 Apr 2011 01:16:23 +0100
Message-ID: <4D9BB0D4.8050401@ankh.org>
Date: Wed, 06 Apr 2011 00:16:20 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>
	<4D9BA845.10607@an! kh.org> <4D9BAD26.5010405@abpni.co.uk>
In-Reply-To: <4D9BAD26.5010405@abpni.co.uk>
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

On 06/04/2011 00:00, Jonathan Tripathy wrote:
> Ok now things are really getting interesting!
>
> Actually, when I create new customer LVs, I always specify which 
> volume group I want to add it to. E.g:
>
> lvcreate -nNewCustomerLV -L20G vg0

Sadly that is just normal... However a volume group could be made up of 
more than one disk, you can with an option specify which of the disks 
(pv) to use. Rather than the system select for you.

> where vg0 is /dev/vg0
> and vg0 is a volume group which uses an entire physical partition 
> (Which I guess is called a PV).

That is a vg (volume group) not a pv (physical volume).

vgdisplay -v
pvs
pvdisplay --map

and you should get the idea.

>
> Now, if I were to create my snapshots on a seperate vg, eg:
>
> lvcreate -L 20G -s -n data_snap /dev/vg0/NewCustomerLV /dev/vg1
>
> does that mean I never need to use pvchange to "switch off" vg1? And I 
> never need to zero or create a "hog"? And no leakage will ever occur?

No you are confused pvs are created on disk partitions, one or more pvs 
then make you vg.

LVs are created on top of VGs, VGs are created on top of PVs, PVs are 
created on partitions on block devices or whole block devices.

(Ok we shall stop here however blocks devices could be loop back, meta 
devices like raid 0/1/5 etc hardware/software or real disks however that 
is not LVM any more.)

>
>> Do I get cake now? 
> Only if it's not a lie.... :)

I saw the cake but I got none (Portal)

James
