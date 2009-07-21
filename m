Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LK2L09002407
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:02:21 -0400
Received: from mail-px0-f174.google.com (mail-px0-f174.google.com
	[209.85.216.174])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LK1xOB004924
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:01:59 -0400
Received: by pxi4 with SMTP id 4so2196220pxi.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:01:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090721195830.GA30206@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com> 
	<20090721195830.GA30206@esri.com>
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 14:01:39 -0600
Message-ID: <2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

imgserv:/storage/# vgchange -ay
  device-mapper: resume ioctl failed: Invalid argument
  Unable to resume storage-storage (254:0)
  1 logical volume(s) in volume group "storage" now active
imgserv:/storage/# pvs
  PV         VG      Fmt  Attr PSize PFree
  /dev/sda3  storage lvm2 a-   1.44T    0
  /dev/sdb1  storage lvm2 a-   1.09T    0
  /dev/sdc1  storage lvm2 a-   1.09T 4.98G

imgserv:/storage/# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               storage
  PV Size               1.44 TB / not usable 1.51 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              378339
  Free PE               0
  Allocated PE          378339
  PV UUID               ddnHh1-BvAl-5zpd-8KFT-YnZ8-MWHp-pQAWs1

  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               storage
  PV Size               1.09 TB / not usable 3.73 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              285949
  Free PE               0
  Allocated PE          285949
  PV UUID               Qhl3tF-JWTY-ORbb-liI9-XteR-vlY9-wtInW5

  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               storage
  PV Size               1.09 TB / not usable 3.73 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              285949
  Free PE               1275
  Allocated PE          284674
  PV UUID               Z6h80h-oZfP-QMPW-iZdt-dGL0-haBJ-r93Ooi

On Tue, Jul 21, 2009 at 1:58 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> On Tue, Jul 21, 2009 at 12:55:50PM -0700, Adam Olsen wrote:
>> This pretty much sums it up:
>>
>> imgserv:/storage/# lvscan
>> � ACTIVE � � � � � �'/dev/storage/storage' [3.62 TB] inherit
>> imgserv:/storage/# fdisk /dev/storage/storage
>>
>> Unable to read /dev/storage/storage
>>
>> I can't mount it, access it with fdisk. �Here's the lvdisplay output:
>>
>> imgserv:/storage/# lvdisplay
>> � --- Logical volume ---
>> � LV Name � � � � � � � �/dev/storage/storage
>> � VG Name � � � � � � � �storage
>> � LV UUID � � � � � � � �Cw8aAr-YHsR-oVfH-7AAx-2ppa-Zm3M-U9z1eA
>> � LV Write Access � � � �read/write
>> � LV Status � � � � � � �available
>> � # open � � � � � � � � 0
>> � LV Size � � � � � � � �3.62 TB
>> � Current LE � � � � � � 948962
>> � Segments � � � � � � � 3
>> � Allocation � � � � � � inherit
>> � Read ahead sectors � � auto
>> � - currently set to � � 256
>> � Block device � � � � � 254:0
>>
>> This is on debian etch. � This is what I see at the end of dmesg:
>>
>> cdrom: open failed.
>> hdc: packet command error: status=0x51 { DriveReady SeekComplete Error }
>> hdc: packet command error: error=0x54
>>
>> Which I don't think has anything to do with this problem, as hdc is
>> NOT one of the physical volumes... it's a cdrom drive.
>>
>> Is there anything I can do to debug this?
>>
>
> You've already done a vgchange -ay on the volgroup? �What's the output
> of pvs/pvdisplay?
>
> Ray
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic
