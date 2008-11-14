Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEFmSpN000690
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:48:28 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEFmHL9011701
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:48:17 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id mAEFmGnu008882
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:48:17 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.13.8/8.13.8) with ESMTP id mAEFmGde020881
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:48:16 -0500
Date: Fri, 14 Nov 2008 10:48:16 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: RE: [linux-lvm] Moving Xen LV to image and mounting the image.
In-Reply-To: <61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
Message-ID: <Pine.LNX.4.64.0811141047080.20799@bmsred.bmsi.com>
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
	<87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
	<61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 14 Nov 2008, Chris Edwards wrote:

> mount -o loop wdcdns1.img /mnt/tmp/
> 
> mount: you must specify the filesystem type
> ---
> mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/wdcdns1.img /mnt/tmp/
> 
> mount: unknown filesystem type 'xfs'

If the filesystem is indeed xfs, then you are missing the xfs module
in your kernel.  On Centos, it is in extras and must be installed
separately.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
