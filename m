Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9KK06M0013727
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 21:00:06 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ESga5-00085r-GM
	for linux-lvm@redhat.com; Thu, 20 Oct 2005 21:00:05 +0100
Date: Thu, 20 Oct 2005 21:00:05 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
Message-ID: <20051020200005.GN30611@agk.surrey.redhat.com>
References: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
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

On Thu, Oct 20, 2005 at 11:07:42AM +0900, Craig Hagerman wrote:
> %  pvcreate /dev/sdb1
 
> /dev/sdb1               1       30515   245111706   8e  Linux LVM
 
> VFS: Can't find ext3 filesystem on dev sdb.
 
Confusion between sdb and sdb1?

Similar with sda perhaps?

If your device is partitioned, then you *only* use the partitions - never 
sdb at the same time as sdb1.  Which is it meant to be?

Alasdair
-- 
agk@redhat.com
