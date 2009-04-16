Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GEod73022145
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 10:50:39 -0400
Received: from pluto.sivell.com (z-t3.aifi.com [65.112.245.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GEnwbv001642
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 10:49:58 -0400
Received: from ef.sivell.com (ef [192.168.249.210]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n3GEqXHs019512
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 09:52:34 -0500
Message-ID: <49E7456E.5090000@sivell.com>
Date: Thu, 16 Apr 2009 09:49:18 -0500
From: vu pham <vu@sivell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
References: <29070.706.qm@web94806.mail.in2.yahoo.com><49E71F9D.3010401@sivell.com>
	<49E72412.1070407@wpkg.org>
In-Reply-To: <49E72412.1070407@wpkg.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tomasz Chmielewski wrote:
> vu pham schrieb:
> 
>>> as per the redhat guide this should result in mirror leg failure and 
>>> any subsequent write activity to the mirror should convert the mirror 
>>> into linear volume. but the output of lvs command still shows copy % 
>>> as 100%. also data in filesystem of lv1 is erased and it is converted 
>>> into read only filesystem.
>>>
>>> can anyone please let us know the correct way to simulate lvm mirror 
>>> failure and recovery.
>>>
>>> thanks and regards
>>
>> I think to simulate error failure you have to write to the underlying 
>> devices, not the mirrored device. When you write to the mirrored 
>> device, lvl1 in this case, data is mirrored so there is no failure at 
>> all. So I think you have to dd to either /dev/sda3 or /dev/sdb3.
> 
> How will LVM distinguish between a valid and invalid copy in that case?
> 
> Are you sure that on reads, LVM will return data from the "good" copy, 
> not the one you just overwrote with "dd if=/dev/zero of=/dev/sdb 
> seek=xxx bs=1M count=10"?

Good question. I thought that dd will destroy the lvm information at the 
beginning of the partition which makes the leg broken. I made the 
following test and the result is odd:

- created mirrored logical volumn mrlv1 on /dev/sdc1 and /dev/sdd1, 
having /dev/sdd2 as log device
- mkfs.ext3 /dev/vg1/mrlv1, mount it and copy files onto it.
- dd if=/dev/zero of=/dev/sdd1
- read / write onto the mounted mirror lvm.

The output of lvs  shows:
- lvm information on /dev/sdd2 is destroyed
- the 2nd mirror, which is /dev/sdd2, is *unknown device*
- the mirror is still ok

And no lvm log in /var/log/messages.

[root@xen3 ~]# lvs -a -o +devices
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   Couldn't find device with uuid 'ZUOCeZ-Ssb2-0fP6-n5YY-sz5n-TtXe-b7eL3a'.
   LV               VG   Attr   LSize   Origin Snap%  Move Log
[... deleted unrelated devices ...]

   mrlv1            vg1  mwi-ao 200.00M                    mrlv1_mlog 
100.00         mrlv1_mimage_0(0),mrlv1_mimage_1(0)
   [mrlv1_mimage_0] vg1  iwi-ao 200.00M 
              /dev/sdc1(0)
   [mrlv1_mimage_1] vg1  iwi-ao 200.00M 
              unknown device(0)
   [mrlv1_mlog]     vg1  lwi-ao   4.00M 
              /dev/sdd2(0)



Vu
