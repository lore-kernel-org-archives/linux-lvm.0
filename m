Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5F9euYV000380
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 05:40:56 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5F9etMW028238
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 05:40:55 -0400
Received: from wolverine (unknown [192.168.1.71])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id B1E4F12ED8
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 10:40:49 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Unexpected write access to LV
Date: Thu, 15 Jun 2006 10:42:40 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060614220207.GF27639@agk.surrey.redhat.com>
Message-Id: <20060615094049.B1E4F12ED8@bluewhale.planbit.co.uk>
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

Thanks for the (unbelievably) quick response.  I'll keep my eyes open for
the next full release - taking CVS releases for non-critical updates always
makes me a little nervous...

- Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alasdair G Kergon
> Sent: 14 June 2006 23:02
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Unexpected write access to LV
> 
> On Wed, Jun 14, 2006 at 04:04:18PM +0100, Roger Lucas wrote:
> > Thanks for the quick reply.  It sounds like you have already found the
> bug.
> > Do you have any idea when a fix will be available?
> 
> I've checked a fix into device-mapper CVS, so it'll get rolled into
> the next packages.
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
