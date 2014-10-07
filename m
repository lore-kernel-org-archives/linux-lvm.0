Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s97L869P030957
	for <linux-lvm@redhat.com>; Tue, 7 Oct 2014 17:08:07 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s97L7wv5009842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 7 Oct 2014 17:08:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 1126820049F
	for <linux-lvm@redhat.com>; Tue,  7 Oct 2014 23:07:57 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id PuSfGvN9BmiQ for <linux-lvm@redhat.com>;
	Tue,  7 Oct 2014 23:07:56 +0200 (CEST)
Received: from [192.168.200.131] (host-62-245-233-61.customer.m-online.net
	[62.245.233.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id AB2E120042E
	for <linux-lvm@redhat.com>; Tue,  7 Oct 2014 23:07:56 +0200 (CEST)
Message-ID: <5434562C.6020307@mglug.de>
Date: Tue, 07 Oct 2014 23:07:56 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 low space handling
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

how can I get some email, if a thin pool runs full? On my syslog i found
the following messages:


Oct  7 21:29:25 dmicn20 kernel: [1115276.145019] device-mapper: thin:
252:13: reached low water mark for metadata device: sending event.
Oct  7 21:29:33 dmicn20 kernel: [1115284.693816] device-mapper: thin:
252:13: reached low water mark for metadata device: sending event.
Oct  7 21:29:35 dmicn20 kernel: [1115286.086837] device-mapper: thin:
252:13: reached low water mark for metadata device: sending event.
Oct  7 21:29:36 dmicn20 kernel: [1115287.369534] device-mapper: thin:
252:13: reached low water mark for metadata device: sending event.
Oct  7 21:29:55 dmicn20 kernel: [1115306.290745] device-mapper: thin:
252:13: reached low water mark for metadata device: sending event.
...

How can i find these messages?

Tfh!
Oliver
