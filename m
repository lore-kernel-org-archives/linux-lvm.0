Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 803841001938
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 10:10:40 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 306F910F2E90
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 10:10:37 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x8BA3YpG069969
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 06:10:36 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2uxvapdbtk-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 06:10:36 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Wed, 11 Sep 2019 11:10:34 +0100
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<116a2ce6-452e-5c7b-3bb6-e53461125824@izyk.ru>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Wed, 11 Sep 2019 12:10:30 +0200
MIME-Version: 1.0
In-Reply-To: <116a2ce6-452e-5c7b-3bb6-e53461125824@izyk.ru>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <c2aa1b3a-ee9b-5f80-b2a4-85c9409b85c9@linux.ibm.com>
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <mail@izyk.ru>, Gang He <GHe@suse.com>

On 11.09.2019 12:03, Ilia Zykov wrote:
> Maybe this?
> 
> Please note that this problem can also happen in other cases, such as
> mixing disks with different block sizes (e.g. SCSI disks with 512 bytes
> and s390x-DASDs with 4096 block size).
> 
> https://www.redhat.com/archives/linux-lvm/2019-February/msg00018.html

And the fix for this is already available upstream (Thanks David!):
https://sourceware.org/git/?p=lvm2.git;a=commit;h=0404539edb25e4a9d3456bb3e6b402aa2767af6b
> 
> 
> On 11.09.2019 12:17, Gang He wrote:
>> Hello List,
>>
>> Our user encountered a meta-data corruption problem, when run pvresize command after upgrading to LVM2 v2.02.180 from v2.02.120.
>>
>> The details are as below,
>> we have following environment:
>> - Storage: HP XP7 (SAN) - LUN's are presented to ESX via RDM
>> - VMWare ESXi 6.5
>> - SLES 12 SP 4 Guest
>>
>> Resize happened this way (is our standard way since years) - however - this is our first resize after upgrading SLES 12 SP3 to SLES 12 SP4 - until this upgrade, we
>> never had a problem like this:
>> - split continous access on storage box, resize lun on XP7
>> - recreate ca on XP7
>> - scan on ESX
>> - rescan-scsi-bus.sh -s on SLES VM
>> - pvresize  ( at this step the error happened)
>>
>> huns1vdb01:~ # pvresize /dev/disk/by-id/scsi-360060e80072a660000302a6600003274
>>  Error writing device /dev/sdaf at 4096 length 512.
>>  Failed to write mda header to /dev/sdaf fd -1
>>  Failed to update old PV extension headers in VG vghundbhulv_ar.
>>  Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000031ec at 4096 length 512.
>>  Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000302a66000031ec fd -1
>>  Failed to update old PV extension headers in VG vghundbhulk_ar.
>>  VG info not found after rescan of vghundbhulv_r2
>>  VG info not found after rescan of vghundbhula_r1
>>  VG info not found after rescan of vghundbhuco_ar
>>  Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000031e8 at 4096 length 512.
>>  Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000302a66000031e8 fd -1
>>  Failed to update old PV extension headers in VG vghundbhula_ar.
>>  VG info not found after rescan of vghundbhuco_r2
>>  Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a660000300b at 4096 length 512.
>>  Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000302a660000300b fd -1
>>  Failed to update old PV extension headers in VG vghundbhunrm02_r2.
>>
>> Any idea for this bug?
>>
>> Thanks a lot.
>> Gang
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
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
