Received: from uriel.iewc.co.za (uriel.iewc.co.za [154.73.34.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99882D6C
	for <linux-lvm@lists.linux.dev>; Mon,  3 Jun 2024 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717419423; cv=none; b=mIoGndScEspTmOxOH+EkAHsPAW8g7pFYNP0k/EZCOkFF6f4D3tL1Q54jNb1mWd8DyjzlKtI8C1WPidK4W3eGmkV4srlTnMhAjW/IlFrbG0MwG5xxwX2hn2Xek/08TfwvXhr/z2Tboy0jyegQH1S8dlzak7q9XFzjEzDbGkdbZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717419423; c=relaxed/simple;
	bh=IpE3e2Urpuf5Qok7If1K1EToL6dra59kZ4gidgjJ3p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JxrurcBXxikGOWxHXzDQqRavC7Z7sqB4CMcbLVSpe8qaemvtdMQX8LIU7UFZ06ptdfECROP/C1soFBb1yi2bavF7AB9XRvRpdB8FbktnXf7LPzPzfeiiyuNnkX+tD4mDg/CWkhfUM5NHAQnWGoxwf2mrur8nD65kH3TwmBLDFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=A5PiHivJ; arc=none smtp.client-ip=154.73.34.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="A5PiHivJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WXmlXkYy7TpCdEVWyWovh29oyM6NGRr0fVscBCLmptE=; b=A5PiHivJ/6d5REmQrm1iOG3jep
	azo7jqnHxTYmRYDcepRek0UpfS1CP7oXgneB6Ujd+R1ANoWHg6KmpvPN/xGIhZ7O9xqBX+QcqKS4a
	xsgg5jVIFwgQXz1i0mJw4sIKh8IYIdrwPEwNUSxVBz+y7Tuiehyb8xt+Wc8ofB/EBEyN7WRNr9+1s
	8Aoon+48yjbNPNG3m4FbaKzGbAamrFh438YdDTSgrIx5upTppljMIVybc/kpDjbaxVIPf8J2dMvBs
	BzjF3e/ggG9RU3MAFaT48rcW4au4HaCi4VBAJoPCGfK+zzZQEoG7GA87AQwobBMnd5zPO2mgh0yu1
	KSvBCRBA==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by uriel.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sE7F2-000000007sL-2IAN;
	Mon, 03 Jun 2024 14:56:48 +0200
Received: from [192.168.42.198]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sE7F0-000000006GN-3mDW;
	Mon, 03 Jun 2024 14:56:47 +0200
Message-ID: <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
Date: Mon, 3 Jun 2024 14:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
Content-Language: en-GB
From: Jaco Kroon <jaco@uls.co.za>
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
In-Reply-To: <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (uriel.iewc.co.za).

Hi,

Thanks for the insight.  Please refer below.

On 2024/05/31 14:34, Zdenek Kabelac wrote:
> Dne 30. 05. 24 v 12:21 Jaco Kroon napsal(a):
>> Hi,
>>
>> Possible lvm2 command deadlock scenario:
>>
>> crowsnest [12:15:47] /run/lvm # fuser //run/lock/lvm/*
>> /run/lock/lvm/P_global: 17231
>> /run/lock/lvm/V_lvm: 16087 17231
>>
>> crowsnest [12:15:54] /run/lvm # ps axf | grep -E '16087|17231'
>> 24437 pts/1    S+     0:00  |       \_ grep --colour=auto -E 16087|17231
>> 16087 ?        S      0:00  |       |       \_ /sbin/lvcreate -kn -An 
>> -s -n fsck_cerberus /dev/lvm/backup_cerberus
>> 17231 ?        S      0:00  |           \_ /sbin/lvs --noheadings 
>> --nameprefixes
>>
>> crowsnest [12:17:40] /run/lvm # dmsetup udevcookies
>> Cookie       Semid      Value      Last semop time Last change time
>> 0xd4d2051    10         1          Thu May 30 02:34:05 2024  Thu May 
>> 30 02:32:22 2024
>>
>> This was almost 10 hours ago.
>>
>> crowsnest [12:17:44] /run/lvm # dmsetup udevcomplete 0xd4d2051
>> DM_COOKIE_COMPLETED=0xd4d2051
>> crowsnest [12:18:43] /run/lvm # ps axf | grep -E '16087|17231'
>> 27252 pts/1    S+     0:00  |       \_ grep --colour=auto -E 16087|17231
>> crowsnest [12:18:45] /run/lvm #
>>
>> Allows progress again.
>
> Hi
>
> I'm kind of missing here to see your 'deadlock' scenario from this 
> description.
Well, stuff blocks, until the cookie is released by using the dmset 
udevcomplete command, so wrong wording perhaps?
>
> Lvm2 takes the VG lock - creates LV - waits for udev till it's 
> finished with its job and confirms all the udev work with dmsetup 
> udevcomplete.

So what I understand from this is that udevcomplete ends up never 
executing?  Is there some way of confirming this?

>
> If something 'kills'  your udev worker  (which may eventually happen 
> on some 'very very very' busy system - you may need to set up longer 
> timeout for systemd to kill udev worker (I believe it's just 30seconds 
> by default).

Well, I guess upwards of 1GB/s of IO at times qualify.  No systemd, so 
more likely the udev configuration.  When this happens we see load 
averages upwards of 50 ... so based on that I'd say busy is probably a 
reasonable assessment.  Normally doesn't exceed load average values 
10-15 at most.

Even so ... event_timeout = 180 should be a VERY, VERY long time in 
terms of udev event processing.

I'm not seeing anything for udev in /var/log/messages (which is 
explicitly configured to log everything logged to syslog).  But it may 
also be a case of "not logging because LVM isn't processing any IO (/var 
is stored on it's own LV).

>
> If it happens your cookies blocks your lvm2 command - you can 
> 'unblock' them with  'dmsetup udevcomplete_all'  -  but that's a sign 
> your system is already in very bad state.
>
> It's also unclear which OS are you using - Debian, Fedora, ???

Gentoo.

> Version of your packages ?

I thought I did provide this:

Kernel version was 6.4.12 when this hapened, is now 6.9.3.

crowsnest [12:19:47] /run/lvm # udevadm --version
254

aka systemd-utils-254.10

lvm2-2.03.22

Thanks for the feedback, what you say makes perfect sense, and the 
implication is that there are only a few options:

1.  Something is resulting in the udev trigger to take longer than three 
minutes, and the dmsetup udevcomplete never being executed.
2.  Something goes horribly wrong during the udev trigger (which invokes 
dmsetup a few times) processing and the process crashes, never executing 
dmsetup udevcomplete.

This could potentially be due to extremely heavy disk IO, or LVM itself 
freezing IO.

Given the rulesets the only way I see this happening is if dmsetup 
command takes very long to load - and even in the degraded (most 
filesystems blocked) state it was fast to execute.

Or if udevd itself has problems accessing /sys - which I find extremely 
unlikely.

I don't see the default value for udev_log from the config. Explicitly 
set to debug now, but still not seeing anything logged to syslog.  
Running with udevd --debug, which logs to a ramdisk on /run.  Hopefully 
(if/when this happens again) that may shed some light.  There is 256GB 
of RAM available, so as long as the log doesn't grow too quickly should 
be fine.

Kind regards,
Jaco

