Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8140F5DA9A
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 08:49:43 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27893C060209
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 08:49:42 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1R8jC4s120651
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 03:49:41 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qwpw4hej3-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 03:49:41 -0500
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Wed, 27 Feb 2019 08:49:39 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Wed, 27 Feb 2019 09:49:35 +0100
MIME-Version: 1.0
In-Reply-To: <2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
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
To: Cesare Leonardi <celeonar@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 27.02.2019 01:00, Cesare Leonardi wrote:
> On 25/02/19 16:33, Ingo Franzki wrote:
>> we just encountered an error when using LVM's pvmove command to move the data from an un-encrypted LVM physical volume onto an encrypted volume.
>> After the pvmove has completed, the file system on the logical volume that resides on the moved physical volumes is corrupted and all data on this LV is lost.
> 
> Hello, your message is interesting. And also this thread:
> https://www.redhat.com/archives/linux-lvm/2019-February/msg00002.html
> 
> But I'd like to know if I understood correctly.
> Should I care about the physical disk size when I use LVM? Mixing disk with different sector size (512b and 4k) is dangerous?

As far as I can tell: Yes if you pvmove data around or lvextend an LV onto another PV with a larger physical block size that is dangerous.
Creating new LVs and thus new file systems on mixed configurations seem to be OK. 

> 
> Your message and others from the other thread, seems to say that LVM doesn't handle correctly that situation and that if I pvmove data between a 512b disk and a 4k disk (or viceversa), it will lead to a massive filesystem corruption. If I understood correctly, the problem that you described looks unrelated to encrypted volume and was only exacerbated by that. Right?

Moving from 512 to 4096 seems to cause FS corruption, moving from 4096 to 512 does not. So I guess its only a problem when moving to larger physical block sizes.

And yes, its unrelated to encrypted volumes, it can happen with any block device of different physical block sizes that you use as PV.
E.g. SCSI disks exist in 512 bytes block size and 4096 bytes block size. Or s390-DASDs which always have 4096 bytes blocks. 

We just encountered it using encrypted disks with the sector-size option to increase encryption performance. 
So actually we want people to use larger sector sizes, but this seems to cause problems with LVM. 

The good thing about the example with encrypted volumes on loopback devices is that you can reproduce the problem on any platform, without having certain hardware requirements.

> 
> Cesare.
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
