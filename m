Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7BH4mV22640
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 13:04:48 -0400
Received: from gateway.kindergarten (ppp-06.au1.fn.td-fn.de [217.24.197.6])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7BH4bRX019353
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 13:04:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by gateway.kindergarten (Postfix) with ESMTP id 37B404301
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 17:06:37 +0000 (UTC)
Received: from gateway.kindergarten ([127.0.0.1])
	by localhost (gateway [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 05608-01 for <linux-lvm@redhat.com>;
	Thu, 11 Aug 2005 17:06:24 +0000 (UTC)
Received: from huepfburg.kindergarten (imap.huepfburg.kindergarten
	[172.16.74.101])
	by gateway.kindergarten (Postfix) with ESMTP id E0CDC423D
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by huepfburg.kindergarten (Postfix) with ESMTP id A235236707
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 19:06:20 +0200 (CEST)
Received: from huepfburg.kindergarten ([127.0.0.1])
	by localhost (huepfburg [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 09826-05 for <linux-lvm@redhat.com>;
	Thu, 11 Aug 2005 19:06:19 +0200 (CEST)
Received: from seifenkiste.kindergarten (seifenkiste.kindergarten
	[172.16.74.100])
	by huepfburg.kindergarten (Postfix) with ESMTP id 6A27B32DD6
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 19:06:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by seifenkiste.kindergarten (Postfix) with ESMTP id D8E5D3127E
	for <linux-lvm@redhat.com>; Thu, 11 Aug 2005 19:06:15 +0200 (CEST)
From: Dirk Jakobsmeier <dirk.jakobsmeier@web.de>
Date: Thu, 11 Aug 2005 19:06:10 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200508111906.11974.dirk.jakobsmeier@web.de>
Subject: [linux-lvm] ghostlike error on logical volume on raid1
Reply-To: dirk.jakobsmeier@web.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello 

i have a really "nice" problem with my logical volume on an really small raid1 
(only about 4G).

I use a kernel.org kernel 2.6.12 on a SuSE 9.2. 

  LVM version:     2.00.25 (2004-09-29)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.4.0
  reiser 3.6.18

and here is whats wondering me.

If i'm taring a larger archiv on a non lvm filesystem (linux sources) 
everythink works really smooth. Tar archiv is about 280 mb. After that i'm 
moving it to the lvm located filesystem (this is exported via nfs), logging 
into a client, untaring works perfect.

md5sum ist always:

host: md5sum linux-2.6.12.tar
8145881b9d63dcc10419eb69137d6641  linux-2.6.12.tar
host: md5sum linux-2.6.12.tar
8145881b9d63dcc10419eb69137d6641  linux-2.6.12.tar

That's fine. But now !!!

Taring the same source directly to the lvm located filesystem

host: md5sum linux-2.6.12.tar
f9bfdc9ad446adf9db9e54d80723bd9c  linux-2.6.12.tar
host: md5sum linux-2.6.12.tar
58b2e962e9b7c8739d61ff033cd85130  linux-2.6.12.tar
host: md5sum linux-2.6.12.tar
6442fbabecfbbeba7c91c578c95df7c3  linux-2.6.12.tar

For sure it's allways the same tar archiv. Untaring is not possible anymore. I 
got errors, tar archiv is broken. Doing it using a smaller source (5 mb) 
everythink is ok.

Has anyone got those problems too?

Any hints are appreciated.

Dirk
-- 
