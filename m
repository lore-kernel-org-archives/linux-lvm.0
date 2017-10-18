Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBB15D963
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 22:04:27 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBE517E428
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 22:04:24 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 2454D40512C5
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 00:04:23 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 19 Oct 2017 00:04:22 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <c2bc73c4d92b3c476ced8b4ffae5b9c2@xenhideout.nl>
Subject: Re: [linux-lvm] raid10 to raid what? - convert
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

lejeczek schreef op 18-10-2017 17:52:

> I'm still looking for an answer - if it's possible then how to split
> raid10 into two raid0 LVs(with perhaps having data intact?)
> I've been fiddling with --splitmirrors but either I got it wrong or I
> didn't and command just fails.
> More than contemplating theories and general knowledge on raid I'd
> prise a lot succinct, concrete info, actuall experience of "howto".

Sorry that I can't help you here, but I believe it is possible with 
mdraid.

However note that if you can spend the time you could take two disks, 
wipe them, put raid 0 on it, and then copy the still functioning RAID 10 
over. I know that's not what you're asking but personally I have no 
hands-on experience with LVM raid and metadata.

I assume that even if you were to manage to get a raid 0 going with pure 
DM commands you'd still need to change LVM's metadata and no clue how to 
do that myself.

Conceivably, copying your data over is not ideal but it should not take 
longer than a day?

Don't forget that RAID 10 is 2 stripes of mirrors...

But LVM typically prevents you to operate on a volume group if not all 
PVs are present...

Anyway if it can't be done by lvconvert, it probably can't be done 
(without whatever complex thing).
