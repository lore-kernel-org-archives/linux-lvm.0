Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p35NdvpS001688
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 19:39:57 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p35Ndrae031202
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 19:39:53 -0400
Received: from anubis.ankh.org ([172.22.128.3])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7Fqi-0006Tf-7R
	for linux-lvm@redhat.com; Wed, 06 Apr 2011 00:39:52 +0100
Message-ID: <4D9BA845.10607@ankh.org>
Date: Tue, 05 Apr 2011 23:39:49 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>
	<4D9BA196.20006@ankh.org> <4D9BA39A.8020008@abpni.co.uk>
In-Reply-To: <4D9BA39A.8020008@abpni.co.uk>
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

On 05/04/2011 23:19, Jonathan Tripathy wrote:
> Excellent point! As long as I use the same PEs for making the snapshot 
> everytime, I don't need to ever erase it (And it can be a nice big 
> size like 50GB, so even my largest customers won't outgrow the 
> snapshot). However though, wouldn't I need to keep the "hog" around 
> just to make sure that the snapshot PEs don't get assigned to a new 
> customer LV in the future (Currently, we don't specify PEs to use when 
> creating normal LVs)?
>

I think you missed the point of why I suggested using a separate PV, the 
space could be divided using fdisk it does not have to separate physical 
disk (This is ok as you will never use this space for mirroring). If 
snapshots are created on a separate PV you can use pvchange - x n and 
pvchange -x y to change if it is allocatable and only when you are 
creating snaps do you make in allocatable that will prevent accidental 
reuse in customer lvs without lots of hassle.  If you don't use pvchange 
you will need to specify the PVs when ever you create a customer LV.

# an lvcreate with specifing the PEs to use.
lvcreate -l 20 -s -n data_snap /dev/test_vg/data_lv /dev/cciss/c0d1p2


Also this allows you to use 50 GB area or 4 x 10 GB ones, depending on 
what you are backing up without having to worry about creating a hog 
over the top of anything you haven't used. This allows you more 
flexibility with simultaneous backups.

> An even better question: Does the snapshot have to be on the same 
> physical disk as the LV its mirroring?
>
No it does not.

Do I get cake now?

James
