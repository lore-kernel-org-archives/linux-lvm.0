Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p87K386R027235
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2011 16:03:08 -0400
Received: from smtpout.ngs.ru (smtpout7.ngs.ru [195.93.186.213])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p87K32sF032687
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2011 16:03:03 -0400
Received: from [192.168.3.11] (unknown [192.168.3.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: aptem@ngs.ru)
	by mail.ngs.ru (smtp) with ESMTP id 12A66DB234A9D
	for <linux-lvm@redhat.com>; Thu,  8 Sep 2011 03:03:01 +0700 (NOVST)
Message-ID: <4E67CD5A.8050503@ngs.ru>
Date: Thu, 08 Sep 2011 03:00:26 +0700
From: Bokhan Artem <aptem@ngs.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm raid1 questions
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello.

I have two questions about raid1 created with lvm.

- Is it possbile to check consistency of raid1 created with lvm?
- Is it possible to fix unreadable (bad) block from healthly disk in 
raid1 configuration?
