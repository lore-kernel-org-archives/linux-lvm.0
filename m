Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7ULQUho028793
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 22:26:30 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GIXZu-0002fB-Rp
	for linux-lvm@redhat.com; Wed, 30 Aug 2006 22:26:30 +0100
Date: Wed, 30 Aug 2006 22:26:30 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem with lvm2 snapshot filling up on fc4
Message-ID: <20060830212630.GO13859@agk.surrey.redhat.com>
References: <s4f54602.099@milprog1.milprog.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s4f54602.099@milprog1.milprog.ch>
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

On Wed, Aug 30, 2006 at 08:01:50AM +0200, Marcel Gsteiger wrote:
> I have a big problem. I did backups using LVM snapshots on my fc4 box
> (2.6.15-1). Now a snapshot filled to 100%. Since then, I cannot do anything
> anymore either with this snapshot nor with the original volume. lvremove always
> hangs with a message waiting for /var/lock/lvm/V_vg00 . Rebooting does not help
> either.

Fascinating.  I've reproduced something similar to this with an up-to-date
kernel.

To work around this while we sort out what the problem is, boot your machine
*without* attempting to activate the logical volume concerned.
Then perform the lvremove on the snapshot (while origin and snapshot are
inactive).

Alasdair
-- 
agk@redhat.com
