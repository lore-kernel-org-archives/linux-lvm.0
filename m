Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l15FmASn024289
	for <linux-lvm@redhat.com>; Mon, 5 Feb 2007 15:48:10 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1HE64g-0004hi-B6
	for linux-lvm@redhat.com; Mon, 05 Feb 2007 15:48:10 +0000
Date: Mon, 5 Feb 2007 15:48:10 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Can't pvcreate /dev/sda
Message-ID: <20070205154810.GT21980@agk.surrey.redhat.com>
References: <87hcuu9902.fsf@pumba.bayour.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87hcuu9902.fsf@pumba.bayour.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jan 13, 2007 at 05:39:09PM +0100, Turbo Fredriksson wrote:
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

Check whether sda is partitioned, and if so, remove the partitions.
Use 'pvscan -vvvv' and look for the reason it gives for ignoring it.
 
Alasdair
-- 
agk@redhat.com
