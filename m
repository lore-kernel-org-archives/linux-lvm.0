Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B4117F8E
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 16:30:44 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 763753155400
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 16:30:43 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1SGS4fk039678
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 11:30:43 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2qxj0dmk0x-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 11:30:42 -0500
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Thu, 28 Feb 2019 16:30:40 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<5cc14cbf-57e3-50b4-1332-07b688536be5@izyk.ru>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Thu, 28 Feb 2019 17:30:36 +0100
MIME-Version: 1.0
In-Reply-To: <5cc14cbf-57e3-50b4-1332-07b688536be5@izyk.ru>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <716d9c9a-bd27-2ef9-0e32-4a308e055886@linux.ibm.com>
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

On 28.02.2019 15:36, Ilia Zykov wrote:
>> Discarding device blocks: done
>> Creating filesystem with 307200 1k blocks and 76912 inodes
>> ......
>> # pvs
>>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 0: Invalid argument
>>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 314507264: Invalid argument
>>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 314564608: Invalid argument
>>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 4096: Invalid argument
>>   PV                   VG      Fmt  Attr PSize   PFree
>>   /dev/loop0           LOOP_VG lvm2 a--  496.00m 496.00m
>>   /dev/mapper/enc-loop LOOP_VG lvm2 a--  492.00m 192.00m
>>
>> In case the filesystem of the logical volume is not mounted at the time of pvmove, it gets corrupted anyway, but you only see errors when trying to mount it.
>>
> 
> It's because you FS had 1k blocks.
> New device can't read with block 1k.
> If you plan pvmove on device with 4k. Maybe you need make fs with:
> "mkfs.ext4 -b 40
The beauty of pvmove is that it works on existing LVs with filesystems on it.
So I might have filesystems on LVs that used the default block size that I want to move via pvmove.
At the time the file system was created (possibly may years ago), I did not know that I would ever move it to a device with a larger block size.
If I have to create a new filesystem after the move, then pvmove is useless.... I then could just create a new LV on the desired PV(s). 
> 
> See comments:
> https://bugzilla.redhat.com/show_bug.cgi?id=1684078
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
