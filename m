Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5242A0BB8
	for <linux-lvm@redhat.com>; Mon,  6 Aug 2018 11:19:33 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B63D30820E3
	for <linux-lvm@redhat.com>; Mon,  6 Aug 2018 11:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id B26157E
	for <linux-lvm@redhat.com>; Mon,  6 Aug 2018 13:19:29 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id jWoVJADVQ2aq for <linux-lvm@redhat.com>;
	Mon,  6 Aug 2018 13:19:29 +0200 (CEST)
Received: from [IPv6:2003:f6:ebc2:e00:f695:ba5:821c:875e]
	(p200300F6EBC20E00F6950BA5821C875E.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebc2:e00:f695:ba5:821c:875e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 336E57C
	for <linux-lvm@redhat.com>; Mon,  6 Aug 2018 13:19:29 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <29f10007-e2f4-bb56-b9a6-4957150fba6b@mglug.de>
Date: Mon, 6 Aug 2018 13:19:28 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] Version 2.02.179 & 180 & 181 etc. not in git log?
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

Hi list,

in the git tags i see the tags 2.02.179 and 2.02.180 etc. also the
tar.gz-files for these versions are listed. But I dont find any
changelogs (WHATS_NEW, WHATS_NEW_DM)

Is there a changelog for these versions?

Regards,
Oliver
