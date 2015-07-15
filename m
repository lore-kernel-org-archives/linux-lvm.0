Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6FClRus024911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 08:47:27 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (Postfix) with ESMTPS id CDFDE2D4515
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 12:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 845E5201007
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 14:47:23 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id umOolvAWJONU for <linux-lvm@redhat.com>;
	Wed, 15 Jul 2015 14:47:23 +0200 (CEST)
Received: from [192.168.2.122] (ppp-188-174-178-13.dynamic.mnet-online.de
	[188.174.178.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 3B926200F17
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 14:47:23 +0200 (CEST)
Message-ID: <55A6565A.6060307@mglug.de>
Date: Wed, 15 Jul 2015 14:47:22 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Howto get real size of thinpool-snap?
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

if I create a snapshot of a volume in a thinpool, first only metadata
need space. Later, through copy-on-write, the real needed size grows. Is
it possible to get this size?

Tfh!
Oliver
