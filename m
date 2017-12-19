Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EB5B5D6A3
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2017 09:37:14 +0000 (UTC)
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AB15C119CA7
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2017 09:37:13 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id a16so23409338qtj.3
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2017 01:37:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218174915.snuf5ctm4ud5naye@reti>
References: <CAM2wQBvP-h9GSTYLk_69rYVL=WEsPyvL0KsH+gqBBPJ_10J75A@mail.gmail.com>
	<20171218174915.snuf5ctm4ud5naye@reti>
From: Thanos Makatos <thanos.makatos@onapp.com>
Date: Tue, 19 Dec 2017 09:36:51 +0000
Message-ID: <CAM2wQBvZUWocdwEfpO8F7+OdZEOzA8gWSb6YjBgZYFu7MR-0Ww@mail.gmail.com>
Subject: Re: [linux-lvm] lvm filter regex format
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> Out of interest why are you using the length of the device name as a discriminator?

In my case I am the one who creates these devices so I fully control
the naming scheme, however there are other components in our product
that might create device mapper targets and I shouldn't filter them
out.
