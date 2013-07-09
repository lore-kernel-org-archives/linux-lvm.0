Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r691b2PA021958
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 21:37:02 -0400
Received: from mail-qe0-f53.google.com (mail-qe0-f53.google.com
	[209.85.128.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r691b1bj016422
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 21:37:02 -0400
Received: by mail-qe0-f53.google.com with SMTP id 1so2726733qee.12
	for <linux-lvm@redhat.com>; Mon, 08 Jul 2013 18:37:01 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 9 Jul 2013 06:37:01 +0500
Message-ID: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
From: Micky <mickylmartin@gmail.com>
Subject: [linux-lvm] Very slow i/o after snapshotting
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On a machine, where weekly snapshots are created for dumping raw data,
the overall disk i/o has drastically degraded to few megabytes per
second. It is quite random and so slow that commands freeze often.

I was using chunk size of 512K and same byte size with dd.

Is it quite common; I read that such freezes require a reboot. Is
there a way to avert?
What am I missing here?
