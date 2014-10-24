Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9OE90rb000506
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 10:09:00 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9OE8wBI026316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 10:08:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id DC274200598
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 16:08:56 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Ph4ne2LXZCRx for <linux-lvm@redhat.com>;
	Fri, 24 Oct 2014 16:08:56 +0200 (CEST)
Received: from [192.168.178.100] (p50897F65.dip0.t-ipconnect.de
	[80.137.127.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 8826F200596
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 16:08:56 +0200 (CEST)
Message-ID: <544A5D76.2010800@mglug.de>
Date: Fri, 24 Oct 2014 16:08:54 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] What todo if metadata grows faster than pool data
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

in my thinpool-volume the used data is now 50% but the used metadata
size is 82%. What happens, if the metadata a running full, bevor data is
full? Do I have to modify metadata size explicitly or does lvm this
automaticly? How can I do this?

At the moment 78 volumes or snaps had been created from this
winthinpool, mostly with size about 100GB.

Tfh,
OIiver 

--- Logical volume ---
  LV Name                winthinpool
  VG Name                dmivg
  LV UUID                gDGkhM-jGQq-hSuZ-g4CZ-JtcQ-JcdX-DqD7bi
  LV Write Access        read/write
  LV Creation host, time dmicn20, 2014-10-07 23:54:45 +0200
  LV Pool metadata       winthinpool_tmeta
  LV Pool data           winthinpool_tdata
  LV Status              available
  # open                 73
  LV Size                930,00 GiB
  Allocated pool data    50,73%
  Allocated metadata     82,61%
  Current LE             238080
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:18
