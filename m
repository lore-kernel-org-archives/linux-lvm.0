Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBGMBOqx030812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 16 Dec 2016 17:11:24 -0500
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96EF1C05AA70
	for <linux-lvm@redhat.com>; Fri, 16 Dec 2016 22:11:23 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n68so4095431itn.3
	for <linux-lvm@redhat.com>; Fri, 16 Dec 2016 14:11:23 -0800 (PST)
Received: from node-77b6cg14vzmmdbrp6g9.ipv6.teksavvy.com
	(node-77b6cg14vzmmdbrp6g9.ipv6.teksavvy.com.
	[2607:f2c0:f00f:cd00:124a:7dff:feaa:43e9])
	by smtp.gmail.com with ESMTPSA id l79sm2062404itb.1.2016.12.16.14.11.22
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Dec 2016 14:11:22 -0800 (PST)
Message-ID: <1481926264.487.17.camel@gmail.com>
From: "Brian J. Murrell" <brianjmurrell@gmail.com>
Date: Fri, 16 Dec 2016 17:11:04 -0500
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] device-mapper: thin: 253:2: pool target (4105216
 blocks) too small: expected 492672
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

I have a bit of an urgent/emergency situation here unfortunately. �It
seems I have run into this:

https://www.redhat.com/archives/linux-lvm/2016-May/msg00092.html

again, this time on a centos7 machine.

When this happened last time, in this message

https://www.redhat.com/archives/linux-lvm/2016-June/msg00003.html

 Zdenek Kabelac was able to give me a fixed config that I could
vgcfgrestore to get access to my thin pool back. �Best would be if I
could get an explanation how to get that fixed config. �But if need be
I can provide that 1MB of the disk to be repaired by somebody
else.��I'd really like to learn how to do this myself though, if
somebody would be so kind.

As soon as I send this I will get that 1MB extracted and posted
somewhere in case it's just easier to provide a fixed config rather
than the how-to fix it instructions.

Many many thanks in advance for being able to look at this. �The
machine that suffered this kind of at the center of everything here.

Cheers,
b.
