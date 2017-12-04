Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2FAF5C8B7
	for <linux-lvm@redhat.com>; Mon,  4 Dec 2017 04:31:00 +0000 (UTC)
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64BA14E90D
	for <linux-lvm@redhat.com>; Mon,  4 Dec 2017 04:30:59 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id l2so11604126uak.2
	for <linux-lvm@redhat.com>; Sun, 03 Dec 2017 20:30:59 -0800 (PST)
MIME-Version: 1.0
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Mon, 4 Dec 2017 12:30:58 +0800
Message-ID: <CAAYit8RUbKP9ntgsDZTjMeSNBLz55Ms3pVY22i9EhfZWncPP7A@mail.gmail.com>
Subject: [linux-lvm] Why LVM doesn't send the dm-thin delete message
 immediately after volume creation failure
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

Hi All,

I'm not sure if it is a bug or an intention. If there's error in
volume creation, the function _lv_create_an_lv() invokes lv_remove()
to delete the newly created volume. However, in the case of creating
thin volumes, it just queues a "delete" message without sending it
immediately. The pending message won't be process until the next
lvcreate.

Why not send it before the end of _lv_create_an_lv(), to ensure the
synchronization between LVM and kernel? (i.e., no dangling volume in
kernel metadata, and the transaction ID is also synced)


Thanks,
Ming-Hung Tsai
