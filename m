Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9OFKkjV001861
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 11:20:46 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9OFKiku010340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 11:20:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 0F2CD200598
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 17:20:44 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id OBojvPBxqq7a for <linux-lvm@redhat.com>;
	Fri, 24 Oct 2014 17:20:43 +0200 (CEST)
Received: from [192.168.178.100] (p50897F65.dip0.t-ipconnect.de
	[80.137.127.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id A6A99200596
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 17:20:43 +0200 (CEST)
Message-ID: <544A6E49.9040200@mglug.de>
Date: Fri, 24 Oct 2014 17:20:41 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <544A5D76.2010800@mglug.de> <20141024141849.GB29345@redhat.com>
In-Reply-To: <20141024141849.GB29345@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] SOLVED [was Re: What todo if metadata grows faster than
	pool data]
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

Hi Mike!

Im using lvim 2.02.110 with kernel 3.16.


Am 24.10.2014 um 16:18 schrieb Mike Snitzer:
> On Fri, Oct 24 2014 at 10:08am -0400,
> You'll want to grow the metadata volume.  Newer versions of the
> dm-thinp kernel code and lvm2 userspace code make this possible.
>
> See the "Manually manage free metadata space of a thin pool LV" section
> of the lvmthin.7 manpage in a recent lvm2 release.

Hour hint to the tmvthin-manpage was right:

lvextend -L+96M dmivg/winthinpool_tmeta

worked!

Now Metadata is safe:

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
  Allocated pool data    50,85%
  Allocated metadata     45,91%
  Current LE             238080
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:18


Tfh!

Oliver
