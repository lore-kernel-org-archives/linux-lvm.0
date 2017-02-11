Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1B98nrj016926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2017 04:08:49 -0500
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC940C0567A3
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2017 09:08:47 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id E7886ADE0A9E
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2017 09:59:05 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id ZWKwjtCVtpk9 for <linux-lvm@redhat.com>;
	Sat, 11 Feb 2017 09:59:04 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 33061ADE0B15
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2017 09:59:04 +0100 (CET)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id zuFGRe3n2q84 for <linux-lvm@redhat.com>;
	Sat, 11 Feb 2017 09:59:03 +0100 (CET)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [82.211.30.250])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id D1D44ADE0A9E
	for <linux-lvm@redhat.com>; Sat, 11 Feb 2017 09:59:03 +0100 (CET)
Date: Sat, 11 Feb 2017 09:59:02 +0100 (CET)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove speed
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

Hi all

I'm doing pvmove of some rather large volumes from a Dell Equallogic system to Dell Compellent. Both are connected on iSCSI to vmware and the guest OS seems to do this well, but it's slow. I get around 50MB/s at most, even though the Equallogic is connected at 4x1Gbps and the Compellent is on 10Gbps. Without multipath, this should give me 100MB/s or so, but then, I get half of that. Interestingly, the "utilisation" reported by munin shows me a 100% in total of the two devices compared, as in https://karlsbakk.net/tmp/pvmove-dev-util.png

Any idea why this utilisation is so high, and what I can do to speed this thing up? I'm at a 14 days mark to move these 40TiB or so, and I'd like to reduce it if possible. The backend is obviously not a problem here.

Vennlig hilsen / Best regards

roy
--
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Da mihi sis bubulae frustrum assae, solana tuberosa in modo Gallico fricta, ac quassum lactatum coagulatum crassum. Quod me nutrit me destruit.
