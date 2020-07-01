Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F99F89FA
	for <linux-lvm@redhat.com>; Wed,  1 Jul 2020 08:32:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6C6E185A797
	for <linux-lvm@redhat.com>; Wed,  1 Jul 2020 08:32:40 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id dr13so23639880ejc.3
	for <linux-lvm@redhat.com>; Wed, 01 Jul 2020 01:32:38 -0700 (PDT)
MIME-Version: 1.0
From: lampahome <pahome.chen@mirlab.org>
Date: Wed, 1 Jul 2020 16:32:23 +0800
Message-ID: <CAB3eZfsxij7_huVyEZO5D2BVX3C+E-3WpmNQVe5unw4io8TUXA@mail.gmail.com>
Subject: [linux-lvm] Difference between thin_ll_xxx & thin_xxx
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

I'm a new to lvm and confused about as titled.

What's the difference between
thin_ll_restore & thin_restore
thin_ll_dump & thin_dump?

Thanks
