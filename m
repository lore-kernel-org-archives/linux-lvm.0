Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E4mar04488
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 00:48:36 -0400
Received: from ms.usish.com (ms.usish.com [61.152.132.204])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9E4mNc1007676
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 00:48:25 -0400
Received: from usish000045 (usish000045.usish.com.cn [192.168.56.150])
	by ms.usish.com (8.12.8/8.12.8) with SMTP id i9E4EEEW010335
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 12:14:16 +0800
Message-Id: <200410140414.i9E4EEEW010335@ms.usish.com>
From: "=?GB2312?Q?=B2=CC=E4=DE?=" <yearn_cai@usish.com>
Subject: Re: Re: [linux-lvm] pvcreate is successful but can't vgcreate
Mime-Version: 1.0
Date: Thu, 14 Oct 2004 12:13:36 +0800
Content-Transfer-Encoding: 8bit
Reply-To: yearn_cai@usish.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

no,it's not a symlink and i can use the disk normally by mounting /dev/sda1....

>Just a guess, if /dev/sda is a symlink have you tried passing the full device name to vgcreate? 
>I.E. vgcreate group1 /dev/scsi/host1... 
> 
>----- Original Message ----- 
>From: "����" <yearn_cai@usish.com> 
>To: "linux-lvm@redhat.com" <linux-lvm@redhat.com> 
>Subject: [linux-lvm] pvcreate is successful but can't vgcreate 
>Date: Thu, 14 Oct 2004 11:10:19 +0800 
> 
>>  
>> i want to use LVM to manage my SATA disks attached on arm system and: 
>>  
>> pvcreate /dev/sda 
>> Physical volume "/dev/sda" successfully created 
>>  
>> vgcreate group1 /dev/sda 
>> No physical volume label read from /dev/sda 
>> /dev/sda not identified as an existing physical volume 
>> Unable to add physical volume '/dev/sda' to volume group 'group1'. 
>>  
>> what's wrong and why? 
>>  
>>  
>> _______________________________________________ 
>> linux-lvm mailing list 
>> linux-lvm@redhat.com 
>> https://www.redhat.com/mailman/listinfo/linux-lvm 
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
>>  
> 
>-- 
>___________________________________________________________
>Sign-up for Ads Free at Mail.com
>http://promo.mail.com/adsfreejump.htm
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

= = = = = = = = = = = = = = = = = = = =
			

������������������
��
 
				 
��������������������
����������������yearn_cai@usish.com
��������������������2004-10-14
