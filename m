Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3MI14st005279
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 19:01:05 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FXMPo-0002Iq-9Q
	for linux-lvm@redhat.com; Sat, 22 Apr 2006 19:01:04 +0100
Date: Sat, 22 Apr 2006 19:01:04 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Another XFS + LVM2 snapshots problems
Message-ID: <20060422180104.GD4809@agk.surrey.redhat.com>
References: <003f01c66616$de010400$0100a8c0@inspiron>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003f01c66616$de010400$0100a8c0@inspiron>
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

On Sat, Apr 22, 2006 at 04:13:01PM +0200, Gabriel Barazer wrote:
> Linux kernel 2.6.16.1
> LVM & mapper version 2.01.15 (library 1.01.15, driver version 4.5.0)

As you discovered, those versions are not compatible.
You upgraded your kernel to a recent one: you need to upgrade your 
dm & lvm2 packages to correspond with that kernel.  (1.02.* & 2.02.*)

Alasdair
-- 
agk@redhat.com
