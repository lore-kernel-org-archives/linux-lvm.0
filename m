Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r03JFHrG011151
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 14:15:17 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r03JFGZD004791
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 14:15:17 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r03JFGM1001110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 14:15:16 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id r03JDKk5028532
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 14:13:20 -0500
Date: Thu, 3 Jan 2013 14:13:20 -0500 (EST)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <20130103180254.GC19165@agk-dp.fab.redhat.com>
Message-ID: <alpine.LRH.2.02.1301031410370.28451@bmsred.bmsi.com>
References: <50DB10B4.1000505@gmail.com>
	<20130103180254.GC19165@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] label sector and non 512 byte sectors
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

On Jan 3, Alasdair G Kergon transmitted in part:

> On Wed, Dec 26, 2012 at 09:59:00AM -0500, Phillip Susi wrote:
>> The man page for pvcreate states that the label goes in the second
>> sector.  That means it SHOULD be at an offset of 4096 bytes when using
>> 4096 byte sectors, but apparently it is still at an offset of 512 bytes.
>>  Bug?
>
> We define a sector at 512 bytes. Always.
>
> Some documentation could be improved to make that clearer.

And current storage devices always define a logical sector as 512 bytes,
and the firmware takes care of the R/M/W (with caching) needed for
partial or unaligned writes.

The physical sector size is important when *aligning* LVM segments, filesystem
blocks, RAID clusters, etc.
