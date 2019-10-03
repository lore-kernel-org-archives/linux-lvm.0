Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7379660468
	for <linux-lvm@redhat.com>; Thu,  3 Oct 2019 12:04:41 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E41378830B
	for <linux-lvm@redhat.com>; Thu,  3 Oct 2019 12:04:39 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id v2so4797251iob.10
	for <linux-lvm@redhat.com>; Thu, 03 Oct 2019 05:04:39 -0700 (PDT)
MIME-Version: 1.0
From: Sam Lunt <samueljlunt@gmail.com>
Date: Thu, 3 Oct 2019 07:04:27 -0500
Message-ID: <CAGn10uWp0_zE9buzNsod9QjR9HnCFaaFCweL9WMUzhJq9wQmMQ@mail.gmail.com>
Subject: [linux-lvm] Delayed startup
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

Hello,

I recently removed a cache pool LV (but kept the linked origin LV).
Since doing that, I've been seeing delays at startup due to pvscan.
For each physical device, I'm seeing a warning:

pvscan[431] WARNING: lvmetad is being updated, retrying (setup) for 10
more seconds.

It seems like this is an issue with some traces of the cache LV still
persisting, but I'm not sure. Is there a way I can fix this?

I'm running Arch Linux, kernel 5.3.1, lvm 2.02.186-2

Thanks,
Sam
