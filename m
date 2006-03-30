Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k2UM4ZvR006189
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 23:04:35 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FP5Fr-0003E2-LQ
	for linux-lvm@redhat.com; Thu, 30 Mar 2006 23:04:35 +0100
Date: Thu, 30 Mar 2006 23:04:35 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] snapshot error with xfs and disk I/O
Message-ID: <20060330220435.GM2690@agk.surrey.redhat.com>
References: <200603301009.22548.wim@unetix.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200603301009.22548.wim@unetix.nl>
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

On Thu, Mar 30, 2006 at 09:09:22AM +0100, Wim Bakker wrote:
> There seem to be serious problems with snapshots , lvm2 and xfs.
> As soon as there is a slight amount of disk I/O during snapshotting
> a logical volume with xfs , the following kind of kernel panic occurs:

You don't say what kernel.

Make sure it contains the dm snapshot patches from -mm (and probably
in Linus's git tree by now - I haven't checked).

Alasdair
-- 
agk@redhat.com
