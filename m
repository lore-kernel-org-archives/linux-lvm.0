Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i51GdnbI019018
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2004 17:39:49 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BVCIn-0001B6-C3
	for linux-lvm@redhat.com; Tue, 01 Jun 2004 17:39:49 +0100
Date: Tue, 1 Jun 2004 17:39:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] to create a PV on a I2O RAID array
Message-ID: <20040601163949.GI6302@agk.surrey.redhat.com>
References: <40BCB207.7090404@shadowconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40BCB207.7090404@shadowconnect.com>
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

On Tue, Jun 01, 2004 at 06:42:47PM +0200, Markus Lidel wrote:
> attached is a patch, which makes it possible to create a PV on a I2O 
> RAID array.
 
Or you can add it to the runtime config file, avoiding 
having to recompile.
(types in the devices section: see man lvm.conf or doc/example.conf)

Alasdair
-- 
agk@redhat.com
