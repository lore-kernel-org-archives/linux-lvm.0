Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5JGPIj2020142
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 17:25:18 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Bbiec-0005Rx-0s
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 17:25:18 +0100
Date: Sat, 19 Jun 2004 17:25:18 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgcfgbackup: backup of several VGs into one file fails
Message-ID: <20040619162518.GE6302@agk.surrey.redhat.com>
References: <200406191345.32913.mailinglisten@hauke-laging.de>
	<20040619160327.GC6302@agk.surrey.redhat.com>
	<200406191823.00730.mailinglisten@hauke-laging.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200406191823.00730.mailinglisten@hauke-laging.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jun 19, 2004 at 06:23:00PM +0200, Hauke Laging wrote:
> And the man page should be fixed, too:
> [VolumeGroupName...] -> [VolumeGroupName]
 
Only if specifying the -f option.
It should work without it, updating the backups in /etc/lvm/backup.
 
Alasdair
-- 
agk@redhat.com
