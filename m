Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E3gar26425
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 23:42:36 -0400
Received: from webmail-outgoing.us4.outblaze.com
	(webmail-outgoing.us4.outblaze.com [205.158.62.67])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9E3gZUF001868
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 23:42:35 -0400
Received: from wfilter.us4.outblaze.com (wfilter.us4.outblaze.com
	[205.158.62.180])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	A94C81800661
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 03:42:28 +0000 (GMT)
Content-Disposition: inline
MIME-Version: 1.0
From: "Daniel ." <constantine@soon.com>
Date: Wed, 13 Oct 2004 22:42:28 -0500
Subject: Re: [linux-lvm] pvcreate is successful but can't vgcreate
Message-Id: <20041014034228.72E52164005@ws1-4.us4.outblaze.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Just a guess, if /dev/sda is a symlink have you tried passing the full device name to vgcreate? 
I.E. vgcreate group1 /dev/scsi/host1... 
 
----- Original Message ----- 
From: "����" <yearn_cai@usish.com> 
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com> 
Subject: [linux-lvm] pvcreate is successful but can't vgcreate 
Date: Thu, 14 Oct 2004 11:10:19 +0800 
 
>  
> i want to use LVM to manage my SATA disks attached on arm system and: 
>  
> pvcreate /dev/sda 
> Physical volume "/dev/sda" successfully created 
>  
> vgcreate group1 /dev/sda 
> No physical volume label read from /dev/sda 
> /dev/sda not identified as an existing physical volume 
> Unable to add physical volume '/dev/sda' to volume group 'group1'. 
>  
> what's wrong and why? 
>  
>  
> _______________________________________________ 
> linux-lvm mailing list 
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
>  
 
-- 
___________________________________________________________
Sign-up for Ads Free at Mail.com
http://promo.mail.com/adsfreejump.htm
