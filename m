Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7FwM14031923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Nov 2016 10:58:22 -0500
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C1F661E50
	for <linux-lvm@redhat.com>; Mon,  7 Nov 2016 15:58:19 +0000 (UTC)
Message-ID: <5820A497.80501@strike.wu.ac.at>
Date: Mon, 07 Nov 2016 16:58:15 +0100
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
References: <582049AF.7010905@strike.wu.ac.at>
	<6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
In-Reply-To: <6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] very slow sequential writes on lvm raid1 (bitmap?)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 11/07/2016 11:22 AM, Zdenek Kabelac wrote:
> Dne 7.11.2016 v 10:30 Alexander 'Leo' Bergolth napsal(a):
>> I am experiencing a dramatic degradation of the sequential write speed
>> on a raid1 LV that resides on two USB-3 connected harddisks (UAS
>> enabled), compared to parallel access to both drives without raid or
>> compared to MD raid:
>>
>> - parallel sequential writes LVs on both disks: 140 MB/s per disk
>> - sequential write to MD raid1 without bitmap: 140 MB/s
>> - sequential write to MD raid1 with bitmap: 48 MB/s
>> - sequential write to LVM raid1: 17 MB/s !!
>>
>> According to the kernel messages, my 30 GB raid1-test-LV gets equipped
>> with a 61440 bit write-intent bitmap (1 bit per 512 byte data?!) whereas
>> a default MD raid1 bitmap only has 480 bit size. (1 bit per 64 MB).
>> Maybe the dramatic slowdown is caused by this much too fine grained
>> bitmap and its updates, which are random IO?
>>
>> Is there a way to configure the bitmap size?
> 
> Can you please provide some results with  '--regionsize'  changes ?
> While   '64MB' is quite 'huge'  for resync I guess 'the current' default
> picked region size is likely very very small in same cases.

Ah - thanks. Didn't know that --regionsize is also valid for --type raid1.

With --regionsize 64 MB, the bitmap has the same size as the default
bitmap created by mdadmin and write performance is also similar:

*** --regionsize 1M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 63,957 s, 16,4 MB/s
*** --regionsize 2M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 39,1517 s, 26,8 MB/s
*** --regionsize 4M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 32,8275 s, 31,9 MB/s
*** --regionsize 16M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 30,2903 s, 34,6 MB/s
*** --regionsize 32M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 30,1452 s, 34,8 MB/s
*** --regionsize 64M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 21,6208 s, 48,5 MB/s
*** --regionsize 128M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 14,2028 s, 73,8 MB/s
*** --regionsize 256M
1048576000 bytes (1,0 GB, 1000 MiB) copied, 11,6581 s, 89,9 MB/s


Is there a way to change the regionsize for an existing LV?

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
