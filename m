Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KDOcWB027865
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 09:24:38 -0400
Received: from gw-nam4.philips.com (gw-nam4.philips.com [161.88.253.58])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KDOaI0013017
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 09:24:36 -0400
Received: from smtpscan-nam4.philips.com (smtpscan-nam4.mail.philips.com
	[167.81.103.7])
	by gw-nam4.philips.com (Postfix) with ESMTP id DF84F96001
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 13:24:25 +0000 (UTC)
Received: from smtpscan-nam4.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 8854B57DF8
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 13:24:25 +0000 (GMT)
Received: from smtprelay-nam2.philips.com (smtprelay-nam2.philips.com
	[167.81.103.9])
	by smtpscan-nam4.philips.com (Postfix) with ESMTP id 66BA357DF2
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 13:24:25 +0000 (GMT)
Received: from anrrmh02.diamond.philips.com (anrrmh02-srv.diamond.philips.com
	[167.81.112.96])
	by smtprelay-nam2.philips.com (Postfix) with ESMTP id 1D4C130
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 13:24:25 +0000 (GMT)
In-Reply-To: <4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
Subject: Re: [linux-lvm] Misleading documentation (was: HDD Failure)
MIME-Version: 1.0
From: Tobias Bluhm <tobias.bluhm@philips.com>
Message-ID: <OF255DDD51.9A0BB030-ON852571EF.0048DBFE-852571EF.00498302@philips.com>
Date: Wed, 20 Sep 2006 09:22:33 -0400
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

Scott Lamb wrote on 09/19/2006 06:40:43 PM:

> On Sep 18, 2006, at 12:37 PM, Mark Krenz wrote:
> >   LVM != RAID
> >
> >   You should have been doing RAID if you wanted to be able to 
> > handle the
> > failure of one drive.
> 
> This is my biggest beef with LVM - why doesn't *any* of the 
> documentation point this out? There are very few good reasons to use 
> LVM without RAID, and "ignorance" certainly isn't among them. I don't 
> see any mention of RAID or disk failures in the manual pages or in 
> the HOWTO.

Good point. So if the docs make no mention of RAID or fail-over or 
redundency or spares, what made you assume that 
LVM had such capabilities????
