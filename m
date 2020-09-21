Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E2220244F7
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 10:01:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32245101A53F
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 10:01:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 52A063C2751
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 12:01:24 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id VW36_spKE1Hn for <linux-lvm@redhat.com>;
	Mon, 21 Sep 2020 12:01:23 +0200 (CEST)
Received: from localhost (localhost.localdomain [IPv6:::1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id 076523C278E
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 12:01:23 +0200 (CEST)
Received: from zimbra.karlsbakk.net ([IPv6:::1])
	by localhost (zimbra.karlsbakk.net [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id vyGFLbardtes for <linux-lvm@redhat.com>;
	Mon, 21 Sep 2020 12:01:22 +0200 (CEST)
Received: from zimbra.karlsbakk.net (localhost.localdomain [127.0.0.1])
	by zimbra.karlsbakk.net (Postfix) with ESMTP id E153F3C2751
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 12:01:22 +0200 (CEST)
Date: Mon, 21 Sep 2020 12:01:22 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <2072153092.4261300.1600682482754.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <58ac5e5a-a3ce-6844-8a30-29f65dc857b7@redhat.com>
References: <552451034.4238344.1600678309529.JavaMail.zimbra@karlsbakk.net>
	<58ac5e5a-a3ce-6844-8a30-29f65dc857b7@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Removing lvmcache fails
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

> Dne 21. 09. 20 v 10:51 Roy Sigurd Karlsbakk napsal(a):
>> Hi all
>> 
>> I have an ssd hooked up to my system to do some caching of the raid-6 array.
>> Now, that SSD isn't very new and has started developing some smart errors, so I
>> thought I'd just remove it and find a nice recycle bin for it. However, this
>> fails.
> 
> Hmm - cache isn't yet very easy to use once you start to have faulty devices
> in your device stack

Well, that's why I want to replace it ;)

>> This is Debian Buster (latest) with kernel 5.4 and lvm 2.03.02(2)
>> 
>> Any idea how to get rid of this?
>> 
>> # lvconvert --uncache data/data
>>    Unknown feature in status: 8 2488/262144 128 819192/819200 57263288 35277148
>>    19955332 9916661 0 1 1 3 metadata2 writethrough no_discard_passdown 2
>>    migration_threshold 2048 smq 0 rw -
> 
> 
> However since you have 'writethrough' cache mode - it should be possible to
> use  'lvconvert --uncache --force'

# lvconvert --uncache --force data/data
  Unknown feature in status: 8 2484/262144 128 819198/819200 57470386 35323243 19987362 9940326 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -
  Flushing 1 blocks for cache data/data.
  Unknown feature in status: 8 2484/262144 128 819198/819200 57439248 35307947 19981793 9938992 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
  Flushing 1 blocks for cache data/data.
  Unknown feature in status: 8 2484/262144 128 819198/819200 57439248 35307947 19981793 9938992 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
(et cetera et cetera ad infinitum)

> But I'm somehow confused how you can have any dirty blocks in this case ??

So am I

> lvm2 2.03.02 version was somewhat experimental release - so I've recommend
> something newer  - which will also properly parse newer status output from
> newer kernel dm-cache module.

Well, that's weird - debian is usually rather conservative on its packages in a stable release. Are you sure?

I also updated to a backported kernel 5.7 without any change.

Vennlig hilsen

roy
-- 
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
