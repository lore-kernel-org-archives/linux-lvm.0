Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D67DA5DA2A
	for <linux-lvm@redhat.com>; Sun,  7 Jan 2018 01:04:11 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 631A487622
	for <linux-lvm@redhat.com>; Sun,  7 Jan 2018 01:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id BF6CF434
	for <linux-lvm@redhat.com>; Sun,  7 Jan 2018 02:04:07 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id lCfZwqB4eNOM for <linux-lvm@redhat.com>;
	Sun,  7 Jan 2018 02:04:07 +0100 (CET)
Received: from [IPv6:2003:f6:ebca:8b00:c1ef:17c1:adea:d6ce]
	(p200300F6EBCA8B00C1EF17C1ADEAD6CE.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebca:8b00:c1ef:17c1:adea:d6ce])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 786A4428
	for <linux-lvm@redhat.com>; Sun,  7 Jan 2018 02:04:07 +0100 (CET)
From: Oliver Rath <rath@mglug.de>
Message-ID: <e12eff82-677c-7e91-1697-eb955d1227b7@mglug.de>
Date: Sun, 7 Jan 2018 02:04:06 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] new max tag length?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi List,

Ive read here, the max length of a tag is 128:
https://www.suse.com/documentation/sles11/stor_admin/data/lvmtagging.html

But the following command works fine:

sudo lvchange --addtag `printf 'z%.0s' {1..66666}` levg/t8

What is actual the max length? When was the change?

Tfh!

Oliver
