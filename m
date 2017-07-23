Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1BD5D964
	for <linux-lvm@redhat.com>; Sun, 23 Jul 2017 13:48:39 +0000 (UTC)
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81B6C80F75
	for <linux-lvm@redhat.com>; Sun, 23 Jul 2017 13:48:38 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id d145so33849150qkc.2
	for <linux-lvm@redhat.com>; Sun, 23 Jul 2017 06:48:38 -0700 (PDT)
MIME-Version: 1.0
From: CoolCold <coolthecold@gmail.com>
Date: Sun, 23 Jul 2017 20:48:37 +0700
Message-ID: <CAGqmV7oCXLyjio67mksc-rKrLQGvoyOeJfPH4T0or3STrbdbrA@mail.gmail.com>
Subject: [linux-lvm] dm-cache size is limited by 946GB
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
To: linux-lvm@redhat.com, brice.barotin@gmail.com

Hello!
We started to adopting new servers for image storages, and hit the
strange problem - no caching happens for cache lv > 946GB (so 947GB
and above do no work).

Storage box looks like:
2x240GB SSD for system (sw raid 1, lvm on top)
20x1.8TB SATA HDD for data  (sw raid 10, md124 + lvm on top)
4x960GB SSD for dm-caching puprose (sw raid5, md125).

Our naive approach was to create PV from md125 and make it all cache -
around 2.6TB of cache for 16TB of "raw" data should be quite good.
Cache created successfully, has seen the whole 2.6TB, but after
copying ~ 3TB data from old box, we still got only misses for reads
and writes in statistics and almost no activity in iostat for md125.
When i say "almost no activity" it was having some write operations,
but zeroes in KB -
https://gist.github.com/CoolCold/f79bb706d4dd1c083a4f4ed0ebd850d5 -
where dm-2 and dm-3 are cache data and cache meta volumes accordingly.

We have "old" servers which are running a bit different setup in
number of drives, they have 350-750GB of space for caching and it
works well. We tried to reduce cache size for new box, it worked for
80GB, so bisected to 946GB.

It doesn't look like any "magic" number (I though may be some problems
around 2TB for signed/unsigned or so) and right now i'm out of ideas
what the problem may be and need your advice.

Kernel version we are using:
3.10.0-514.26.2.el7.x86_64

LVM:
[root@xxx rovchinnikov]# lvs --version
  LVM version:     2.02.166(2)-RHEL7 (2016-11-16)
  Library version: 1.02.135-RHEL7 (2016-11-16)
  Driver version:  4.34.0



-- 
Best regards,
[COOLCOLD-RIPN]
