Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l71K05sX011138
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 16:00:05 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l71K03MV023176
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 16:00:04 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l71JxwQY023490
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 15:59:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l71Jxwdo005636
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 15:59:58 -0400
Date: Wed, 1 Aug 2007 15:59:58 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Redirecting LVM command output on RHEL5?
In-Reply-To: <55D16D5A051757489679376DECFE315E0157E47F@G3W0639.americas.hpqcorp.net>
Message-ID: <Pine.LNX.4.44.0708011557410.5613-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 1 Aug 2007, Joubert, Kevin wrote:

> [root@linux-dl585 ~]# pvs
>   PV         VG   Fmt  Attr PSize  PFree
>   /dev/sda   vg01 lvm2 a-   10.00G    0
>   /dev/sdd   vg02 lvm2 ax    1.95G 1.08G
>   /dev/sde   vg02 lvm2 ax    1.95G 1.46G
> 
> [root@linux-dl585 ~]# pvs > kevin.txt
> 
> [root@linux-dl585 ~]# cat kevin.txt
> 
> 
> No matter what LVM command I run (i.e. vgdisplay, lvs, etc. etc.), it
> will not redirect output to my text file. Screen output is always
> successful, and every other system command I have tried (i.e. fdisk,
> etc.) will redirect output successfully. 

Check your SELinux log.  The GUI should have SELinux Troubleshooter.
You'll find that in addition to forbidding pipes, lvm is also restricted from
updating .cache :-(

I think it is a policy bug.  The troubleshooter will suggest a rule to add.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
