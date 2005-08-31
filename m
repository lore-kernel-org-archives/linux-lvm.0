Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7VG8WHQ006851
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:08:32 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAV8a-0004K9-3a
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 17:08:32 +0100
Date: Wed, 31 Aug 2005 17:08:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] segmentation fault with snapshot creation
Message-ID: <20050831160832.GE15141@agk.surrey.redhat.com>
References: <20050826152252.1zxn5dw8fwg0ossg@servius.hivos.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050826152252.1zxn5dw8fwg0ossg@servius.hivos.nl>
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

On Fri, Aug 26, 2005 at 03:22:52PM +0200, Jeroen Vriesman wrote:
> The following error occured with kernel 2.6.12-rc5, lvm2 2.01.04-5 on debian,

> Segmentation fault
 
Before losing time trying to debug it, try upgrading to the newest 
version (2.01.14) and check whether it already got fixed.

Alasdair
-- 
agk@redhat.com
