Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8EHPpat028530
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 13:25:52 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8EHPphY014553
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 13:25:51 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8EHPVin027866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 13:25:31 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8EHPUfO002643
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 13:25:30 -0400
Date: Wed, 14 Sep 2011 13:25:30 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E70566A.1040501@unfoo.net>
Message-ID: <alpine.LRH.2.00.1109141323550.1652@bmsred.bmsi.com>
References: <4E6E6BDE.1040301@unfoo.net>
	<alpine.LRH.2.00.1109121706310.19095@bmsred.bmsi.com>
	<4E6E8476.6030609@unfoo.net> <4E70566A.1040501@unfoo.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] harddisk dies while pvmove is in progress
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

On Wed, 14 Sep 2011, Robert Sch?ftner wrote:

> Am 2011-09-13 00:15, schrieb Robert Sch?ftner:
>> my plan is to edit the latest archived meta-data, remove the
>> pvmove-mirror, exchange the segment pointing to the missing device
>> with the mirrored segment, and vcfgrestore it, if no better idea comes
>> up. the saved metadata confirms that the segment belonging to LV
>> "shares" was completely mirrored before the harddisk died, so all the
>> needed data is there.
> For the record: finally, I edited the last metadata-backup, put the
> successfully mirrored segment on the raid into the LV (instead of the
> pvmovesomething mirror), removed references to pvmove, the damaged PV
> and the "homevideo" LV, vgcfgrestored the config, rebooted, and
> everything works.

That implies that there could be a pvmove "cleanup" utility that cleans
up a pvmove in progress that references a missing PV.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
