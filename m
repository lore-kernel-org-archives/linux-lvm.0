Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7D7u1V08491
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 03:56:01 -0400
Received: from gateway.kindergarten (ppp-38.au1.fn.td-fn.de [217.24.197.38])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7D7tpP0020171
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 03:55:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by gateway.kindergarten (Postfix) with ESMTP id 7507F33E05
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 07:57:47 +0000 (UTC)
Received: from gateway.kindergarten ([127.0.0.1])
	by localhost (gateway [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 05439-08 for <linux-lvm@redhat.com>;
	Sat, 13 Aug 2005 07:57:34 +0000 (UTC)
Received: from huepfburg.kindergarten (imap.huepfburg.kindergarten
	[172.16.74.101])
	by gateway.kindergarten (Postfix) with ESMTP id 64A1A33E01
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 07:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by huepfburg.kindergarten (Postfix) with ESMTP id F001450E62
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 09:57:29 +0200 (CEST)
Received: from huepfburg.kindergarten ([127.0.0.1])
	by localhost (huepfburg [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 06189-04 for <linux-lvm@redhat.com>;
	Sat, 13 Aug 2005 09:57:29 +0200 (CEST)
Received: from seifenkiste.kindergarten (seifenkiste.kindergarten
	[172.16.74.100])
	by huepfburg.kindergarten (Postfix) with ESMTP id C6E8050E60
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 09:57:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by seifenkiste.kindergarten (Postfix) with ESMTP id 1767F2B338
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 06:52:46 +0200 (CEST)
From: Dirk Jakobsmeier <dirk.jakobsmeier@web.de>
Subject: Re: [linux-lvm] ghostlike error on logical volume on raid1
Date: Sat, 13 Aug 2005 06:52:42 +0200
References: <200508111906.11974.dirk.jakobsmeier@web.de>
	<20050811172721.GH5087@agk.surrey.redhat.com>
	<200508112008.32013.dirk.jakobsmeier@web.de>
In-Reply-To: <200508112008.32013.dirk.jakobsmeier@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200508130652.43089.dirk.jakobsmeier@web.de>
Reply-To: dirk.jakobsmeier@web.de,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Am Donnerstag, 11. August 2005 20:08 schrieb Dirk Jakobsmeier:
> Am Donnerstag, 11. August 2005 19:27 schrieb Alasdair G Kergon:
> > On Thu, Aug 11, 2005 at 07:06:10PM +0200, Dirk Jakobsmeier wrote:
> > > I use a kernel.org kernel 2.6.12 on a SuSE 9.2.
> >
> > Try updating to latest 2.6.13-rc* which includes a fix to bio_clone.
> >
> > Alasdair

Hello Alasdair

you were absolutely right. I read about the problem was solved in 2.6.12.4 so 
i tried this because using one of the rc kernels sometimes gave me problems 
with some hardware (like nvidia graphic card). Also in 2.6.12.4 the problem 
should be solved. After installing i tried the same file tared on thursday an 
everythink is working properly now. No errors anymore.

Thank you for helping me.

Dirk
-- 
