Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5MLmKRU011020
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 22:48:20 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FtX2C-0005Y9-QC
	for linux-lvm@redhat.com; Thu, 22 Jun 2006 22:48:20 +0100
Date: Thu, 22 Jun 2006 22:48:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 + 2.6.17 + 'lvremove <snapshot>' = hang
Message-ID: <20060622214820.GV19222@agk.surrey.redhat.com>
References: <4499CCA0.6080202@earthlink.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4499CCA0.6080202@earthlink.net>
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

On Wed, Jun 21, 2006 at 06:48:00PM -0400, raptorfan wrote:
> a 2.6.17 vanilla kernel, though I've had this problem with any kernel 
> past the 2.6.15.x series...
 
>   LVM version:     2.01.15 (2005-10-16)
>   Library version: 1.01.05 (2005-09-26)

Prior to 2.6.16, snapshots are unreliable.
Snapshots in 2.6.16+ and *.01.* userspace do not work together.
Update your userspace packages to 2.02.* and 1.02.* respectively.

Alasdair
-- 
agk@redhat.com
