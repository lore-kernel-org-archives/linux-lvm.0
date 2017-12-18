Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B97EF69287
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 17:16:36 +0000 (UTC)
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA23B4A706
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 17:16:35 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x7so1811890qkb.0
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 09:16:35 -0800 (PST)
MIME-Version: 1.0
From: Thanos Makatos <thanos.makatos@onapp.com>
Date: Mon, 18 Dec 2017 17:16:14 +0000
Message-ID: <CAM2wQBvP-h9GSTYLk_69rYVL=WEsPyvL0KsH+gqBBPJ_10J75A@mail.gmail.com>
Subject: [linux-lvm] lvm filter regex format
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

I'm trying to be very specific in the global_filter of lvm.conf and
ignore devices under /dev/mapper of the format
'^/dev/mapper/[a-z0-9]{14}$', however the repetition count '{14}' does
not seem to be honored?

Currently I have to repeat '[a-z0-9]' fourteen times, which works but
it's a bit ugly.

Does the filter use some standarized regex format?

-- 
Thanos Makatos
