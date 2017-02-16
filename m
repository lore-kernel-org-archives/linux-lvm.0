Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C107B5DD6B
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2017 18:32:12 +0000 (UTC)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32A8E7E9F8
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2017 18:32:11 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 97353ADE0A74
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2017 19:22:57 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id hQxn-g1KqWdj for <linux-lvm@redhat.com>;
	Thu, 16 Feb 2017 19:22:55 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 2685EADE0B3D
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2017 19:22:55 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id zrw51WF4v_j2 for <linux-lvm@redhat.com>;
	Thu, 16 Feb 2017 19:22:55 +0100 (CET)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id F08EFADE0A74
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2017 19:22:54 +0100 (CET)
Date: Thu, 16 Feb 2017 19:22:53 +0100 (CET)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
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

> I'm doing pvmove of some rather large volumes from a Dell Equallogic system to
> Dell Compellent. Both are connected on iSCSI to vmware and the guest OS seems
> to do this well, but it's slow. I get around 50MB/s at most, even though the
> Equallogic is connected at 4x1Gbps and the Compellent is on 10Gbps. Without
> multipath, this should give me 100MB/s or so, but then, I get half of that.
> Interestingly, the "utilisation" reported by munin shows me a 100% in total of
> the two devices compared, as in https://karlsbakk.net/tmp/pvmove-dev-util.png
> 
> Any idea why this utilisation is so high, and what I can do to speed this thing
> up? I'm at a 14 days mark to move these 40TiB or so, and I'd like to reduce it
> if possible. The backend is obviously not a problem here.

Anyone with an idea on this? I just don't think it makes sense...

Vennlig hilsen / Best regards

roy
--
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Da mihi sis bubulae frustrum assae, solana tuberosa in modo Gallico fricta, ac quassum lactatum coagulatum crassum. Quod me nutrit me destruit.
