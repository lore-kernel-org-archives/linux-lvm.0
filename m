Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AC31619AF
	for <linux-lvm@redhat.com>; Thu, 21 Dec 2017 04:13:40 +0000 (UTC)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A78D2C977D
	for <linux-lvm@redhat.com>; Thu, 21 Dec 2017 04:13:39 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id o73so2470872vkd.2
	for <linux-lvm@redhat.com>; Wed, 20 Dec 2017 20:13:39 -0800 (PST)
MIME-Version: 1.0
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Thu, 21 Dec 2017 12:13:38 +0800
Message-ID: <CAAYit8R_xCvhiZQo81FxJzoXkc1q7T6iBTH0C61MrLwZOb2ZwA@mail.gmail.com>
Subject: [linux-lvm] LVM doesn't resume the origin if it failed to take a
	dm-thin snapshot
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

The function lv_create_an_lv() returns immediately if the callee
suspend_lv_origin() was failed, thus the origin remains suspended in
the end. It's possible to happen when we are taking snapshot while the
pool is in READ_ONLY mode (i.e., metadata needs_check flag was set).

Why it doesn't resume the origin no matter suspend_lv_origin() was
failed or not, like update_pool_lv(), so that users don't need to do
manual inversion?


Thanks,
Ming-Hung Tsai
