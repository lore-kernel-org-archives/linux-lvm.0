Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45EF35D75D
	for <linux-lvm@redhat.com>; Wed, 24 Oct 2018 06:36:18 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7ACB7CA1DB
	for <linux-lvm@redhat.com>; Wed, 24 Oct 2018 06:36:17 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id l25-v6so1847851lja.9
	for <linux-lvm@redhat.com>; Tue, 23 Oct 2018 23:36:17 -0700 (PDT)
MIME-Version: 1.0
From: Liwei <xieliwei@gmail.com>
Date: Wed, 24 Oct 2018 14:36:04 +0800
Message-ID: <CAPE0SYz1YErdNSn0_3MHmyoVXdOr90n1M-nJZ4_TwfzsULzQOg@mail.gmail.com>
Subject: [linux-lvm] Detaching a failed cache pool
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

Hi list,
    I have an LV with a corrupted cache. Looking at the cmeta using
cache_dump, I get this:

<superblock uuid="" block_size="128" nr_cache_blocks="0" policy=""
hint_width="4">
  <mappings>
metadata contains errors (run cache_check for details).
perhaps you wanted to run with --repair ?

    Running with --repair just produces metadata with no mappings and
hints, which is incorrect too.

    Obviously the metadata volume is corrupted beyond recovery, but I
am okay with that as it is a read-only LV and we are using the cache
for read acceleration. However, there seems to be no way for us to get
out of this state into something usable? I can't seem to remove the
cache from the LV. I've read through the documentation for lvmcache
and can't find any information about this.

    At the moment I can't access the original LV anymore. Whatever I
try to do always results in "Check of pool vg/lv-cache failed
(status:1). Manual repair required!" What am I missing?

Thanks!
Liwei
