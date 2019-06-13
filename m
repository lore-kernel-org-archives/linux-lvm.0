Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B44C71001B28
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 16:06:00 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AF9681F22
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 16:05:24 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 0E058404F0
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 19:05:20 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 8525Iiguc494 for <linux-lvm@redhat.com>;
	Thu, 13 Jun 2019 19:05:18 +0300 (MSK)
Received: from ilia (89-178-216-202.broadband.corbina.ru [89.178.216.202])
	by mail.service4.ru (Postfix) with ESMTPSA id 037CC401C6
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 19:05:17 +0300 (MSK)
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <5d0599c5-699c-7c35-8847-3c4787e3e245@izyk.ru>
Date: Thu, 13 Jun 2019 19:05:14 +0300
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Maximum address used by a virtual disk on a thin pool.
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

Hello.
Tell me please, how can I get the maximum address used by a virtual disk
(disk created with -V VirtualSize). I have several large virtual disks,
but they use only a small part at the beginning of the disk. For example:

# lvs
  LV         VG  Attr       LSize   Pool     Origin Data%
  mylvm      CVG Vwi-aot--- 100,00g fastheap        7,13


Please advise me how to determine from which address the virtual disk
did not allocate real disk space? And all the data read from addresses
greater than this address will be exactly zeros. Or maybe, how can I get
map of the used chunks of disk?

Thanks.

----
