Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u199dUAY025190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 9 Feb 2016 04:39:31 -0500
Received: from mail.ant.gliwice.pl (mail.ant.gliwice.pl [93.179.197.152])
	by mx1.redhat.com (Postfix) with ESMTPS id 0CD2370001
	for <linux-lvm@redhat.com>; Tue,  9 Feb 2016 09:39:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ant.gliwice.pl (Postfix) with ESMTP id 2B2EF36A51A
	for <linux-lvm@redhat.com>; Tue,  9 Feb 2016 10:39:26 +0100 (CET)
Received: from mail.ant.gliwice.pl ([127.0.0.1])
	by localhost (beauty.ant.gliwice.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id OZ_-9zR3XKL9 for <linux-lvm@redhat.com>;
	Tue,  9 Feb 2016 10:39:26 +0100 (CET)
Received: from matkor-toshiba.localnet (aant13.neoplus.adsl.tpnet.pl
	[83.5.101.13])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ant.gliwice.pl (Postfix) with ESMTPSA id D1DBD36A517
	for <linux-lvm@redhat.com>; Tue,  9 Feb 2016 10:39:25 +0100 (CET)
From: Mateusz Korniak <mateusz-lists@ant.gliwice.pl>
Date: Tue, 09 Feb 2016 10:39:24 +0100
Message-ID: <7388582.ajrqipWyx8@matkor-toshiba>
In-Reply-To: <87r3gm8pfn.fsf@vostro.rath.org>
References: <87a8nctl7x.fsf@vostro.rath.org> <20160208091705.GA1612@rh-vpn>
	<87r3gm8pfn.fsf@vostro.rath.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvmcache performance
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
To: linux-lvm@redhat.com

On Monday 08 February 2016 14:05:24 Nikolaus Rath wrote:
> Well, yes, but since in my case the cache is bigger than the origin,
> shouldn't eventually *everything* end-up in the cache?

IIRC you lowered *_promote_adjustment, but still full copy may be prevented by 
sequential_threshold setting.

And how many blocks you have in cache after boot? [1]
Is number rising every boot?
Can you verify cache settings? [2]

[1]:
lvs -o+cache_total_blocks,cache_used_blocks,cache_dirty_blocks,
cache_read_hits,cache_read_misses,cache_write_hits,cache_write_misses,lv_health_status


[2]:
dmsetup status   VG-LV
lvs -o+cache_policy,cache_settings,chunksize VG/LV


-- 
Mateusz Korniak
"(...) mam brata - poważny, domator, liczykrupa, hipokryta, pobożniś,
 	krótko mówiąc - podpora społeczeństwa."
				Nikos Kazantzakis - "Grek Zorba"
