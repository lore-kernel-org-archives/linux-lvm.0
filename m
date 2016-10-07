Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u976hZUc007278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 7 Oct 2016 02:43:35 -0400
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30C181CCA8C
	for <linux-lvm@redhat.com>; Fri,  7 Oct 2016 06:43:33 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id g49so1097401qtc.2
	for <linux-lvm@redhat.com>; Thu, 06 Oct 2016 23:43:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Fri, 7 Oct 2016 07:43:11 +0100
Message-ID: <CAE-HYsMGnYJ1FDohYcH3fszWb47iYzJtRGZJXJjLmajjyc-npw@mail.gmail.com>
Subject: Re: [linux-lvm] LVM RAID5 out-of-sync recovery
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

Slava, the main problem I had was that LVM forbade many operations
while I had a PV missing.

In your case, apparently, all PVs are present. So I suggest the following:

1. examine the recent history in /etc/lvm/archive
2. diff each transition and see if you can understand what has
happened at each stage
3. vgcfgrestore the most recent version that you think will allow you
to activate your array, you can work backwards incrementally
4. check kernel logs!
5. scrub (resync) the array if needed

Hope this helps,
Giuliano.
