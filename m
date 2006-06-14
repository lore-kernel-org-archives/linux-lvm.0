Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EM279e017931
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 23:02:07 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FqdR9-0007kh-RJ
	for linux-lvm@redhat.com; Wed, 14 Jun 2006 23:02:07 +0100
Date: Wed, 14 Jun 2006 23:02:07 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unexpected write access to LV
Message-ID: <20060614220207.GF27639@agk.surrey.redhat.com>
References: <20060614145540.GB27639@agk.surrey.redhat.com>
	<20060614150226.B2E9D12EDA@bluewhale.planbit.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060614150226.B2E9D12EDA@bluewhale.planbit.co.uk>
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

On Wed, Jun 14, 2006 at 04:04:18PM +0100, Roger Lucas wrote:
> Thanks for the quick reply.  It sounds like you have already found the bug.
> Do you have any idea when a fix will be available?
 
I've checked a fix into device-mapper CVS, so it'll get rolled into
the next packages.

Alasdair
-- 
agk@redhat.com
