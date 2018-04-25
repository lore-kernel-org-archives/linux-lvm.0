Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 932E11001643
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2018 06:32:05 +0000 (UTC)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E56A04E918
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2018 06:31:54 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id g7-v6so14881718otj.11
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2018 23:31:54 -0700 (PDT)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 25 Apr 2018 14:31:53 +0800
Message-ID: <CABZYMH6KQhrnONfFxO0ky0O=nFHzJqP1ibLaOy-vxQ_yNkqfNg@mail.gmail.com>
Subject: [linux-lvm] [lvmlockd] Reload configuration while lvmlockd and
	sanlock running
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

Hi all,

I want to change host id of one host, or open debug log of sanlock
online and make it take effect.

afaik we can't restart lvmlockd or sanlock without side effects -- all
locks must be released before sanlock shutdown, and if wdmd enabled,
the host maybe reboot after a while...

So if there any way to reload configuration of sanlock and lvmlockd? I
don't want to reboot my host...

Thanks

Damon
