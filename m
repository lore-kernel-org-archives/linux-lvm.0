Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE86B61364
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 17:05:13 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1A9AC0AC371
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 17:05:12 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1RGucKp008061
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 12:05:12 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qwxdg0rxh-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 12:05:12 -0500
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Wed, 27 Feb 2019 17:05:10 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<alpine.LRH.2.21.1902270958001.13312@fairfax.gathman.org>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Wed, 27 Feb 2019 18:05:06 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1902270958001.13312@fairfax.gathman.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <1a22cfdb-e7a7-ad1f-5da7-fefdfd26f62a@linux.ibm.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, "Stuart D. Gathman" <stuart@gathman.org>
Cc: Cesare Leonardi <celeonar@gmail.com>

On 27.02.2019 15:59, Stuart D. Gathman wrote:
> On Wed, 27 Feb 2019, Ingo Franzki wrote:
> 
>> The good thing about the example with encrypted volumes on loopback
>> devices is that you can reproduce the problem on any platform, without
>> having certain hardware requirements.
> 
> The losetup command has a --sector-size option that sets the logical
> sector size.  I wonder if that is sufficient to reproduce the problem.
> 
Yes that should work: 

# losetup -fP loopbackfile.img --sector-size 4096
# blockdev --getpbsz /dev/loop0
4096


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
