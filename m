Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NLp5N0006340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2016 17:51:05 -0400
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 207923F216
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2016 21:51:05 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l132so52177122wmf.1
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2016 14:51:05 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Sat, 24 Sep 2016 00:50:43 +0300
Message-ID: <CACaajQs2YyrKdZXYQ8JuWGmDna_TDUz+d4YwnEjxT3+ELGGOpg@mail.gmail.com>
Subject: [linux-lvm] current status of lvm cache
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
To: linux-lvm <linux-lvm@redhat.com>, dm-devel@redhat.com

Hi! Sometimes ago i'm use bcache for caching random write to ssd.
Also i read about lvm cache and some unsuccessful stories about it performance,
sometimes users don't have any benefits when try to use lvm cache.
So if i use kernel 4.7 - does lvm cache can give me performance boost
when random writing? Does it possible to bypass sequential i/o after
some threshold?
What kernel and lvm versions preferred to use to get maximum
performance in lvm cache?

Thanks!

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
