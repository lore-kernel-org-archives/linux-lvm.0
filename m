Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p35NBQoQ027864
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 19:11:26 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p35NBLjX002152
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 19:11:21 -0400
Received: from anubis.ankh.org ([172.22.128.3])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7FP6-0006Qn-BY
	for linux-lvm@redhat.com; Wed, 06 Apr 2011 00:11:20 +0100
Message-ID: <4D9BA196.20006@ankh.org>
Date: Tue, 05 Apr 2011 23:11:18 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>
	<4D9B9D48.5010008@abpni.c! o.uk>
In-Reply-To: <4D9B9D48.5010008@abpni.co.uk>
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


> James,
>
> That's fantastic! Thanks very much! I have a couple of questions:
>
> 1) If I wanted to create a script that backed up lots of customer-data 
> LVs, could I just do one zero at the end (and still have no data 
> leakage)?

Yes you could, because COW means COPY ON WRITE, so the original block is 
copied onto the COW with the data from the original disk overwritting 
any data currently on it. Before that point any data on it was not 
addressable from the snapshot lv (* see my final point)
> 2) On average, each of my data LVs are 20GB each, and if I were to 
> create a snapshot of 20GB, this would take about 20 mins to erase. If 
> I made the snapshot only 1GB, that means it would be quick to erase at 
> the end (however only 1GB of data could be created on the respect 
> origin, correct?)

You are right you only have to erase the snapshot cow space, which is 
normally only 10-15% of the whole original disk. 2GB is pretty fast to 
over right on any system I have used these days. To be sure though you 
do need to overwrite the whole cow even if only a few percent was used 
as you cannot tell which few percent that was.

* I do wonder why you are so worried, leakage is only a problem if the 
COW is assigned to a future customer LV. If you always used the same 
space for backups perhaps had a PE just for backups it would never be 
used in a customer lv therefore you could argue that you never have to 
erase it. If its on a pe you only use for snapshotting you also don't 
need to hog the space as any bit of that disk is ok.

James
