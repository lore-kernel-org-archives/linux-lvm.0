Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6DDQgV22144
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 09:26:42 -0400
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6DDQbeW007866
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 09:26:42 -0400
Message-ID: <42D51683.7060106@berbee.com>
Date: Wed, 13 Jul 2005 08:26:27 -0500
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate prblem
References: <1121258369.13309.29.camel@fortocent.comodo.net>
In-Reply-To: <1121258369.13309.29.camel@fortocent.comodo.net>
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

sometimes you have to reboot for partition changes to take effect.
what does this show:   fdisk -l

susmitha wrote:

>Hi,
>
>I am new to LVM.
>I want t o create LVM volume group.
>So first I created a partition and then runned "pvcreate"
>root@localhost ~# pvcreate /dev/hda5
>  Device /dev/hda5 not found.
>
>
>But that is present.I didn't get why it is showing "Device not found"
>Can anyone help me.It is urgent for me.
>
>Can I create volume group on EVMS volumes?
>
>
>Thanks,
>susmitha
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>

-- 

----------------------------------------------------------------------
Alan W. Jurgensen - Berbee Information Networks - jurgensen@berbee.com 
