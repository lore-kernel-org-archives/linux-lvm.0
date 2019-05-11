Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E3161948E
	for <linux-lvm@redhat.com>; Sat, 11 May 2019 22:16:06 +0000 (UTC)
Received: from zimbra.karlsbakk.net (zimbra.karlsbakk.net [193.29.58.196])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D2F6307CDF2
	for <linux-lvm@redhat.com>; Sat, 11 May 2019 22:16:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 24EF33C0225
	for <linux-lvm@redhat.com>; Sun, 12 May 2019 00:07:45 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id tbYpS3KBLmjX for <linux-lvm@redhat.com>;
	Sun, 12 May 2019 00:07:43 +0200 (CEST)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id BC8EF3C023D
	for <linux-lvm@redhat.com>; Sun, 12 May 2019 00:07:43 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id XjNrErrQfR4i for <linux-lvm@redhat.com>;
	Sun, 12 May 2019 00:07:43 +0200 (CEST)
Received: from zimbra.karlsbakk.net (localhost.localdomain [127.0.0.1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id A070A3C0225
	for <linux-lvm@redhat.com>; Sun, 12 May 2019 00:07:43 +0200 (CEST)
Date: Sun, 12 May 2019 00:07:43 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <1117624956.13982625.1557612463407.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM and HSM?
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

Hi

With lvmcache and all, is there anything in the works of making an HSM (Hierarchical storage management aka tiered storage) with LVM as with less-used data on slow, spinning rust and more-used data on higher tiers?

Vennlig hilsen

roy
--
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
