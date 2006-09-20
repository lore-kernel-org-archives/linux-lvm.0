Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KAnRCL008322
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 06:49:27 -0400
Received: from osl1smout1.broadpark.no (osl1smout1.broadpark.no [80.202.4.58])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KAnPR3021434
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 06:49:26 -0400
Received: from osl1sminn1.broadpark.no ([80.202.4.59])
	by osl1smout1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21 2004))
	with ESMTP id <0J5W00NW00Q81JE0@osl1smout1.broadpark.no> for
	linux-lvm@redhat.com; Wed, 20 Sep 2006 12:49:20 +0200 (CEST)
Received: from [192.168.94.233] ([195.212.29.187]) by osl1sminn1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21
	2004)) with ESMTPA id <0J5W00JIW0Q7Q111@osl1sminn1.broadpark.no> for
	linux-lvm@redhat.com; Wed, 20 Sep 2006 12:49:20 +0200 (CEST)
Date: Wed, 20 Sep 2006 12:50:02 +0200
From: Morten Torstensen <morten@mortent.org>
Subject: Re: [linux-lvm] Misleading documentation
In-reply-to: <4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
Message-id: <45111CDA.6080406@mortent.org>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<20060918193728.GC28043@arvo.suso.org>
	<4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Scott Lamb wrote:
> This is my biggest beef with LVM - why doesn't *any* of the 
> documentation point this out? There are very few good reasons to use LVM 
> without RAID, and "ignorance" certainly isn't among them. I don't see 
> any mention of RAID or disk failures in the manual pages or in the HOWTO.

Mirroring should be dealt with in LVM itself, by mapping more PEs on physical 
seperate PVs to each LE. From the little information I've seen about the new LVM 
mirroring, it seems that the mirrors are defined on LV level instead of LE/PE. 
But after some JFGI sessions nothing really enlightening has shown up.

-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: Cartoon@jabber.no morten.torstensen@gmail.com

And if it turns out that there is a God, I don't believe that he is evil.
The worst that can be said is that he's an underachiever.
