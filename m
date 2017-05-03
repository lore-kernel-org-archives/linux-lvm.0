Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFA21BD86D
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 09:30:42 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC8AA80469
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 09:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 883FB413
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 11:24:35 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id y6zmO4mYx8UL for <linux-lvm@redhat.com>;
	Wed,  3 May 2017 11:24:35 +0200 (CEST)
Received: from [192.168.178.39] (p50802C7F.dip0.t-ipconnect.de [80.128.44.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 4E48C412
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 11:24:35 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <1387599a-efe3-05ec-d290-697641612d15@mglug.de>
Date: Wed, 3 May 2017 11:24:34 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Configuration of stripes in lvm.conf?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi list,

It seems, that --stripesize is configurable in lvm.conf, but not
--stripes. Is stripes automatically set in conjunction of the number of
PVs in a VG?

Tfh!
Oliver
