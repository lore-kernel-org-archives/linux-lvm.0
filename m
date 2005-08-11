Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7BI6hV10697
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 14:06:43 -0400
Received: from gateway.kindergarten (ppp-20.au1.fn.td-fn.de [217.24.197.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7BI6aDk019611
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 14:06:36 -0400
Received: from localhost (localhost [127.0.0.1])
	by gateway.kindergarten (Postfix) with ESMTP id 4FEDB430D
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 18:08:47 +0000 (UTC)
Received: from gateway.kindergarten ([127.0.0.1])
	by localhost (gateway [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 05607-03 for <linux-lvm@redhat.com>;
	Thu, 11 Aug 2005 18:08:44 +0000 (UTC)
Received: from huepfburg.kindergarten (imap.huepfburg.kindergarten
	[172.16.74.101])
	by gateway.kindergarten (Postfix) with ESMTP id E5DAD3292
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 18:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by huepfburg.kindergarten (Postfix) with ESMTP id 7F4CE39D3D
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 20:08:43 +0200 (CEST)
Received: from huepfburg.kindergarten ([127.0.0.1])
	by localhost (huepfburg [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 06215-02 for <linux-lvm@redhat.com>;
	Thu, 11 Aug 2005 20:08:39 +0200 (CEST)
Received: from seifenkiste.kindergarten (seifenkiste.kindergarten
	[172.16.74.100])
	by huepfburg.kindergarten (Postfix) with ESMTP id 571BDB505
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 20:08:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by seifenkiste.kindergarten (Postfix) with ESMTP id 5B28831366
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 20:08:35 +0200 (CEST)
From: Dirk Jakobsmeier <dirk.jakobsmeier@web.de>
Subject: Re: [linux-lvm] ghostlike error on logical volume on raid1
Date: Thu, 11 Aug 2005 20:08:31 +0200
References: <200508111906.11974.dirk.jakobsmeier@web.de>
	<20050811172721.GH5087@agk.surrey.redhat.com>
In-Reply-To: <20050811172721.GH5087@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200508112008.32013.dirk.jakobsmeier@web.de>
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

Am Donnerstag, 11. August 2005 19:27 schrieb Alasdair G Kergon:
> On Thu, Aug 11, 2005 at 07:06:10PM +0200, Dirk Jakobsmeier wrote:
> > I use a kernel.org kernel 2.6.12 on a SuSE 9.2.
>
> Try updating to latest 2.6.13-rc* which includes a fix to bio_clone.
>
> Alasdair

Thank you for your answer Alasdair

i will try tomorrow. After your hint i read in change logs at kernel org about 
that.

Regards

Dirk
-- 
--------------------------------------------------
   Dirk Jakobsmeier Friedrichshafen a.B.

      http://www.dirk-jakobsmeier.de

                   GnuPG:

 http://www.dirk-jakobsmeier.de/pubkey.asc
--------------------------------------------------
