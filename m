Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26504F5CFD
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2020 15:54:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DF8B8DF888
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2020 15:54:53 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id mb16so17092029ejb.4
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2020 08:54:37 -0700 (PDT)
Received: from [10.100.31.37] ([5.158.153.53])
	by smtp.gmail.com with ESMTPSA id v24sm78258eja.29.2020.06.29.08.54.34
	for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 29 Jun 2020 08:54:35 -0700 (PDT)
From: Bastian Germann <bastiangermann@fishpost.de>
Message-ID: <73805daa-2b10-066a-8da9-2c77361ca787@fishpost.de>
Date: Mon, 29 Jun 2020 17:54:34 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Feature request: support for editline
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

Hi,

LVM2 is distributed under GPLv2 only. The readline library changed its
license long ago to GPLv3. Given that those licenses are incompatible
and you follow the FSF in their interpretation that dynamically linking
creates a derivative work, distributing LVM2 linked against a current
readline version might be legally problematic.

That is why the Debian project still keeps an old readline version
around that they use for LVM2 [1] and some other packages.
For Fedora, I can find a mail thread reporting the same issue [4].

Many projects that cannot or do not want to depend on GPL(v3) code allow
configuring with the BSD licensed editline library instead.

Please consider implementing support for compiling with one of the
editline implementations [2,3] so that people can move to a maintained
library without license headaches.

Regards,
Bastian

[1]: https://tracker.debian.org/media/packages/l/lvm2/control-2.03.07-1
[2]: https://thrysoee.dk/editline/
[3]: https://troglobit.com/projects/editline/
[4]:
https://www.redhat.com/archives/fedora-legal-list/2009-December/msg00007.html
