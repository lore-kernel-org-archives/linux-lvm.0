Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EF2aMd015227
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 11:02:36 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EF2WNT031293
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 11:02:32 -0400
Received: from wolverine (unknown [192.168.1.71])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id B2E9D12EDA
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 16:02:26 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Unexpected write access to LV
Date: Wed, 14 Jun 2006 16:04:18 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060614145540.GB27639@agk.surrey.redhat.com>
Message-Id: <20060614150226.B2E9D12EDA@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Alasdair,

Thanks for the quick reply.  It sounds like you have already found the bug.
Do you have any idea when a fix will be available?

Thanks,

Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alasdair G Kergon
> Sent: 14 June 2006 15:56
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Unexpected write access to LV
> 
> On Wed, Jun 14, 2006 at 03:09:38PM +0100, Roger Lucas wrote:
> > It seems that you
> > have to perform a "lvchange -an" then "lvchange -ay" to apply the
> read/write
> > access rights to the logical volume.
> 
> Looks like a bug in some optimisation code...
> 
> Alasdair
> --
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
