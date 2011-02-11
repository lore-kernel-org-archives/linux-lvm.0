Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1B1nFsF030091
	for <linux-lvm@redhat.com>; Thu, 10 Feb 2011 20:49:15 -0500
Received: from smtp103.prem.mail.ac4.yahoo.com
	(smtp103.prem.mail.ac4.yahoo.com [76.13.13.42])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p1B1n2xS004498
	for <linux-lvm@redhat.com>; Thu, 10 Feb 2011 20:49:03 -0500
Message-ID: <4D549586.9010302@Yahoo.com>
Date: Thu, 10 Feb 2011 20:48:54 -0500
From: Peter Flass <Peter_Flass@Yahoo.com>
MIME-Version: 1.0
References: <4D54552E.6070202@Yahoo.com>
	<20110210165325.27b346b5@bettercgi.com>
In-Reply-To: <20110210165325.27b346b5@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot access logical volume (open count=1)
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ray Morris <support@bettercgi.com>

I'm learning as I go here, I had never heard of Linux LVM until 
yesterday.  This is a plain vanilla fedora installation.  /dev/sdb2 
contains the root and swap logical volumes.  /dev/sdb1 is home.  kpartx 
-a /dev/sdb creates /dev/sdb1 and /dev/sdb2,
and kpartx -d /dev/sdb deletes both of them.  Neither state made a bit 
of difference as far as accessing 'home'.

Pvscan shows one pv: /dev/sdb2.

BTW, I forgot to mention that I'm booting from the latest Ubuntu rescure 
remix  CD (10.10).  My Fedora CD won't boot - it loops during boot.  
Someone suggested Knoppix, but that loops also.


On 2/10/2011 5:53 PM, Ray Morris wrote:
>    Check whether the LV has a partition on it.
> (fdisk -l /dev/vg*/home)  If so, use kpartx -dvv
> to close it.
>
>> The disk (sdb) has one vg and three lv's on it
>> /proc/mounts shows /dev/sdb1 mounted
>    If /dev/sdb1 is mounted, does that mean there's
> a /dev/sdb2 which is a PV?
