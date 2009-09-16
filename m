Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GK48XL026645
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:04:08 -0400
Received: from smtp2a.orange.fr (smtp2a.orange.fr [80.12.242.140])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GK3uJn007433
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:03:56 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2a19.orange.fr (SMTP Server) with ESMTP id DE38880000AB
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 22:03:55 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2a19.orange.fr (SMTP Server) with ESMTP id D13E680000AE
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 22:03:55 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-53-207.w83-115.abo.wanadoo.fr [83.115.195.207])
	by mwinf2a19.orange.fr (SMTP Server) with ESMTP id 9EC1480000AB
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 22:03:55 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mo0jK-0006DJ-K5
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 22:03:54 +0200
Date: Wed, 16 Sep 2009 22:03:53 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
Message-ID: <20090916220353.23932049@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <1253119669.5326.32.camel@delo.gdit>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
	<1253119669.5326.32.camel@delo.gdit>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it> wrote:
> Il giorno mer, 16/09/2009 alle 17.05 +0200, André Gillibert ha scritto:
> 
> > Mirroring is software RAID1.
> > What you want looks like LVM snapshots.
> > See LVM HOWTO to see how to create snapshots.
> > A backup may be a good thing to do, too.
> 
> snapshot is not a good choise for me. I want to have an identical copy
> (like dd) on another identical disk, for fast recovery in case of
> failure.
> 

Then, create a short-lived snapshot, dd the snapshot to the other disk, and then, remove the snapshot.

-- 
André Gillibert
