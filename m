Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E0CE60BE9
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 15:55:45 +0000 (UTC)
Received: from zimbra.karlsbakk.net (unknown [82.211.30.197])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6626C3086267
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 15:55:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 9998F3C0359
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 15:30:17 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id YW1i9ywafgNj for <linux-lvm@redhat.com>;
	Tue, 10 Jul 2018 15:30:15 +0200 (CEST)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id CC5AE3C036C
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 15:30:15 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id x98w-X4OiY1h for <linux-lvm@redhat.com>;
	Tue, 10 Jul 2018 15:30:15 +0200 (CEST)
Received: from zimbra.karlsbakk.net (localhost.localdomain [127.0.0.1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id B521B3C0359
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 15:30:15 +0200 (CEST)
Date: Tue, 10 Jul 2018 15:30:15 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <247479609.632.1531229415513.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Removing/reinstalling lvmcache
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm <linux-lvm@redhat.com>

Hi all

I beleive I've removed the old lvmcache, but attempting to install a new one after a reinstall seems not to work.

# lvs -a
  LV         VG   Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  data       data -wi-ao---- 13,67t
  data_corig data vwi-a-v--- 13,67t
  root       sys  -wi-ao---- 82,45g
  swap       sys  -wi-ao----  3,72g
  swap2      sys  -wi-ao----  8,00g

Can I safely remove data_corig without risking losing my stuff? I don't quite understand how it all fits here…

Vennlig hilsen

roy
--
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
