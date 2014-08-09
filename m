Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7ALRPbD002365
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2014 17:27:25 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7ALRMmr025362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2014 17:27:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 3C3E9200437
	for <linux-lvm@redhat.com>; Sun, 10 Aug 2014 23:27:21 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id MlRSu4vjgyXB for <linux-lvm@redhat.com>;
	Sun, 10 Aug 2014 23:27:21 +0200 (CEST)
Received: from [192.168.200.131] (host-62-245-233-61.customer.m-online.net
	[62.245.233.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 6FE62200436
	for <linux-lvm@redhat.com>; Sat,  9 Aug 2014 19:25:28 +0200 (CEST)
Message-ID: <53E65987.8010605@mglug.de>
Date: Sat, 09 Aug 2014 19:25:27 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what todo with broken cachedev?
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

Hi list,

assuming a cached device mylv from /dev/sda1 with cachepool from
/dev/sdb1 (ssd i.e.):

If now the ssd crashes and the cachemode is "writethrough" i think,
there is no data loss for my lv's, right?

But then mylv runs without a cache device although the device is set in
metadata.

The command lvreduce cant remove the cache-attribut. vgreduce *could*
remove it, right? But only if there is no usage bei the cachepool-device
anymore.

Is there a solution for that?

Tfh!
Oliver
