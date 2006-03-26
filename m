Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2QA7VvI007447
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 05:07:31 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2QA7TC5008623
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 05:07:29 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 54C5611469
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 10:07:29 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 06893-01-4 for <linux-lvm@redhat.com>;
	Sun, 26 Mar 2006 10:07:28 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 1DC2111458
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 10:07:28 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] online resize
Date: Sun, 26 Mar 2006 04:07:27 -0600
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<200603260246.13779.krakrjak@volumehost.net>
	<20060326092923.GJ14018@percy.comedia.it>
In-Reply-To: <20060326092923.GJ14018@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603260407.27160.krakrjak@volumehost.net>
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

On Sunday 26 March 2006 03:29, Luca Berra wrote:
> On Sun, Mar 26, 2006 at 02:46:13AM -0600, Zac Slade wrote:
> >ext2/3, resizable offline reliably.  Online resize is a *very*
> > experimental experiment.  Have good backups.
>
> ext2/3 online resize is available as default in RedHat 4, and it just
> works.
I'm glad that's the case for you.  If it works don't fix it.  However, from 
recent experience it is not release quality (especially for shrinking).
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
