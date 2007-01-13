Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0DI05HU003483
	for <linux-lvm@redhat.com>; Sat, 13 Jan 2007 13:00:05 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0DI04vA014612
	for <linux-lvm@redhat.com>; Sat, 13 Jan 2007 13:00:04 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1H5nAg-0005mk-DG
	for linux-lvm@redhat.com; Sat, 13 Jan 2007 19:00:02 +0100
Received: from adsl-67-117-144-57.dsl.snfc21.pacbell.net ([67.117.144.57])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Jan 2007 19:00:02 +0100
Received: from jon by adsl-67-117-144-57.dsl.snfc21.pacbell.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Jan 2007 19:00:02 +0100
From: Jonathan Biggar <jon@levanta.com>
Message-ID: <eob6bh$89j$1@sea.gmane.org>
References: <87hcuu9902.fsf@pumba.bayour.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <87hcuu9902.fsf@pumba.bayour.com>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Can't pvcreate /dev/sda
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Sat, 13 Jan 2007 18:00:07 -0000
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Turbo Fredriksson wrote:
> This is very weird!
> 
> ----- s n i p -----
> root@pegasos:~# pvscan
>   PV /dev/hdb   VG MovieShare   lvm2 [74.53 GB / 74.53 GB free]
>   PV /dev/sdb                   lvm2 [372.61 GB]
>   Total: 2 [447.14 GB] / in use: 1 [74.53 GB] / in no VG: 1 [372.61 GB]
> root@pegasos:~# pvcreate /dev/sda
>   Physical volume "/dev/sda" successfully created
> root@pegasos:~# pvscan
>   PV /dev/hdb   VG MovieShare   lvm2 [74.53 GB / 74.53 GB free]
>   PV /dev/sdb                   lvm2 [372.61 GB]
>   Total: 2 [447.14 GB] / in use: 1 [74.53 GB] / in no VG: 1 [372.61 GB]
> ----- s n i p -----
> 
> Any ideas?

Check the filter in lvm.conf to see if /dev/sdb is excluded from scanning?

-- 
Jonathan Biggar
jon@levanta.com
