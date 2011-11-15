Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAF6j67r019714
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 01:45:06 -0500
Received: from mail.ynet.co.nz (mail.ynet.co.nz [210.48.92.21])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAF6j5MK007683
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 01:45:05 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.ynet.co.nz (Postfix) with ESMTP id C10D027223B
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 19:45:03 +1300 (NZDT)
Received: from mail.ynet.co.nz ([127.0.0.1])
	by localhost (mail.ynet.co.nz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhGsjtCM2UwT for <linux-lvm@redhat.com>;
	Tue, 15 Nov 2011 19:45:00 +1300 (NZDT)
Received: from [10.10.10.10] (unknown [210.48.92.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: omiha@ynet.co.nz)
	by mail.ynet.co.nz (Postfix) with ESMTPSA id 5C34A272237
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 19:45:00 +1300 (NZDT)
Message-ID: <4EC20A6A.10709@omiha.com>
Date: Tue, 15 Nov 2011 19:44:58 +1300
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4EC09964.1080305@omiha.com> <4EC12F54.2000303@redhat.com>
In-Reply-To: <4EC12F54.2000303@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Unable to remove LVs
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
To: linux-lvm@redhat.com

Hi Bryn,
 
> The partition map has a 'p' separator - d-pdc.oa.cp1 - the correct
> command is:
>
> kpartx -d /dev/mapper/d-pdc.oa.c

# kpartx -d /dev/mapper/d-pdc.oa.c
# kpartx -l /dev/mapper/d-pdc.oa.c
d-pdc.oa.c1 : 0 71103627 /dev/mapper/d-pdc.oa.c 63
# lvs | grep oa
  pdc.oa.c         d    -wi-ao  37.00G      

>
>> server1:/# lvs | grep oa
>>    pdc.oa.c         d    -wi-ao  37.00G
>
> The LV is still showing as active and open here. You should be able to
> remove it with lvremove d/pdc.oa.c or shut it down with
> vgchange/lvchange after correctly removing the kpartx mapping.

# lvremove d/pdc.oa.c
  Can't remove open logical volume "pdc.oa.c"
# lvchange -a n d/pdc.oa.c
  LV d/pdc.oa.c in use: not deactivating

>
> If it still shows as open you may want to look at the output of
> "dmsetup ls --tree" to see if there are other device-mapper devices
> using it and make sure that it's not mounted anywhere.

# dmsetup ls --tree
d-pdc.oa.cp1 (254:78)
 └─d-pdc.oa.c (254:7)
    └─ (8:11)


I'm positive it's not mounted anywhere.

Any advice how to proceed from here?

kind regards,
Jan
