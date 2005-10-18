Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9ILaQV11350
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 17:36:26 -0400
Received: from hetfield.patsoffice.com (092.106-113-64.ftth.swbr.surewest.net
	[64.113.106.92])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9ILaP7C020090
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 17:36:26 -0400
Received: from [192.168.0.11] (unknown [192.168.0.11])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by hetfield.patsoffice.com (Postfix) with ESMTP id A0D17CB37B
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 14:35:53 -0700 (PDT)
Subject: Re: [linux-lvm] Problem with LVM2 and device-mapper
From: "Patrick Lawrence (LVM List)" <5e67ea4d1e39ed0d23e6@patsoffice.com>
In-Reply-To: <85f72c0fd806dec224faff1ca6dd83a3@redhat.com>
References: <1129665057.4262.7.camel@cantrell.patsoffice.com>
	<85f72c0fd806dec224faff1ca6dd83a3@redhat.com>
Date: Tue, 18 Oct 2005 14:35:40 -0700
Message-Id: <1129671341.2901.2.camel@cantrell.patsoffice.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

> After a failed vgchange -ay, what does 'dmsetup ls' report?

<snip>
[root@hetfield ~]# vgchange -ay VolGroup02
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'VolGroup02-DVD'.
  1 logical volume(s) in volume group "VolGroup02" now active
[root@hetfield ~]# dmsetup ls
VolGroup00-Home (253, 1)
pdc_jahacaib    (253, 6)
VolGroup00-Swap (253, 5)
VolGroup02-DVD  (253, 10)
VolGroup00-Root (253, 0)
VolGroup01-Media        (253, 9)
pdc_jahacaib1   (253, 7)
VolGroup00-Usr  (253, 2)
VolGroup01-Data (253, 8)
VolGroup00-Var  (253, 4)
VolGroup00-Local        (253, 3)
[root@hetfield ~]# ls -lF /dev/mapper
total 0
crw-------  1 root root  10, 63 Oct 15 10:00 control
brw-rw----  1 root disk 253,  6 Oct 15 17:00 pdc_jahacaib
brw-rw----  1 root disk 253,  7 Oct 15 17:00 pdc_jahacaib1
brw-rw----  1 root disk 253,  1 Oct 15 10:00 VolGroup00-Home
brw-rw----  1 root disk 253,  3 Oct 15 10:00 VolGroup00-Local
brw-rw----  1 root disk 253,  0 Oct 15 10:00 VolGroup00-Root
brw-rw----  1 root disk 253,  5 Oct 15 10:00 VolGroup00-Swap
brw-rw----  1 root disk 253,  2 Oct 15 10:00 VolGroup00-Usr
brw-rw----  1 root disk 253,  4 Oct 15 10:00 VolGroup00-Var
brw-rw----  1 root disk 253,  8 Oct 15 17:00 VolGroup01-Data
brw-rw----  1 root disk 253,  9 Oct 15 17:00 VolGroup01-Media
brw-rw----  1 root disk 253, 10 Oct 18 14:32 VolGroup02-DVD
<snip>

The node is indeed created in /dev/mapper (which I assume 'dmsetup ls'
is querying.)  If I deactivate that volgroup the entry is removed.

Hope this helps.

Regards,

Pat
