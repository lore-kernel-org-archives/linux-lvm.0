Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i698xH006518
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2004 04:59:17 -0400
Received: from mail.smartlink.ee (mail.smartlink.ee [213.180.16.242])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i698xFe1017052
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2004 04:59:15 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.smartlink.ee (Postfix) with ESMTP id 800D5AF50A
	for <linux-lvm@redhat.com>; Fri,  9 Jul 2004 11:59:14 +0300 (EEST)
Received: from mail.smartlink.ee ([127.0.0.1])
	by localhost (pontu.smartlink [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09760-02 for <linux-lvm@redhat.com>;
	Fri,  9 Jul 2004 11:59:14 +0300 (EEST)
Received: from smartlink.ee (castor.smartlink [192.168.2.57])
	by mail.smartlink.ee (Postfix) with ESMTP id 448CAAF506
	for <linux-lvm@redhat.com>; Fri,  9 Jul 2004 11:59:14 +0300 (EEST)
Message-ID: <40EE5E61.5070702@smartlink.ee>
Date: Fri, 09 Jul 2004 11:59:13 +0300
From: Tarmo Samuel <sam@smartlink.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan eating memory
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


Hello,

after upgrading to Slackware 10.0, I ran into a problem with LVM2.

system: Slackware Linux 10.0
kernel: 2.6.7-mm5
Official slackware packages:
device-mapper-1.00.17
lvm2-2.00.15

Problem: lvm vgscan runs, eats up more and more memory until it gets 
OOM-killed.


When run, it says:

  Reading all physical volumes.  This may take a while...
  Ignoring additional label on /dev/hda11 at sector 1

and keeps on munching the disk.

(/dev/hda11 is a LVM partition)

I'm not sure how to debug it. strace shows n * 
(read,ioctl(BLKBSZGET),_llseek) and a few brk's occasionally..... No 
errors get logged or displayed, except the fishy notice about additional 
label.

When I use the OLD lvm2 binary (2.00.08), it works just fine (was 
running the same kernel and same version of device-mapper before, too).

Neither of the lvm packages have any patches applied to them. 
Slackware's package is ./configured with --enable-static_link and 
--with-lvm1=internal. My old package was configured with --with-lvm1=shared.

Any hints would be welcome.


--
Tarmo Samuel
