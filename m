Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F09A72656F
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 07:53:18 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5CBB3092640
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 07:53:17 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x257igAF054538
	for <linux-lvm@redhat.com>; Tue, 5 Mar 2019 02:53:17 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2r1kyraw70-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 05 Mar 2019 02:53:16 -0500
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Tue, 5 Mar 2019 07:53:14 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<1576db4f-1d7c-6894-d9b0-69c51852b11c@linux.ibm.com>
	<325bbb01-1b67-eafb-025e-4bfde1b16b54@gmail.com>
	<alpine.LRH.2.21.1903041908110.14821@fairfax.gathman.org>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Tue, 5 Mar 2019 08:53:12 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1903041908110.14821@fairfax.gathman.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <328b148e-61ff-1099-5362-3e799407580c@linux.ibm.com>
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
To: "Stuart D. Gathman" <stuart@gathman.org>, LVM general discussion and development <linux-lvm@redhat.com>

On 05.03.2019 01:12, Stuart D. Gathman wrote:
> On Mon, 4 Mar 2019, Cesare Leonardi wrote:
> 
>> Today I repeated all the tests and indeed in one case the mount failed: after pvmoving from the 512/4096 disk to the 4096/4096 disk, with the LV ext4 using 1024 block size.
>  ...
>> The error happened where you guys expected. And also for me fsck showed no errors.
>>
>> But doesn't look like a filesystem corruption: if you pvmove back the data, it will become readable again:
>  ...
> 
> THAT is a crucial observation.  It's not an LVM bug, but the filesystem
> trying to read 1024 bytes on a 4096 device.  
Yes that's probably the reason. Nevertheless, its not really the FS's fault, since it was moved by LVM to a 4069 device.
The FS does not know anything about the move, so it reads in the block size it was created with (1024 in this case).

I still think LVM should prevent one from mixing devices with different physical block sizes, or at least warn when pvmoving or lvextending onto a PV with a larger block size, since this can cause trouble.

> I suspect it could also
> happen with an unaligned filesystem on a 4096 device.
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
