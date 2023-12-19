Received: from smtpo48.interia.pl (smtpo48.interia.pl [217.74.67.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9274241847
	for <linux-lvm@lists.linux.dev>; Tue, 19 Dec 2023 22:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=interia.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interia.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=interia.pl header.i=@interia.pl header.b="bwuj4MQZ"
Received: from [192.168.10.115] (185-12-23-140.sigma.jaslo.pl [185.12.23.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA
	for <linux-lvm@lists.linux.dev>; Tue, 19 Dec 2023 23:27:55 +0100 (CET)
Message-ID: <cd95e52c-1f72-4dd3-b7b1-3581fb76a7b3@interia.pl>
Date: Tue, 19 Dec 2023 23:28:24 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-CA
From: Wolf480pl <wolf480@interia.pl>
Subject: lvmcache not promoting blocks when there's free RAM
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl; s=dk;
	t=1703024876; bh=sXJ1K8ooY/RfK29Hid0bIoBBbVEURv67oYa1W6XsPpA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	b=bwuj4MQZ9RfXivnJJ1BH+NErokzUGYw+13thxf2xAmrQalC5SF2rbULzq9PwF02AT
	 KY05+tR/tasp/C4iHSXtdhfz5rjKwo5dfkE+QOzgS+WvScmU4Q1jovbVWNrrMCINnO
	 muVEoZgv8ieOYo0SfWbts6uVWuR4Q034BHp+MCMc=

Hello,

I have an x86-64 PC acting as a NAS, it has 2x 3TB HDDs in md(4) RAID1,
with LVM on top, and LVs for various types of data. It also has
an NVME SSD with rootfs and 16GB of RAM. I spin down the HDDs to
minimize idle power draw, and to make them spin up less often I tried
to use lvmcache for one of the LVs, with cache volume on the SSD.

However, barely anything gets cached in the lvmcache. Blocks aren't
getting promoted (based on dmsetup status), despite the cache volume
being mostly empty.

When a file is read for the first time, it gets cached in RAM
by page cache, but not on SSD by lvmcache. Subsequent reads never hit
the block layer, because the data is already in RAM, until I need to
reboot the machine. After a reboot, when something tries to read
that file again, HDDs will have to be spun up again, because it never
got promoted to SSD by lvmcache.

I looked into dm-cache's smq policy code[1], and it looks like
for a block to be promoted to the cache volume, it needs to be read
at least twice:

- first read - block gets added to the bottom of the hotspot queue
- some time passes, queue tick triggers a redistribute, some blocks
   get moved to the top of the queue
- second read - block is found to be on top of the queue, gets promoted

Unfortunately in my case the second read never comes.

I'm working it around by setting very low memory limit in cgroups that
often read small files, but I'm curious if a better solution exists.

Also, I'm guessing I'm not the first one discovering this - is there
any bugtracker where I can find or submit an issue like this?

I have a few ideas on how this could be fixed in the kernel, but
I don't know if such patches would be welcome or where to reach
device-mapper developers to ask them about it.

I'd be thankful for guidance on how to proceed with this.

Here are more details about the setup:

     $ uname -a
     Linux roy 5.10.0-20-amd64 #1 SMP Debian 5.10.158-2 (2022-12-13) x86_64 GNU/Linux
     $ head -n1 /etc/os-release
     PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
     $ sudo lvs -a
       LV                     VG    Attr       LSize   Pool                 Origin          Data%  Meta%  Move Log Cpy%Sync Convert
       archive                greed Cwi-aoC--- 250,00g [archive_cache_cvol] [archive_corig] 1,83   24,09           0,00
       [archive_cache_cvol]   greed Cwi-aoC---  50,00g
       [archive_corig]        greed owi-aoC--- 250,00g
     [...]
     $ sudo pvs
       PV             VG    Fmt  Attr PSize    PFree
       /dev/md126     greed lvm2 a--    <2,00t <473,00g
       /dev/nvme0n1p3 greed lvm2 a--  <200,00g <150,00g


I have graphs showing IO metrics from /proc/diskstats
and `dmsetup status`, but I don't know if/how one should send pictures
to the list.

This is my first time posting to the list so please let me know
if I made any mistakes. I can provide more details about my usecase,
or my ideas for fixes, but I wasn't sure if this is the right place or
how much detail is appropriate. I'll appreciate any guidance.

Regards

Wolf480pl

[1]: https://elixir.bootlin.com/linux/v5.10.200/source/drivers/md/dm-cache-policy-smq.c
