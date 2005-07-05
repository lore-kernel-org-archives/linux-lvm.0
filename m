Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j65KRmV25781
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:27:48 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j65KRmJe012651
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:27:48 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:POEwp2iHpIxjB6rG8GA4Ej2IuWYqLssf@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j65KRkSa002750
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:27:46 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:9kjflx3DAawsRi4XQi8saCJvWQfvOiKm@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j65KRjMl021627
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:27:46 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j65KRjnS021623
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:27:45 -0400
Date: Tue, 5 Jul 2005 16:27:45 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Subject: Re: [linux-lvm] Segfault in lvcreate?
In-Reply-To: <Pine.LNX.4.44.0507051240100.21204-100000@algiers.clic.cs.columbia.edu>
Message-ID: <Pine.LNX.4.44.0507051622040.21204-100000@algiers.clic.cs.columbia.edu>
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

I used an old version from a build I cvs updated from
earlier this year:

LVM2/tools/CVS/Entries: /lvcreate.c/1.91/Thu Apr  7 12:39:43 2005//

and was able to create my lv.  my current version is:

/lvcreate.c/1.96/Fri Jun  3 19:48:19 2005//



debugging to a small degree, it looked like the problem
was in LVM2/lib/metadata/lv_manip.c::_setup_alloced_segment

and the parameters to alloc_lv_segment, but I'm too busy at the moment to
track it further.  if I get a chance, I'll try to debug further
and submit a fix.

-dan



On 5, Jul, 2005, Dan B. Phung declared:

> am I doing something wrong? 
> 
> blade01:phung # pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sdb
>   VG Name               lil_cheesy1
>   PV Size               68.32 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              17491
>   Free PE               17491
>   Allocated PE          0
>   PV UUID               LXHvR8-IrQ0-SGV9-wkL2-a0bE-GsQG-vLG6Mg
> 
> blade01:phung #  lvcreate  -L68G -n lil_cheesy1_lv lil_cheesy1
> Segmentation fault
> 
> 
> -dan
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
email:  phung@cs.columbia.edu
www:    http://www.cs.columbia.edu/~phung
phone:  646-775-6090
office: CS Dept. 520, 1214 Amsterdam Ave., MC 0401, New York, NY 10027
