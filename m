Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i56F5pbI005568
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2004 16:05:51 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BWzDb-0007eU-48
	for linux-lvm@redhat.com; Sun, 06 Jun 2004 16:05:51 +0100
Date: Sun, 6 Jun 2004 16:05:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] can't create snapshot on FC2
Message-ID: <20040606150550.GF6302@agk.surrey.redhat.com>
References: <40C32E02.9070902@jct.ac.il>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40C32E02.9070902@jct.ac.il>
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

On Sun, Jun 06, 2004 at 05:45:22PM +0300, Yedidia Klein wrote:
> I'm trying to create snapshot on lvm2 rinning on a fresh Fedora Core 2 
> linux machine

Fedora doesn't include kernel support for snapshots/mirrors yet.

To use them you'd need to patch your kernel.
  http://sources.redhat.com/dm/

Alasdair
-- 
agk@redhat.com
