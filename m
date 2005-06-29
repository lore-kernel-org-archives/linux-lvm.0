Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5THxNu28960
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:59:23 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5THxLdP014026
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:59:21 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:NKHq6O2VE/s/OKq7fBfhuR2NcfdAWhTG@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j5THxGSa022172
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:59:17 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:VeM3+8dWvOn4UZLvoBBY81gQGTnLs/yT@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j5THxGMl017796
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:59:16 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j5THxG5D017792
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:59:16 -0400
Date: Wed, 29 Jun 2005 13:59:16 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Subject: Re: [linux-lvm] my volume group disappeared!
In-Reply-To: <20050629163338.GS27078@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.44.0506291358280.17754-100000@algiers.clic.cs.columbia.edu>
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

On 29, Jun, 2005, Alasdair G Kergon declared:

> On Wed, Jun 29, 2005 at 12:17:15PM -0400, Dan B. Phung wrote:
> > configured, and I do see the /dev/sda where the data lives, 
> > and I can fdisk that device to see my array, but the physical
> > volume also seems to be missing!
>  
> check for partition table

I assume you mean the partitions from the array?  I seem
to still have those:

blade01:root # ls /dev/sda*
/dev/sda  /dev/sda1  /dev/sda2

blade01:root # fdisk /dev/sda

Command (m for help): p

Disk /dev/sda: 513.5 GB, 513557829120 bytes
255 heads, 63 sectors/track, 62436 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1         548     4401778+  82  Linux swap / 
Solaris
/dev/sda2   *         549       62436   497115360   83  Linux
 
> 

-- 
email:  phung@cs.columbia.edu
www:    http://www.cs.columbia.edu/~phung
phone:  646-775-6090
office: CS Dept. 520, 1214 Amsterdam Ave., MC 0401, New York, NY 10027
