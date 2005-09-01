Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j81CuoV00323
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 08:56:50 -0400
Received: from smtp.aaisp.net.uk (A.painless.aaisp.net.uk [81.187.81.51])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j81CuWSb015883
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 08:56:43 -0400
Received: from ebourne.me.uk ([81.187.210.78] helo=hordein.ebourne.me.uk)
	by smtp.aaisp.net.uk with esmtp (Exim 4.43) id 1EAoc5-0004x9-0g
	for linux-lvm@redhat.com; Thu, 01 Sep 2005 13:56:17 +0100
Received: from avenin.ebourne.me.uk (avenin.ebourne.me.uk [192.168.66.4])
	by hordein.ebourne.me.uk (Postfix) with ESMTP id 8BD7B12CE5C
	for <linux-lvm@redhat.com>; Thu,  1 Sep 2005 13:56:14 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by avenin.ebourne.me.uk (Postfix) with ESMTP id 6496CC81C0
	for <linux-lvm@redhat.com>; Thu,  1 Sep 2005 13:56:14 +0100 (BST)
Subject: Re: [linux-lvm] pvmove is stuck
From: Martin Ebourne <lists@ebourne.me.uk>
In-Reply-To: <20050901123552.GM15141@agk.surrey.redhat.com>
References: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
	<20050831213759.GI15141@agk.surrey.redhat.com>
	<1125525121.11068.12.camel@avenin.ebourne.me.uk>
	<20050831222947.GL15141@agk.surrey.redhat.com>
	<1125528606.11068.23.camel@avenin.ebourne.me.uk>
	<20050901123552.GM15141@agk.surrey.redhat.com>
Date: Thu, 01 Sep 2005 13:56:13 +0100
Message-Id: <1125579373.11068.31.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2005-09-01 at 13:35 +0100, Alasdair G Kergon wrote:
> On Wed, Aug 31, 2005 at 11:50:05PM +0100, Martin Ebourne wrote:
> > But is there any other possible explanation than a bad sector? Only
> > there's several reasons I don't think there are any bad sectors:
>  
> Well check for yourself if the mirroring process has worked:
> read the data from each side of the mirror and check it's
> identical.

Ah, should have thought of that. Doh.

>   If a small part of it isn't, try copying that
> part manually and see if it gives any errors.

What I did do (after still not finding any disk errors) was pvmove
--abort, then I restarted again. This time it copied the remaining two
parts entirely successfully.

I've no idea how the mirroring/kcopy is implemented. Does it retry if a
read fails? I was wondering if the self test initiated on the drive
could have caused a read to fail (though I'm sure it shouldn't).

Cheers,

Martin.
