Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D2B1003332
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 08:59:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B7E800804
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 08:59:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id D77563C2751
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 10:51:51 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id JXsMJj8tV-zF for <linux-lvm@redhat.com>;
	Mon, 21 Sep 2020 10:51:49 +0200 (CEST)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id BA7183C278E
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 10:51:49 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id tcyJCo7zUy6e for <linux-lvm@redhat.com>;
	Mon, 21 Sep 2020 10:51:49 +0200 (CEST)
Received: from zimbra.karlsbakk.net (localhost.localdomain [127.0.0.1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id A08EE3C2751
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 10:51:49 +0200 (CEST)
Date: Mon, 21 Sep 2020 10:51:49 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <552451034.4238344.1600678309529.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Removing lvmcache fails
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
To: linux-lvm <linux-lvm@redhat.com>

Hi all

I have an ssd hooked up to my system to do some caching of the raid-6 array. Now, that SSD isn't very new and has started developing some smart errors, so I thought I'd just remove it and find a nice recycle bin for it. However, this fails.

This is Debian Buster (latest) with kernel 5.4 and lvm 2.03.02(2)

Any idea how to get rid of this?

# lvconvert --uncache data/data
  Unknown feature in status: 8 2488/262144 128 819192/819200 57263288 35277148 19955332 9916661 0 1 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -
  Flushing 1 blocks for cache data/data.
  Unknown feature in status: 8 2484/262144 128 819192/819200 56391295 33200598 19684834 6317925 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
  Flushing 1 blocks for cache data/data.
  Unknown feature in status: 8 2484/262144 128 819192/819200 56391295 33200598 19684835 6317925 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
  Flushing 1 blocks for cache data/data.
  Unknown feature in status: 8 2484/262144 128 819192/819200 56391295 33200598 19684835 6317925 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
  Flushing 1 blocks for cache data/data.
  Unknown feature in status: 8 2484/262144 128 819192/819200 56391295 33200598 19684835 6317925 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 
(and so on)

# lvs -o+cache_mode data/data
  Unknown feature in status: 8 2484/262144 128 819195/819200 57263401 35277148 19955449 9916671 0 3 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -
  LV   VG   Attr       LSize  Pool     Origin       Data%  Meta%  Move Log Cpy%Sync Convert CacheMode
  data data Cwi-aoC--- 13,67t [_cache] [data_corig] 99,99  0,95            0,01             writethrough

Vennlig hilsen

roy
-- 
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
