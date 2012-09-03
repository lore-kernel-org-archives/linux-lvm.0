Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q836XMN9017132
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2012 02:33:23 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q836XKXH005816
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2012 02:33:21 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 7FC6229E8CF
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2012 08:33:19 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10022)
	with ESMTP id 0mfixaquf54j for <linux-lvm@redhat.com>;
	Mon,  3 Sep 2012 08:33:09 +0200 (CEST)
Received: from phineas.fibbs.org (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id C32B21E6B7A
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2012 08:33:08 +0200 (CEST)
Received: from 46.128.33.1.dynamic.cablesurf.de ([46.128.33.1])
	by phineas.fibbs.org with SMTP ID 505 for <linux-lvm@redhat.com>;
	Mon, 3 Sep 2012 08:33:08 +0200 (CEST)
Received: from [192.168.0.10] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 5BB211E6B7A
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2012 08:33:08 +0200 (CEST)
Message-ID: <50444F23.4070802@mglug.de>
Date: Mon, 03 Sep 2012 08:33:07 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <5043C9DF.9090101@mohawksoft.com>
In-Reply-To: <5043C9DF.9090101@mohawksoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced LVM Features
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi Mark,

Am 02.09.2012 23:04, schrieb Mark Woodward:
> A while back I was asking about how to create snapshots of snapshots
> and other advanced LVM features that are seemingly not part of LVM2.

I didnt find any email from you on the list. This is your first one.

>
> Is there a resource site that covers changes and advancements in LVM
> beyond 2006? The site: http://wiki.tldp.org/LVM-HOWTO only has up
> until 2006.

You're right, the howto is really outdated, the developers know about
this issue.

The most important new features are about the thinpools, which include
snap of snaps. There you find the best information in the new manpages.
You should take at least 2.02.97 or git. You have to enable
thinpool-features explicitly with ./configure --with-thin=internal! Dont
forget to install the thin-provisioning-tools, too!  I dont know why
these arent part of the LVM2-sources, but you will need them.

Feel free to ask, but at the best explizit on your concrete problems.
Additionally you can ask on IRC on freenode at the #lvm channel

Hth,
Oliver
