Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D4DC5DD74
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 10:10:34 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 915E4562B8
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 10:10:32 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1SA5dKP068757
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 05:10:32 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qxce8bgp4-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 05:10:31 -0500
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Thu, 28 Feb 2019 10:10:30 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<b54c26c3-ce43-674e-d620-28fc2f369956@izyk.ru>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Thu, 28 Feb 2019 11:10:27 +0100
MIME-Version: 1.0
In-Reply-To: <b54c26c3-ce43-674e-d620-28fc2f369956@izyk.ru>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <3f94a1df-d333-70fe-56ab-3661b384e028@linux.ibm.com>
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Content-Type: text/plain; charset="utf-8"
To: Ilia Zykov <mail@izyk.ru>, LVM general discussion and development <linux-lvm@redhat.com>

On 28.02.2019 10:48, Ilia Zykov wrote:
>>
>> Well, there are the following 2 commands:
>>
>> Get physical block size: 
>>  blockdev --getpbsz <device>
>> Get logical block size:
>>  blockdev --getbsz <device>
>>
>> Filesystems seem to care about the physical block size only, not the logical block size.
>>
>> So as soon as you have PVs with different physical block sizes (as reported by blockdev --getpbsz) I would be very careful...
> 
> Hello everybody.
> Maybe, I don’t understand what do you mean. What the logical block size
> mean? But on my machines(CentOS7), this utility get me the strange
> results (output reduced):
> 
>  smartctl -i /dev/sda; blockdev --getbsz --getpbsz /dev/sda
> Device Model:     INTEL SSDSC2KB480G8
> User Capacity:    480,103,981,056 bytes [480 GB]
> Sector Sizes:     512 bytes logical, 4096 bytes physical
> Rotation Rate:    Solid State Device
> 4096
> 4096
> 
>  smartctl -i /dev/sdb; blockdev --getbsz --getpbsz /dev/sdb
> Device Model:     HGST HUS722T2TALA604
> User Capacity:    2,000,398,934,016 bytes [2.00 TB]
> Sector Size:      512 bytes logical/physical
> Rotation Rate:    7200 rpm
> Form Factor:      3.5 inches
> 4096
> 512
> 
> As you see “–getbsz” forever 4096.
I also see logical block size to be 4096 for all devices on my system.
> But I think it must be forever 512.
> What does it mean?
I have seen the following description about logical and physical block sizes somewhere in the internet:
"Logical block sizes are the units used by the 'kernel' for read/write operations.
Physical block sizes are the units which 'disk controllers' use for read/write operations."

For the problem mentioned in this thread, the physical block size is what you are looking for.
> 
> Thank you.
> Ilia.
> 


-- 
Ingo Franzki
eMail: ifranzki@linux.ibm.com  
Tel: ++49 (0)7031-16-4648
Fax: ++49 (0)7031-16-3456
Linux on IBM Z Development, Schoenaicher Str. 220, 71032 Boeblingen, Germany

IBM Deutschland Research & Development GmbH / Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM DATA Privacy Statement: https://www.ibm.com/privacy/us/en/
