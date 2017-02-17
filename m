Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HFCXJ3012437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 10:12:33 -0500
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C3FD80F9F
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 15:12:28 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 38825ADE07B4
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 16:12:12 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 0THof6Y9cCja for <linux-lvm@redhat.com>;
	Fri, 17 Feb 2017 16:12:10 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 9EA4DADE0BDB
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 16:12:10 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 4WjJW6O8TRzJ for <linux-lvm@redhat.com>;
	Fri, 17 Feb 2017 16:12:10 +0100 (CET)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 8CBA6ADE07B4
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 16:12:10 +0100 (CET)
Date: Fri, 17 Feb 2017 16:12:09 +0100 (CET)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <58A64774.10004@tlinx.org>
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
	<1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>
	<58A64774.10004@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove speed
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
To: linux-lvm <linux-lvm@redhat.com>

I get 200MB on a cold day and 500 on a nice one from this SAN. These 40-50MB/s seem really being limited by pvmove alone. Nothing else shows this limit. That's why I'm asking.

Vennlig hilsen / Best regards

roy
--
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Da mihi sis bubulae frustrum assae, solana tuberosa in modo Gallico fricta, ac quassum lactatum coagulatum crassum. Quod me nutrit me destruit.

----- Original Message -----
> From: "L A Walsh" <lvm@tlinx.org>
> To: "linux-lvm" <linux-lvm@redhat.com>
> Sent: Friday, 17 February, 2017 01:44:36
> Subject: Re: [linux-lvm] pvmove speed

> Roy Sigurd Karlsbakk wrote:
>>> I'm doing pvmove of some rather large volumes from a Dell Equallogic system to
>>> Dell Compellent. Both are connected on iSCSI ....
> ----
>    I've never had very great speeds over a network.  I've gotten the
> impression
> that iSCSI is slower than some other network protocols.
> 
>    Locally (RAID=>RAID) I got about 400-500MB/s, but the best I've
> gotten, recently, over a 10Gb network card has been about 200MB/s.
> Oddly, when I first got the cards, I was getting up to 400-600MB/s, but
> after MS started pushing
> Win10 and "updates" to Win7 (my communication has been between
> Win7SP1<->linux server), my speed dropped to barely over 100MB/s which
> is about what I got with
> a 1Gb card.  I wasn't able to get any better speeds using *windows*
> single-threaded SMB proto even using 2x10Gb (have a dedicated link tween
> workstation and server) -- but I did notice the cpu maxing out on either the
> windows or the Samba side depending on packet size and who was doing the
> sending.
> 
>    50MB sounds awfully slow, but not out of the ballpark -- I had
> benched a few
> NAS solutions @ home, but could rarely get about 10MB/s (usually
> slower), so gave up on those and went w/a linux server -- but still alot
> slower than I'd
> like (100-200MB/s sustained, but those figures may change w/the next MS
> "update").  But gave up on commercial, out-of-the-box solutions, and the
> 4x1Gb
> connect you have may be costing you more cpu than its worth... Problem I
> noted
> on 2x10G was too many duplicate packets -- so running 1x10Gb now but
> still maxing out around 200MB/s over an unencrypted SMB/CIFS session.
> 
>    I'm not sure it could be an LVM problem given its local speed for
> pvmoves --
> do you have some measurement of faster file I/O throughput using iSCSI
> over your
> connections?
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
