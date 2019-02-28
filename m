Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68C3357980
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 08:41:39 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF63630C23CA
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 08:41:37 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1S8cuvp091500
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 03:41:37 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qx8w0gnvs-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 03:41:37 -0500
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Thu, 28 Feb 2019 08:41:35 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Thu, 28 Feb 2019 09:41:32 +0100
MIME-Version: 1.0
In-Reply-To: <be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Cesare Leonardi <celeonar@gmail.com>

On 28.02.2019 02:31, Cesare Leonardi wrote:
> On 27/02/19 09:49, Ingo Franzki wrote:
>> As far as I can tell: Yes if you pvmove data around or lvextend an LV onto another PV with a larger physical block size that is dangerous.
>> Creating new LVs and thus new file systems on mixed configurations seem to be OK.
> 
> [...]
> 
>> And yes, its unrelated to encrypted volumes, it can happen with any block device of different physical block sizes that you use as PV.
> 
> Thank you Ingo for the precious informations you are giving here.
> 
> Not to be pedantic, but what do you mean with physical block? Because with modern disks the term is not always clear. Let's take a mechanical disk with 512e sectors, that is with 4k sectors but exposed as 512 byte sectors. Fdisk will refer to it with these terms:
> Sector size (logical/physical): 512 bytes / 4096 bytes
> 
> What you are referring as physical size is actually the logical size reported by fdisk, right? And if it's correct, I guess that should be safe to add the above disk with 512e sectors to an LVM storage composed only by disks with real 512 byte sectors. I expect that from the LVM point of view this should not be even considered a mixed sector size setup, even if the real physical sector size of the added disk is 4096 byte.
> 
> Do you agree or do you think it would be better to test this specific setup?

Well, there are the following 2 commands:

Get physical block size: 
 blockdev --getpbsz <device>
Get logical block size:
 blockdev --getbsz <device>

Filesystems seem to care about the physical block size only, not the logical block size.

So as soon as you have PVs with different physical block sizes (as reported by blockdev --getpbsz) I would be very careful...
> 
> Cesare.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
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
