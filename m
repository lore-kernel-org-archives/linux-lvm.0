Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C114917279
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 11:33:27 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C21F3C37
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 11:33:24 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id A0CBA63486
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 13:33:22 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 26 Mar 2018 13:33:22 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
Message-ID: <9bec0f2225ce56ad76e98e06030e9b6a@xenhideout.nl>
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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

Gang He schreef op 26-03-2018 8:04:

> It looks like each PV includes a copy meta data for VG, but if some PV
> has changed (e.g. removed, or moved to another VG),
> the remained PV should have a method to check the integrity when each
> startup (activated?), to avoid such inconsistent problem
> automatically.

Well I'm not really interested in "what should be", I just answered your 
question.

Also automatic resolution of differences turns into an automatic (or 
bidirectional) "sync" problem which generally depends on consistent time 
AND an agreed-upon strategy for merging conflicts which I doubt is truly 
a realistic proposal because you are talking about data loss here.

I'm sorry, I don't think (I'm not an LVM developer here) what you ask 
for is theoretically [im]possible.

At best you could have a "best merge" strategy with all associated 
risks, and I don't think you should even go that route, honestly.

It's more something for an individual administrator to solve with 
appropriate tools.
