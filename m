Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EEteum023544
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 15:55:40 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FqWmS-0007Gd-DT
	for linux-lvm@redhat.com; Wed, 14 Jun 2006 15:55:40 +0100
Date: Wed, 14 Jun 2006 15:55:40 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unexpected write access to LV
Message-ID: <20060614145540.GB27639@agk.surrey.redhat.com>
References: <20060614140746.616D712EDA@bluewhale.planbit.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060614140746.616D712EDA@bluewhale.planbit.co.uk>
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

On Wed, Jun 14, 2006 at 03:09:38PM +0100, Roger Lucas wrote:
> It seems that you
> have to perform a "lvchange -an" then "lvchange -ay" to apply the read/write
> access rights to the logical volume.
 
Looks like a bug in some optimisation code...

Alasdair
-- 
agk@redhat.com
