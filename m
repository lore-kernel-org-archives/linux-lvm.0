Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1CC85C1A1
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2018 01:04:28 +0000 (UTC)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EE6B80463
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2018 01:04:17 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id q71-v6so13055093oic.6
	for <linux-lvm@redhat.com>; Sun, 15 Apr 2018 18:04:17 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
From: Chris Murphy <lists@colorremedies.com>
Date: Sun, 15 Apr 2018 19:04:15 -0600
Message-ID: <CAJCQCtQ3r16BYYtrx9rVYauh7JeAp9omWidS4zzwxqvhU1bh+g@mail.gmail.com>
Subject: [linux-lvm] Add udev-md-raid-safe-timeouts.rules
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
To: Btrfs BTRFS <linux-btrfs@vger.kernel.org>, linux-lvm@redhat.com, Linux-RAID <linux-raid@vger.kernel.org>

I just ran into this:
https://github.com/neilbrown/mdadm/pull/32/commits/af1ddca7d5311dfc9ed60a5eb6497db1296f1bec

This solution is inadequate, can it be made more generic? This isn't
an md specific problem, it affects Btrfs and LVM as well. And in fact
raid0, and even none raid setups.

There is no good reason to prevent deep recovery, which is what
happens with the default command timer of 30 seconds, with this class
of drive. Basically that value is going to cause data loss for the
single device and also raid0 case, where the reset happens before deep
recovery has a chance. And even if deep recovery fails to return user
data, what we need to see is the proper error message: read error UNC,
rather than a link reset message which just obfuscates the problem.


-- 
Chris Murphy
