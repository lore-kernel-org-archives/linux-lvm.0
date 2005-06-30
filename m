Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5UInKu10131
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 14:49:20 -0400
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5UIn84q027339
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 14:49:13 -0400
Message-ID: <42C43E97.4030103@berbee.com>
Date: Thu, 30 Jun 2005 13:48:55 -0500
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to remove the inactive physical volume  ??
References: <20050630181858.80962.qmail@web53002.mail.yahoo.com>
In-Reply-To: <20050630181858.80962.qmail@web53002.mail.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, sambitnanda@yahoo.com

You need to setup a filter in /etc/lvm/lvm.conf.
See:   man lvm.conf

Sambit Nanda wrote:

>Is there any command exactly oppose to pvcreate ?
>
>when i ran thoi command 
>pvcreate /dev/cciss/c0d1p[5-13]
>
>i got this error  :  pvcreate -- can't open physical
>volume "/dev/cciss/c0d1p3" to get its size
>
>though i have not mentioed the device c0d1p3
>
>then i noticed from pvscan 
>
>pvscan -- inactive PV "/dev/cciss/c0d1p1"  is in no VG
> [1 KB]
>pvscan -- inactive PV "/dev/cciss/c0d1p5"  is in no VG
> [9.32 GB]
>pvscan -- inactive PV "/dev/cciss/c0d1p6"  is in no VG
> [9.32 GB]
>pvscan -- inactive PV "/dev/cciss/c0d1p7"  is in no VG
> [4.66 GB]
>.....
>....
>..
>
>
>the c0d1p1 is acctually my   Extended  partion
>
>but my pvscan also show the same device
>pvscan -- inactive PV "/dev/cciss/c0d1p1"  is in no VG
> [1 KB]
>
>i do not what is wrong here, so i like to remove this
>enrty from my pvscan 
>
>i tried with pvmove and got error 
>ERROR: can't move physical extents: volume 
>
>please guide me how i will able to move the enrty ? 
>
>or what is the exact command to remove or delete all
>physical volume. 
>If i want to remove all physical volume i created 
>
>
>
>with this error i also notice one warning message on
>my primary disk. I had never seen this before .. 
> 
>Warning: invalid flag 0x0000 of partition table 5 will
>be corrected by w(rite)
>
>
>Thanks, 
>
>Sambit Nanda 
>203-553-3424 (O)
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
