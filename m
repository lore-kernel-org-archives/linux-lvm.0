Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A300D2157F23
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 13:24:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 997A7900C65
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 13:24:27 +0000 (UTC)
Date: Mon, 21 Sep 2020 15:24:20 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <1167563161.4316339.1600694660948.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <c6499a9a-1e69-9502-85b5-b62bb5a4771b@redhat.com>
References: <552451034.4238344.1600678309529.JavaMail.zimbra@karlsbakk.net>
	<58ac5e5a-a3ce-6844-8a30-29f65dc857b7@redhat.com>
	<2072153092.4261300.1600682482754.JavaMail.zimbra@karlsbakk.net>
	<c6499a9a-1e69-9502-85b5-b62bb5a4771b@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm <linux-lvm@redhat.com>

> Please can you open upstream BZ here:
> 
> https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper
> 
> List all the info - i.e. package versions (yep even .debs), kernel versions
> lvmdump  archive.
> 
> I can probably easily 'hand-make' lvm2 metadata for you for 'vgcfgrestore' -
> but I'd like to track this case and create some reproducer for this issue so
> we can handle case were the cache cannot be cleared.

https://bugzilla.redhat.com/show_bug.cgi?id=1881056

Here you go. Thanks for any help :)

PS: I love languages, I just wonder how you pronounce Zdenek ;)

Vennlig hilsen

roy
-- 
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
