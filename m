Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A572E5BBA5
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 08:05:41 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2484307B96B
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 08:05:39 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x2184n8x093046
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2019 03:05:39 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qy0b1hh8n-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 01 Mar 2019 03:05:38 -0500
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Fri, 1 Mar 2019 08:05:37 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Fri, 1 Mar 2019 09:05:34 +0100
MIME-Version: 1.0
In-Reply-To: <d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
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

On 01.03.2019 02:24, Cesare Leonardi wrote:
> On 28/02/19 09:41, Ingo Franzki wrote:
>> Well, there are the following 2 commands:
>>
>> Get physical block size:
>>   blockdev --getpbsz <device>
>> Get logical block size:
>>   blockdev --getbsz <device>
> 
> I didn't know the blockdev command and, to recap, we have:
> --getpbsz: physical sector size
> --getss: logical sector size
> --getbsz: blocksize used internally by the kernel
> 
> getpbsz/getss correspond to physical/logical sector size reported by fdisk, smartctl, etc.
> 
>> Filesystems seem to care about the physical block size only, not the logical block size.
>>
>> So as soon as you have PVs with different physical block sizes (as reported by blockdev --getpbsz) I would be very careful...
> 
> I've done the test suggested by Stuart and it seems to contradict this.
> I have pvmoved data from a 512/512 (logical/physical) disk to a newly added 512/4096 disk but I had no data corruption. Unfortunately I haven't any native 4k disk to repeat the same test.

Hmm, maybe the size of the volume plays a role as Bernd has pointed out. ext4 may use -b 4K by default on larger devices. 
Once the FS uses 4K block anyway you wont see the problem.

Use  tune2fs -l <device> after you created the file system and check if it is using 4K blocks on your 512/512 device. If so, then you won't see the problem when moved to a 4K block size device.

> 
> Here is what I've done.
> /dev/sdb: SSD with 512/512 sector size
> /dev/sdc: mechanical disk with 512/4096 sector size
> 
> # blockdev -v --getss --getpbsz --getbsz /dev/sdb
> get logical block (sector) size: 512
> get physical block (sector) size: 512
> get blocksize: 4096
> 
> # blockdev -v --getss --getpbsz --getbsz /dev/sdc
> get logical block (sector) size: 512
> get physical block (sector) size: 4096
> get blocksize: 4096
> 
> # pvcreate /dev/sdb4
> # vgcreate vgtest /dev/sdb4
> # lvcreate -L 1G vgtest /dev/sdb4
> # mkfs.ext4 /dev/mapper/vgtest-lvol0
> # mkdir /media/test
> # mount /dev/mapper/vgtest-lvol0 /media/test
> # cp -a SOMEDATA /media/test/
> # umount /media/test
> # fsck.ext4 -f /dev/mapper/vgtest-lvol0
> 
> Filesystem created and no error on it. Now the disk with different physical size:
> 
> # pvcreate /dev/sdc1
> # vgextend vgtest /dev/sdc1
> # pvmove /dev/sdb4 /dev/sdc1
> # fsck.ext4 -f /dev/mapper/vgtest-lvol0
> # mount /dev/mapper/vgtest-lvol0 /media/test
> # ls /media/test/
> 
> The fsck command reports no errors, the filesystem is mountable and the data is there.
> 
> Looks like physical sector size didn't matter here. Or I'm missing something?
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
