Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE2E5600C0
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 10:58:19 +0000 (UTC)
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0E058765C
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 10:58:18 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id c82so2997772vkd.4
	for <linux-lvm@redhat.com>; Fri, 08 Sep 2017 03:58:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <603bba5b-4351-aebb-e80c-5aeade6cf883@gmail.com>
References: <38537c05-ba92-9817-a791-19ac39b9615f@yahoo.co.uk>
	<2feba733-6812-3c1f-d42a-3e5eea82a636@redhat.com>
	<b1e00533-bfa7-fbe0-963d-73854fd0a47e@yahoo.co.uk>
	<35db61ea-5cfd-b332-b229-9a478f1264ef@redhat.com>
	<0c496205-22f6-b01a-183b-dc8995782905@yahoo.co.uk>
	<603bba5b-4351-aebb-e80c-5aeade6cf883@gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Fri, 8 Sep 2017 18:58:17 +0800
Message-ID: <CAAYit8T-mvo28Xqfee-w+BhwNrqOdzAX-QXWEToA9nEWyO8xTw@mail.gmail.com>
Subject: Re: [linux-lvm] lv raid - how to read this?
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

2017-09-08 17:38 GMT+08:00 Zdenek Kabelac <zdenek.kabelac@gmail.com>:
> Reminds me -  kernels  4.1 ... 4.5 were 'md-raid' useless... I'd highly
> recommend to avoid using these version with md  (though I've no idea if
> raid0 was affected)
>
> Regards
> Zdenek

Excuses me, does that mean kernel md-raid module in kernel 4.1~4.5 are
unstable or unsuitable for linux-md? Is there any reference threads?


Thanks,
Ming-Hung Tsai
