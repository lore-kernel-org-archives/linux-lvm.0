Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5TKS1u19674
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 16:28:01 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5TKS0VN032049
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 16:28:00 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:RdX5vka3cdNyEn63djuxlww6MSEScBcN@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j5TKRwSa002951
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 16:27:59 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:fljPOM/r86dOX2OZrGW6o4bZ2W9jZth/@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j5TKRwMl018143
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 16:27:58 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j5TKRwrC018139
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 16:27:58 -0400
Date: Wed, 29 Jun 2005 16:27:58 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Subject: Re: [linux-lvm] error trying to vgcfgrestore
In-Reply-To: <Pine.LNX.4.44.0506291450320.17754-100000@algiers.clic.cs.columbia.edu>
Message-ID: <Pine.LNX.4.44.0506291626430.17754-100000@algiers.clic.cs.columbia.edu>
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

ah, I think the -l wasn't needed, but still I have no luck:

blade01:backup # vgcfgrestore big_cheese
  Couldn't find device with uuid '6uBYm4-WiAQ-eZib-t6hK-IH2c-fmAQ-0a9K9i'.
  Couldn't find all physical volumes for volume group big_cheese.
  Restore failed.

is it safe to recreate the physical volumes?  does anything get wiped, or
does the meta just get reconstituted?  


On 29, Jun, 2005, Dan B. Phung declared:

> this is related to my earlier post of:
>   [linux-lvm] my volume group disappeared!
> 
> I'm trying to restore the vg, which I backed up before with:
>   vgcfgbackup -f big_cheese_VG.2005.5.12 big_cheese
> 
> now, when I try to restore, I get these errors:
> 
> blade01:root # vgcfgrestore -d -v -f big_cheese_VG.2005.5.12 -l -n 
> big_cheese big_cheese
>     Loaded external locking library liblvm2clusterlock.so
> 
>   File:         /etc/lvm/archive/big_cheese_00000.vg
>     Wiping cache of LVM-capable devices
>   Couldn't find device with uuid '6uBYm4-WiAQ-eZib-t6hK-IH2c-fmAQ-0a9K9i'.
>   VG name:      big_cheese
>   Description:  Created *before* executing 'vgchange -aly'
>   Backup Time:  Mon Jun  6 00:50:26 2005
> 
> 
>   File:         /etc/lvm/backup/big_cheese
>   Couldn't find device with uuid '6uBYm4-WiAQ-eZib-t6hK-IH2c-fmAQ-0a9K9i'.
>   VG name:      big_cheese
>   Description:  Created *after* executing 'vgchange -aly'
>   Backup Time:  Mon Jun  6 00:50:26 2005
> 
> 
> ..and I've tried this after doing vgchange -aln
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
