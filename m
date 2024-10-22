Received: from mail.justnet.pl (mail.justnet.pl [78.9.185.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FB1C9DDB
	for <linux-lvm@lists.linux.dev>; Tue, 22 Oct 2024 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.9.185.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729619951; cv=none; b=EsynZuzDAOlSQzqst4FSmO+mPoDNocQuFDFs6PZwKIuOQS61d5gqbA1NmYKiQeAlQGpxLwgxjfiCdSWRKHQCflu2RHxuB0N3OMJCtFqJIlMMd1qQkHgDpI/mmRsdTVOa8ZoN3lYOKl2HLMwP99eocDoEbWbazbBIQRmK1b6dS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729619951; c=relaxed/simple;
	bh=MnHFFb6QwlTLQTkSDmHFZ5d2zpTsrS8Bppht/rtxtiE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:
	 References:In-Reply-To; b=YDnCm5Vn9y3jAa/sB2f0whXv2Uk3eRXvPo4ZsrMpcvgmeWiK/25l60cAMe5cE0wkykjCLhv4AHYmOgiUjC0/htgPwLJwTf4Jw6q/0kCgDyei8jy+H7oNy6iwR9gP67XG1m2dluLzxBDqtWt7pYFUhPkuZI8ya89Puy/4JTTUPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=justnet.pl; spf=pass smtp.mailfrom=justnet.pl; dkim=pass (2048-bit key) header.d=justnet.pl header.i=@justnet.pl header.b=RF8NqcSC; arc=none smtp.client-ip=78.9.185.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=justnet.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justnet.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justnet.pl header.i=@justnet.pl header.b="RF8NqcSC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=justnet.pl;
	s=dkim; h=In-Reply-To:References:To:From:Subject:Reply-To:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HgZ7XVbVYrOY2By8c/e2G3LcCstKWNHzLeilNJgMeJQ=; b=RF8NqcSCLSWJNlWEm6bGjOp6Kx
	CWrby3OoN3jdxWhUclctKrgphQ2CoNc8GprsjHOeW1MxmRLfL6M3MDhnVM47MX/4tWKXW5q6IFPE8
	GPMakInqQvKCsuBFaBqLHDnl4sqZx94Jj2hLFmsON5BeAdh/QJHeWT6Yctbbpd/HT33n0xr6p1CaI
	sDquua/u04CAdMht+hsHcp7HI+CCYzUl5rkX1l2BTovxPhUndIRMR6E7/8ZxIYAtc5CS4yjODZ0uW
	KApYYyRd23a2B8b2utDaonhm8pn0Kwf6+7j6mkOWYSRJvfMPSNJngMLeid3MA8mEyl0RmgeI83HbM
	w4bNWvPw==;
Received: from [78.9.185.84] (helo=[192.168.255.66])
	by mail.justnet.pl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <adam.niescierowicz@justnet.pl>)
	id 1t3J9s-00000009CQA-15Dc;
	Tue, 22 Oct 2024 19:59:06 +0200
Content-Type: multipart/mixed; boundary="------------ouomB1COZLb7yulZaUzCil0o"
Message-ID: <1aca2c5b-4c4a-4e38-a2c8-55b1fa98d3b4@justnet.pl>
Date: Tue, 22 Oct 2024 19:59:01 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Reply-To: adam.niescierowicz@justnet.pl
Subject: Re: lvconvert --type raid5 failure
From: Adam Niescierowicz <adam.niescierowicz@justnet.pl>
To: linux-lvm@lists.linux.dev
References: <1f1681d7-c34e-4f6f-9625-a155b9766eb3@justnet.pl>
Content-Language: pl
Organization: =?UTF-8?Q?Adam_Nie=C5=9Bcierowicz_JustNet?=
In-Reply-To: <1f1681d7-c34e-4f6f-9625-a155b9766eb3@justnet.pl>
X-Spam-Score: -2.3
X-Spam-Level: --

This is a multi-part message in MIME format.
--------------ouomB1COZLb7yulZaUzCil0o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Kernel: 6.1.0-18-amd64

LVM:

>  LVM version:     2.03.16(2) (2022-05-18)
>  Library version: 1.02.185 (2022-05-18)
>  Driver version:  4.47.0
>  Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr 
> --includedir=${prefix}/include --mandir=${prefix}/share/man 
> --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var 
> --disable-option-checking --disable-silent-rules 
> --libdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run 
> --disable-maintainer-mode --disable-dependency-tracking 
> --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin --w
> ith-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2 
> --with-cache=internal --with-device-uid=0 --with-device-gid=6 
> --with-device-mode=0660 --with-default-pid-dir=/run 
> --with-default-run-dir=/run/lvm 
> --with-default-locking-dir=/run/lock/lvm --with-thin=internal 
> --with-thin-check=/usr/sbin/thin_check 
> --with-thin-dump=/usr/sbin/thin_dump 
> --with-thin-repair=/usr/sbin/thin_repair --with-udev-prefix=/ --en
> able-applib --enable-blkid_wiping --enable-cmdlib --enable-dmeventd 
> --enable-editline --enable-lvmlockd-dlm --enable-lvmlockd-sanlock 
> --enable-lvmpolld --enable-notify-dbus --enable-pkgconfig 
> --enable-udev_rules --enable-udev_sync --disable-readline
>

W dniu 22.10.2024 o 17:26, Adam Niescierowicz pisze:
> Hi,
>
> I have LV type raid1 and after adding couple disk to VG I anted to 
> change raid1 to raid5 so I did:
>
> > # lvconvert --type raid5 /dev/first/lxc-owncloud-data-new
>
> it converted LV to RAID5 but didn't add new spare so:
>
> > # lvconvert --stripes 2 /dev/first/lxc-owncloud-data-new
>
> After this LV have 3 device but I didn't saw any sync action and 
> movement on the disk so to resync data I used:
>
> > # lvchange --resync /dev/first/lxc-owncloud-data-new
>
> It was like conversion from 6 to 12TB so after 40 hours when resync 
> was done I do mount and XFS complain about FS.
>
> What I did wrong?
> Is there a chance that I can recover data?
>
>
> From LVM Archive
>
>> # Orginal LV
>> lxc-owncloud-data-new {
>>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>>     status = ["READ", "WRITE", "VISIBLE"]
>>     flags = []
>>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>>     creation_host = "lxc4"
>>     segment_count = 1
>>
>>     segment1 {
>>         start_extent = 0
>>         extent_count = 1572864  # 6 Terabytes
>>
>>         type = "raid1"
>>         device_count = 2
>>         region_size = 8192
>>
>>         raids = [
>>             "lxc-owncloud-data-new_rmeta_0", 
>> "lxc-owncloud-data-new_rimage_0",
>>             "lxc-owncloud-data-new_rmeta_1", 
>> "lxc-owncloud-data-new_rimage_1"
>>         ]
>>     }
>> }
>>
>>
>> # After lvconvert --type raid5 /dev/first/lxc-owncloud-data-new
>> lxc-owncloud-data-new {
>>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>>     status = ["READ", "WRITE", "VISIBLE"]
>>     flags = []
>>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>>     creation_host = "lxc4"
>>     segment_count = 1
>>
>>     segment1 {
>>         start_extent = 0
>>         extent_count = 1572864  # 6 Terabytes
>>
>>         type = "raid5"
>>         device_count = 2
>>         region_size = 8192
>>         stripe_size = 128
>>
>>         raids = [
>>             "lxc-owncloud-data-new_rmeta_0", 
>> "lxc-owncloud-data-new_rimage_0",
>>             "lxc-owncloud-data-new_rmeta_1", 
>> "lxc-owncloud-data-new_rimage_1"
>>         ]
>>     }
>> }
>>
>>
>> # After lvconvert --stripes 2 /dev/first/lxc-owncloud-data-new
>> lxc-owncloud-data-new {
>>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>>     status = ["READ", "WRITE", "VISIBLE"]
>>     flags = []
>>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>>     creation_host = "lxc4"
>>     segment_count = 1
>>
>>     segment1 {
>>         start_extent = 0
>>         extent_count = 3145730  # 12 Terabytes
>>
>>         reshape_count = 1   # 4 Megabytes
>>         type = "raid5"
>>         device_count = 3
>>         region_size = 16384
>>         stripe_size = 128
>>
>>         raids = [
>>             "lxc-owncloud-data-new_rmeta_0", 
>> "lxc-owncloud-data-new_rimage_0",
>>             "lxc-owncloud-data-new_rmeta_1", 
>> "lxc-owncloud-data-new_rimage_1",
>>             "lxc-owncloud-data-new_rmeta_2", 
>> "lxc-owncloud-data-new_rimage_2"
>>         ]
>>     }
>> }
>>
>> # Didn't have progress of reshape in LVS
>>
>> lxc-owncloud-data-new {
>>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>>     status = ["READ", "WRITE", "VISIBLE"]
>>     flags = []
>>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>>     creation_host = "lxc4"
>>     segment_count = 1
>>
>>     segment1 {
>>         start_extent = 0
>>         extent_count = 3145728  # 12 Terabytes
>>
>>         type = "raid5"
>>         device_count = 3
>>         region_size = 16384
>>         stripe_size = 128
>>
>>         raids = [
>>             "lxc-owncloud-data-new_rmeta_0", 
>> "lxc-owncloud-data-new_rimage_0",
>>             "lxc-owncloud-data-new_rmeta_1", 
>> "lxc-owncloud-data-new_rimage_1",
>>             "lxc-owncloud-data-new_rmeta_2", 
>> "lxc-owncloud-data-new_rimage_2"
>>         ]
>>     }
>> }
>>
>> # lvchange --resync /dev/first/lxc-owncloud-data-new
>
>
-- 
---
Pozdrawiam
Adam Nieścierowicz

--------------ouomB1COZLb7yulZaUzCil0o
Content-Type: text/vcard; charset=UTF-8; name="adam_niescierowicz.vcf"
Content-Disposition: attachment; filename="adam_niescierowicz.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuO3F1b3RlZC1wcmludGFibGU6QWRhbSBOaWU9QzU9OUJjaWVyb3dp
Y3oNCm47cXVvdGVkLXByaW50YWJsZTpOaWU9QzU9OUJjaWVyb3dpY3o7QWRhbQ0KZW1haWw7
aW50ZXJuZXQ6YWRhbS5uaWVzY2llcm93aWN6QGp1c3RuZXQucGwNCngtbW96aWxsYS1odG1s
OlRSVUUNCnZlcnNpb246Mi4xDQplbmQ6dmNhcmQNCg0K

--------------ouomB1COZLb7yulZaUzCil0o--
