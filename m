Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0CG1Sr03159
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:01:28 -0500
Received: from e-liberty.pl (yh226.internetdsl.tpnet.pl [80.55.241.226])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0CG1Qc7030188
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:01:27 -0500
Received: from [10.0.0.193] (aji238.internetdsl.tpnet.pl [83.16.242.238])
	by e-liberty.pl (Postfix) with ESMTP id D9BD13CF91
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 18:26:24 +0100 (CET)
Message-ID: <41E549C8.7000507@e-liberty.pl>
Date: Wed, 12 Jan 2005 17:01:12 +0100
From: Piw <piw@e-liberty.pl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Trouble with XFS/Snapshot
References: <87y8eypyrg.fsf@mononoke.fimasys.fr>
In-Reply-To: <87y8eypyrg.fsf@mononoke.fimasys.fr>
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

Bruno Bonfils wrote:
> Hello,
> 
> I'm trying to use the snapshot feature, but i have trouble. I don't
> have error message (kernel or others), i don't know how to check if
> lvcreate still running..
> 
> 
> My first try was with a volume group of ~ 580 GB (hardware raid 5)
> I created a logical volume 50GB, create a XFS Filesystem, put some
> data (~1GB) and run the following commands :
> 
> $ xfs_freeze -f <mount point>
> $ lvcreate -v -s -L 2GB -n snapshot <device>
> 

I got same problem (and even wrote on this group).
Don't do xfs_freeze before taking snapshot. lvcreate when snapshoting 
tries to lock filesystem by itself, and when filesystem is locked with 
xfs_freeze, is hand during lock and wait... and wait... and wait...
According to my tests, lvm locking is enought to create stable snap.

HTH

--
Piw
