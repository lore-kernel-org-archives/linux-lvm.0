Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p35KfOSX012992
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 16:41:25 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p35KfKm3012703
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 16:41:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p35KfIXt000816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 16:41:18 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p35KfHT4019397
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 16:41:17 -0400
Date: Tue, 5 Apr 2011 16:41:17 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D9B7715.7090509@abpni.co.uk>
Message-ID: <alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk> <4D655459.6050806@gmail.com>
	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
	<4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
	<4D6572C0.6070008@abpni.co.uk>
	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
	<4D65A1A9.1040205@abpni.co.uk>
	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>
	<4D65A839.50107@abpni.co.uk> <4D65A8F5.8040606@abpni.co.uk>
	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>
	<4D6609E4.10800@abpni.co.uk>
	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>
	<4D6671D7.7020301@abpni.co.uk>
	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>
	<4D667743.3010102@abpni.co.uk> <4D9B7715.7090509@abpni.co.uk>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 5 Apr 2011, Jonathan Tripathy wrote:

>> Hopefully an expert will let me know weather its safe to zero the COW after 
>> I?ve finished with the snapshot.
> Are any "experts" available to help me answer the above question? I feel that 
> this is a really important issue for those of us in the hosting industry.
>
> Just to sum up my question: when a customer leaves our service, we zero their 
> drive before removing the LV. This hopefully ensures that there is no data 
> "leakage" when we create a new LV for a new customer. However, we need to 
> take into consideration about what happens when we create snapshots of LVs to 
> perform backups (using rsync).
>
> Any help would be appreciated.

At this point, we'll just have to try it on a non-production server. 
Hopefully, worst case the kernel crashes.  I run Fedora (14 currently)
and CentOS-5.5.  My guess as an amateur is that zeroing the COW while
the origin is open is a problem.  I would suggest this for backup:

1) make snapshot
2) make backup
3) pause VM (check that this closes the origin LV, if not save the VM)
4) with both origin and snapshot not active, zero COW
5) remove snapshot
6) unpause VM (or restore if saved)

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
