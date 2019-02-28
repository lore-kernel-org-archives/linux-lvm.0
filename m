Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B619A68D5D
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 01:31:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 333AD30BF4DF
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 01:31:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a188so370228wmf.3
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 17:31:51 -0800 (PST)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
Date: Thu, 28 Feb 2019 02:31:40 +0100
MIME-Version: 1.0
In-Reply-To: <443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Franzki <ifranzki@linux.ibm.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 27/02/19 09:49, Ingo Franzki wrote:
> As far as I can tell: Yes if you pvmove data around or lvextend an LV onto another PV with a larger physical block size that is dangerous.
> Creating new LVs and thus new file systems on mixed configurations seem to be OK.

[...]

> And yes, its unrelated to encrypted volumes, it can happen with any block device of different physical block sizes that you use as PV.

Thank you Ingo for the precious informations you are giving here.

Not to be pedantic, but what do you mean with physical block? Because 
with modern disks the term is not always clear. Let's take a mechanical 
disk with 512e sectors, that is with 4k sectors but exposed as 512 byte 
sectors. Fdisk will refer to it with these terms:
Sector size (logical/physical): 512 bytes / 4096 bytes

What you are referring as physical size is actually the logical size 
reported by fdisk, right? And if it's correct, I guess that should be 
safe to add the above disk with 512e sectors to an LVM storage composed 
only by disks with real 512 byte sectors. I expect that from the LVM 
point of view this should not be even considered a mixed sector size 
setup, even if the real physical sector size of the added disk is 4096 byte.

Do you agree or do you think it would be better to test this specific setup?

Cesare.
