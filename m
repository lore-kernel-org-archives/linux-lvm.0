Received: from uriel.iewc.co.za (uriel.iewc.co.za [154.73.34.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7767142E73
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490778; cv=none; b=ZNWQC7dlQjE8ZTZtp331HcEyngvUBW0gc4GWJVTCXL8nZar6aBr1mamVpiwEW3IepaRCEMc+hq2K6PxfGcaKt0VZtjs+mrGvPGQIZ0YQgXbwmqp0QeTqaj97j1Tv66IClI73pGOVFHATNTeYqskD6+6NjInNF2o+14LIrxrf4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490778; c=relaxed/simple;
	bh=v6z7dW2AgGwrEA10M+veoiSs28hLaUvhl9x9Gx0OwvY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=U1S5/lUDF5xBSfmbOBkz9UrP2RlEB2FkwH4cv0HR0rRNAZQspzfGmXKpKJOLUB9rPfhvj/t07e3af+tnGOwgKmTIps//dVtYd9NLE8Ul3YhNt52uGEJNTeVKIJOdWdjnXh5TTdu3WC0e51F2K1iGpq3y3rlmIYnULlKuxI4I3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=CpKn4j+q; arc=none smtp.client-ip=154.73.34.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="CpKn4j+q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Naa8G1wCUqJC2RmcO2K4Kmy5W2MfaAdADeQ4PzVH7gE=; b=CpKn4j+q4QAyCt/O75ee6TeaZu
	CbJtHtJkcZbmlfanaf3RpS5RUQv5z26xCPGeCWSS0EruO+0Md+5DIY6L18Fm4YFKoDLkFjflU2cRZ
	lcWrK8m08qCOzmJFOVLowI+3C0Nvw6D0j+HB6akEAMvnz63f+2JX8UUSTPVMYQd6Gszx0zim5EPvW
	qVyqSX0zWk2CF4bm3BGcvRrjZqsy1radsphewJJ1oEtNoCfjmGlHpBHACfnklqH6erFQ6evsqlEg1
	W7XJbCaHSndgFjBcH4TxH2gSbtDeUcwUWBNowByLCqAj1GR7uRww03gR6TnP7rBXpTVngJ60UvNgx
	4YMjBxAg==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by uriel.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sEPo2-000000003yu-0YCs;
	Tue, 04 Jun 2024 10:46:10 +0200
Received: from [192.168.42.21]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sEPo0-000000001wS-2Um2;
	Tue, 04 Jun 2024 10:46:08 +0200
Message-ID: <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
Date: Tue, 4 Jun 2024 10:46:06 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jaco Kroon <jaco@uls.co.za>
Subject: Re: lvm2 deadlock
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
Content-Language: en-GB
Autocrypt: addr=jaco@uls.co.za; keydata=
 xsBNBFXtplYBCADM6RTLCOSPiclevkn/gdf8h9l+kKA6N+WGIIFuUtoc9Gaf8QhXWW/fvUq2
 a3eo4ULVFT1jJ56Vfm4MssGA97NZtlOe3cg8QJMZZhsoN5wetG9SrJvT9Rlltwo5nFmXY3ZY
 gXsdwkpDr9Y5TqBizx7DGxMd/mrOfXeql57FWFeOc2GuJBnHPZQMJsQ66l2obPn36hWEtHYN
 gcUSPH3OOusSEGZg/oX/8WSDQ/b8xz1JKTEgcnu/JR0FxzjY19zSHmbnyVU+/gF3oeJFcEUk
 HvZu776LRVdcZ0lb1bHQB2K9rTZBVeZLitgAefPVH2uERVSO8EZO1I5M7afV0Kd/Vyn9ABEB
 AAHNG0phY28gS3Jvb24gPGphY29AdWxzLmNvLnphPsLAdwQTAQgAIQUCVe2mVgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAILcSxr/fungCPB/sHrfufpRbrVTtHUjpbY4bTQLQE
 bVrh4/yMiKprALRYy0nsMivl16Q/3rNWXJuQ0gR/faC3yNlDgtEoXx8noXOhva9GGHPGTaPT
 hhpcp/1E4C9Ghcaxw3MRapVnSKnSYL+zOOpkGwye2+fbqwCkCYCM7Vu6ws3+pMzJNFK/UOgW
 Tj8O5eBa3DiU4U26/jUHEIg74U+ypYPcj5qXG0xNXmmoDpZweW41Cfo6FMmgjQBTEGzo9e5R
 kjc7MH3+IyJvP4bzE5Paq0q0b5zZ8DUJFtT7pVb3FQTz1v3CutLlF1elFZzd9sZrg+mLA5PM
 o8PG9FLw9ZtTE314vgMWJ+TTYX0kzsBNBFXtplYBCADedX9HSSJozh4YIBT+PuLWCTJRLTLu
 jXU7HobdK1EljPAi1ahCUXJR+NHvpJLSq/N5rtL12ejJJ4EMMp2UUK0IHz4kx26FeAJuOQMe
 GEzoEkiiR15ufkApBCRssIj5B8OA/351Y9PFore5KJzQf1psrCnMSZoJ89KLfU7C5S+ooX9e
 re2aWgu5jqKgKDLa07/UVHyxDTtQKRZSFibFCHbMELYKDr3tUdUfCDqVjipCzHmLZ+xMisfn
 yX9aTVI3FUIs8UiqM5xlxqfuCnDrKBJjQs3uvmd6cyhPRmnsjase48RoO84Ckjbp/HVu0+1+
 6vgiPjbe4xk7Ehkw1mfSxb79ABEBAAHCwF8EGAEIAAkFAlXtplYCGwwACgkQCC3Esa/37p7u
 XwgAjpFzUj+GMmo8ZeYwHH6YfNZQV+hfesr7tqlZn5DhQXJgT2NF6qh5Vn8TcFPR4JZiVIkF
 o0je7c8FJe34Aqex/H9R8LxvhENX/YOtq5+PqZj59y9G9+0FFZ1CyguTDC845zuJnnR5A0lw
 FARZaL8T7e6UGphtiT0NdR7EXnJ/alvtsnsNudtvFnKtigYvtw2wthW6CLvwrFjsuiXPjVUX
 825zQUnBHnrED6vG67UG4z5cQ4uY/LcSNsqBsoj6/wsT0pnqdibhCWmgFimOsSRgaF7qsVtg
 TWyQDTjH643+qYbJJdH91LASRLrenRCgpCXgzNWAMX6PJlqLrNX1Ye4CQw==
Organization: Ultimate Linux Solutions (Pty) Ltd
In-Reply-To: <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (uriel.iewc.co.za).

Hi,

Please refer below.

On 2024/06/03 21:25, Zdenek Kabelac wrote:
> Dne 03. 06. 24 v 14:56 Jaco Kroon napsal(a):
>> Hi,
>>
>> Thanks for the insight.  Please refer below.
>>
>> On 2024/05/31 14:34, Zdenek Kabelac wrote:
>>> Dne 30. 05. 24 v 12:21 Jaco Kroon napsal(a):
>>>> Hi,
>>>>
>>> I'm kind of missing here to see your 'deadlock' scenario from this 
>>> description.
>> Well, stuff blocks, until the cookie is released by using the dmset 
>> udevcomplete command, so wrong wording perhaps?
>>>
>>> Lvm2 takes the VG lock - creates LV - waits for udev till it's 
>>> finished with its job and confirms all the udev work with dmsetup 
>>> udevcomplete.
>>
>> So what I understand from this is that udevcomplete ends up never 
>> executing?  Is there some way of confirming this?
>
> udevcomplete needs  someone to create 'semaphore' for completion in 
> the first place.


I'm not familiar with the LVM internals and the flows of different 
processes, even though you can probably safely consider me a "semi power 
user".  I do have compsci background, so do understand most of the 
principles of locking etc, but how they are applied in the LVM 
environment I'm clueless.

>
>
>>>
>>> It's also unclear which OS are you using - Debian, Fedora, ???
>>
>> Gentoo.
>>
>>> Version of your packages ?
>>
>> I thought I did provide this:
>>
>> Kernel version was 6.4.12 when this hapened, is now 6.9.3.
>>
>> crowsnest [12:19:47] /run/lvm # udevadm --version
>> 254
>>
>> aka systemd-utils-254.10
>>
>> lvm2-2.03.22
>
> Since this is most likely your personal build - please provide full 
> output of
> 'lvm version'  command.


crowsnest [09:46:04] ~ # lvm version
   LVM version:     2.03.22(2) (2023-08-02)
   Library version: 1.02.196 (2023-08-02)
   Driver version:  4.48.0
   Configuration:   ./configure --prefix=/usr 
--build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu 
--mandir=/usr/share/man --infodir=/usr/share/info --datadir=/usr/share 
--sysconfdir=/etc --localstatedir=/var/lib --datarootdir=/usr/share 
--disable-dependency-tracking --disable-silent-rules 
--docdir=/usr/share/doc/lvm2-2.03.22-r5 
--htmldir=/usr/share/doc/lvm2-2.03.22-r5/html --enable-dmfilemapd 
--enable-dmeventd --enable-cmdlib --enable-fsadm --enable-lvmpolld 
--with-mirrors=internal --with-snapshots=internal --with-thin=internal 
--with-cache=internal --with-thin-check=/usr/sbin/thin_check 
--with-cache-check=/usr/sbin/cache_check 
--with-thin-dump=/usr/sbin/thin_dump 
--with-cache-dump=/usr/sbin/cache_dump 
--with-thin-repair=/usr/sbin/thin_repair 
--with-cache-repair=/usr/sbin/cache_repair 
--with-thin-restore=/usr/sbin/thin_restore 
--with-cache-restore=/usr/sbin/cache_restore --with-symvers=gnu 
--enable-readline --disable-selinux --enable-pkgconfig 
--with-confdir=/etc --exec-prefix= --sbindir=/sbin 
--with-staticdir=/sbin --libdir=/lib64 --with-usrlibdir=/usr/lib64 
--with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm 
--with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run 
--enable-udev_rules --enable-udev_sync --with-udevdir=/lib/udev/rules.d 
--disable-lvmlockd-sanlock --disable-notify-dbus --disable-app-machineid 
--disable-systemd-journal --without-systemd-run --disable-valgrind-pool 
--with-systemdsystemunitdir=/lib/systemd/system CLDFLAGS=-Wl,-O1 
-Wl,--as-needed


>
> For the 'udev' synchronization, there needs to be '--enable-udev_sync' 
> configure option. So let's check which configure/build option were 
> used here.
> And also preferably upstream udev rules.


--enable-udev_sync all there.

To the best of my knowledge the udev rules are stock, certainly neither 
myself nor any of my colleagues modified them.  They would generally 
defer to me, and I won't touch that unless I understand the 
implications, which in this case I just don't.

>
>>
>> Thanks for the feedback, what you say makes perfect sense, and the 
>> implication is that there are only a few options:
>>
>> 1.  Something is resulting in the udev trigger to take longer than 
>> three minutes, and the dmsetup udevcomplete never being executed.
>
> systemd simply kills udev worker if takes too long.
>
> However on properly running system, it would be very very unusual to 
> hit these timeouts  - you would need to work with thousands of 
> devices....


32 physical NL-SAS drives, combined into 3 RAID6 arrays using mdadm.

These three md devices serve as PVs for LVM, single VG.

73 LVs, just over half of which are mounted.  Most of those are thin 
volumes inside:

crowsnest [09:54:04] ~ # lvdisplay /dev/lvm/thin_pool
   --- Logical volume ---
   LV Name                thin_pool
   VG Name                lvm
   LV UUID                twLSE1-3ckG-WRSO-5eHc-G3fY-YS2v-as4ABC
   LV Write Access        read/write (activated read only)
   LV Creation host, time crowsnest, 2020-02-19 12:26:00 +0200
   LV Pool metadata       thin_pool_tmeta
   LV Pool data           thin_pool_tdata
   LV Status              available
   # open                 0
   LV Size                125.00 TiB
   Allocated pool data    73.57%
   Allocated metadata     9.05%
   Current LE             32768000
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     1024
   Block device           253:11

The rest are snapshots of the LVs that are mounted so that we have a 
roll-back destination in case of filesystem corruption (these snaps are 
made in multiple steps, first a snap of the origin is made, this is then 
fsck'ed, if that's successful it's fstrim'ed before being renamed into 
the final "save" location - any previously saved copy is first lvremove'd).

I'd describe that as a few tens of devices, not a few hundred and 
certainly not thousands of devices.


>
>>
>> This could potentially be due to extremely heavy disk IO, or LVM 
>> itself freezing IO.
>
> well reducing the percentage of '/proc/sys/vm/dirty_ration' may 
> possibly help
> when your disk system is too slow and you create a very lengthy 'sync' 
> io queues...


crowsnest [09:52:21] /proc/sys/vm # cat dirty_ratio
20

Happy to lower that even more if it would help.

Internet (Redhat) states:

Starts active writeback of dirty data at this percentage of total memory 
for the generator of dirty data, via pdflush. The default value is |40|.

I'm assuming the default is 20 though, not 40, since I can't find that 
I've reconfigured this value.

Should probably remain higher than dirty_background_ratio (which is 
currently 10), dirty_background_bytes is 0.


>
>> I don't see the default value for udev_log from the config. 
>> Explicitly set to debug now, but still not seeing anything logged to 
>> syslog. Running with udevd --debug, which logs to a ramdisk on /run.  
>> Hopefully (if/when this happens again) that may shed some light.  
>> There is 256GB of RAM available, so as long as the log doesn't grow 
>> too quickly should be fine.
>
> A lot of RAM may possibly create a huge amount of dirty pages...


May I safely interpret this as "lower the dirty_ratio even further"?

Given a value of 10 and 20 I'm assuming that pdflush will start flushing 
out in the background when >~26GB of in-memory data is dirty, or if the 
data has been dirty for more than 5 seconds (dirty_writeback_centisecs = 
500).

Don't mind lowering the dirty_background ratio as low as 1 even? But 
won't the primary dirty_ratio start blocking processes from writing if 
 >40% of the caches/buffers are considered dirty?

Kind regards,
Jaco

