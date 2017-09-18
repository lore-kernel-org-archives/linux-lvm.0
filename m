Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E947E18A40
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 07:52:10 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18C8080469
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 07:52:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 616A520BA3
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 03:52:08 -0400 (EDT)
Received: from [192.168.1.247] (node-16y1.pool-118-173.dynamic.totbb.net
	[118.173.217.105])
	by mail.messagingengine.com (Postfix) with ESMTPA id 42E9A2473F
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 03:52:06 -0400 (EDT)
From: Tom Hale <tom@hale.ee>
Message-ID: <40cdc28f-ad90-a7b8-9a66-89439111703a@hale.ee>
Date: Mon, 18 Sep 2017 14:52:04 +0700
MIME-Version: 1.0
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvscan: bugs in manpage and implementation
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

MAN PAGE

In http://man7.org/linux/man-pages/man8/pvscan.8.html I see the
following issues:

* The string "-a--activate" appears several times. Should be:
  "-a|--activate"

* "-a|--activate y|n|ay" is mentioned, but later on:
"Only ay is applicable." Please remove "y|n|".

PROGRAM

# pvscan --activate ay
  Command does not accept option: --activate ay.

The message is confusing. It would be better to say "--activate requires
--cache"

In fact, why not drop the "ay" argument all together and just allow
"--cache --activate"?

Cheers,
Tom
