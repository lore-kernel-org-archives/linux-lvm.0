Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A682F5C73D
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2018 04:52:57 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F956C057FA6
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2018 04:52:56 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id n96-v6so9752498lfi.1
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2018 21:52:55 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
In-Reply-To: <23387.29464.233937.89557@quad.stoffel.home>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
From: Chris Murphy <lists@colorremedies.com>
Date: Mon, 30 Jul 2018 22:52:53 -0600
Message-ID: <CAJCQCtSmBF68LbvCF=qNT5hePaYFOcF7=jB8=MERXBvA-FUMhQ@mail.gmail.com>
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>

On Fri, Jul 27, 2018 at 1:31 PM, John Stoffel <john@stoffel.org> wrote:

>
> Why don't you run quotas on your filesystems?  Also, none of the
> filesystems in Linux land that I'm aware of supports shrinking the
> filesystem while live, it's all a unmount, shrink FS, shrink volume
> (carefully!) and then re-mount the filesystem.

Btrfs supports grow and shrink resizes only when mounted. It's not
possible to resize when unmounted.



-- 
Chris Murphy
