Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C8218BA7
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2017 07:51:38 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 561E1C014174
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2017 07:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 41713421
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2017 09:44:29 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id FUeiA9mPZ6xR for <linux-lvm@redhat.com>;
	Sun, 13 Aug 2017 09:44:29 +0200 (CEST)
Received: from [192.168.178.44] (p5080271A.dip0.t-ipconnect.de [80.128.39.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id E6020407
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2017 09:44:28 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <4b4d346e-9ace-9091-f24e-c9342ed68ad5@mglug.de>
Date: Sun, 13 Aug 2017 09:44:28 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] logical "and" connection of lvm-tags?
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

Hi list,

Im playing around with lvm-Tags and would find it quite useful for
sorting lvms.

Now I tried the following

root@w541:~# lvchange --addtag @foo levg/t1
  Logical volume levg/t1 changed.
root@w541:~# lvchange --addtag @foo levg/t3
  Logical volume levg/t3 changed.
root@w541:~# lvchange --addtag @bar levg/t2
  Logical volume levg/t2 changed.
root@w541:~# lvchange --addtag @bar levg/t3
  Logical volume levg/t3 changed.
root@w541:~# lvs -o lv_name @foo
  LV 
  t1 
  t3 
root@w541:~# lvs -o lv_name @bar
  LV 
  t2 
  t3 
root@w541:~# lvs -o lv_name @foo @bar
  LV 
  t1 
  t2 
  t3 
root@w541:~# lvs -o lv_name @foo \& @bar
  LV 
  t1 
  t2 
  t3 
root@w541:~# lvs -o lv_name @foo and @bar
  LV 
  t1 
  t2 
  t3 

You see, i want to list all lvms which have @foo *and* @bar tags
included. Is this possible? I didnt found anything about combining in
the man pages.

Tfh!

Oliver
