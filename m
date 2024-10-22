Received: from mail.justnet.pl (mail.justnet.pl [78.9.185.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D9E1A3BC8
	for <linux-lvm@lists.linux.dev>; Tue, 22 Oct 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.9.185.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729610834; cv=none; b=nZoZMqEKbcpcVHfNgZC6LBodtrTMlZImmIYoxY7SU3pLvUNvvAoEPMiTXvsMeUwZMbM1E6PNaM0YuVEPQt5ba18HdJo4l5MQ/dvymdLJgo8DD0ph1rO4UBc3rhkq6LX3a98CdOpyNfSd4qgrf3JnO7OO7Q2OwVYIIHAc5N3+00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729610834; c=relaxed/simple;
	bh=HpRHQ2fW35oqxe5ebOblUU6vnhECM06EbFTPm7e2hOg=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=q/mvUbtIJNz0K2TBQaVl2w1FjEKJr+p3+LdHb6dAYzAeSMFiSpwEieNvWyUCLF1lO3DUQFDuoyG2mLhiZKuvg6WA1PWn+lD+Tz6a9vulLNLHSUwX1KsOkMqAQLjgYlCPGJCauNwC9xBgHcfBRKkGWiPNmcG9uX3WIyLSPQ7CbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=justnet.pl; spf=pass smtp.mailfrom=justnet.pl; dkim=pass (2048-bit key) header.d=justnet.pl header.i=@justnet.pl header.b=RcXnMgVC; arc=none smtp.client-ip=78.9.185.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=justnet.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justnet.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justnet.pl header.i=@justnet.pl header.b="RcXnMgVC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=justnet.pl;
	s=dkim; h=Subject:From:To:Reply-To:MIME-Version:Date:Message-ID:Content-Type:
	Sender:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+4LOI8T7H0kxhpmEttHWPeN4erFgtKXj00rZE/10/w0=; b=RcXnMgVCrSxtnt4rK9nuIPU/L8
	hAMncUvu4mhbVldUelbfLLrxJxuhp29h0E8jo06rvlw3Z+vhTTb+Z8Irz1H/VNjFyFq7vuSdWO9TX
	P6fFoWRJXaK+TXRHkccRh/0/rwVKLBWSu78VicKQbpWdcD+KWHOWEQuv+XRmSYOa/g51VB2kanVtf
	Ri8/g1GE7jtQPmqzDsfdAT9lyHVpzXgaCDrD9J01ZzAX3bfDloYbXnYgEjlSKhyIiH6D9EGX5les2
	idmK48rQ5+t4b0PrAXxf91sdpfH52jgCRWQm6q+IvlnkAgQ5gzB2pCLAx5AryyZzTI/ED4EDAx4Cc
	0kAz0log==;
Received: from [78.9.185.84] (helo=[192.168.255.66])
	by mail.justnet.pl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <adam.niescierowicz@justnet.pl>)
	id 1t3Gmi-00000009B7W-28js;
	Tue, 22 Oct 2024 17:27:03 +0200
Content-Type: multipart/mixed; boundary="------------U6xBm0vPv5d6M0O2N6DDpMFW"
Message-ID: <1f1681d7-c34e-4f6f-9625-a155b9766eb3@justnet.pl>
Date: Tue, 22 Oct 2024 17:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Reply-To: adam.niescierowicz@justnet.pl
Content-Language: pl, en-US
To: linux-lvm@lists.linux.dev
From: Adam Niescierowicz <adam.niescierowicz@justnet.pl>
Subject: lvconvert --type raid5 failure
Organization: =?UTF-8?Q?Adam_Nie=C5=9Bcierowicz_JustNet?=
X-Spam-Score: -2.3
X-Spam-Level: --

This is a multi-part message in MIME format.
--------------U6xBm0vPv5d6M0O2N6DDpMFW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I have LV type raid1 and after adding couple disk to VG I anted to 
change raid1 to raid5 so I did:

 > # lvconvert --type raid5 /dev/first/lxc-owncloud-data-new

it converted LV to RAID5 but didn't add new spare so:

 > # lvconvert --stripes 2 /dev/first/lxc-owncloud-data-new

After this LV have 3 device but I didn't saw any sync action and 
movement on the disk so to resync data I used:

 > # lvchange --resync /dev/first/lxc-owncloud-data-new

It was like conversion from 6 to 12TB so after 40 hours when resync was 
done I do mount and XFS complain about FS.

What I did wrong?
Is there a chance that I can recover data?


 From LVM Archive

> # Orginal LV
> lxc-owncloud-data-new {
>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>     status = ["READ", "WRITE", "VISIBLE"]
>     flags = []
>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>     creation_host = "lxc4"
>     segment_count = 1
>
>     segment1 {
>         start_extent = 0
>         extent_count = 1572864  # 6 Terabytes
>
>         type = "raid1"
>         device_count = 2
>         region_size = 8192
>
>         raids = [
>             "lxc-owncloud-data-new_rmeta_0", 
> "lxc-owncloud-data-new_rimage_0",
>             "lxc-owncloud-data-new_rmeta_1", 
> "lxc-owncloud-data-new_rimage_1"
>         ]
>     }
> }
>
>
> # After lvconvert --type raid5 /dev/first/lxc-owncloud-data-new
> lxc-owncloud-data-new {
>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>     status = ["READ", "WRITE", "VISIBLE"]
>     flags = []
>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>     creation_host = "lxc4"
>     segment_count = 1
>
>     segment1 {
>         start_extent = 0
>         extent_count = 1572864  # 6 Terabytes
>
>         type = "raid5"
>         device_count = 2
>         region_size = 8192
>         stripe_size = 128
>
>         raids = [
>             "lxc-owncloud-data-new_rmeta_0", 
> "lxc-owncloud-data-new_rimage_0",
>             "lxc-owncloud-data-new_rmeta_1", 
> "lxc-owncloud-data-new_rimage_1"
>         ]
>     }
> }
>
>
> # After lvconvert --stripes 2 /dev/first/lxc-owncloud-data-new
> lxc-owncloud-data-new {
>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>     status = ["READ", "WRITE", "VISIBLE"]
>     flags = []
>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>     creation_host = "lxc4"
>     segment_count = 1
>
>     segment1 {
>         start_extent = 0
>         extent_count = 3145730  # 12 Terabytes
>
>         reshape_count = 1   # 4 Megabytes
>         type = "raid5"
>         device_count = 3
>         region_size = 16384
>         stripe_size = 128
>
>         raids = [
>             "lxc-owncloud-data-new_rmeta_0", 
> "lxc-owncloud-data-new_rimage_0",
>             "lxc-owncloud-data-new_rmeta_1", 
> "lxc-owncloud-data-new_rimage_1",
>             "lxc-owncloud-data-new_rmeta_2", 
> "lxc-owncloud-data-new_rimage_2"
>         ]
>     }
> }
>
> # Didn't have progress of reshape in LVS
>
> lxc-owncloud-data-new {
>     id = "4D3gRF-19uK-kCTX-DaYS-tmEx-Egs5-zRs7xp"
>     status = ["READ", "WRITE", "VISIBLE"]
>     flags = []
>     creation_time = 1713726446  # 2024-04-21 21:07:26 +0200
>     creation_host = "lxc4"
>     segment_count = 1
>
>     segment1 {
>         start_extent = 0
>         extent_count = 3145728  # 12 Terabytes
>
>         type = "raid5"
>         device_count = 3
>         region_size = 16384
>         stripe_size = 128
>
>         raids = [
>             "lxc-owncloud-data-new_rmeta_0", 
> "lxc-owncloud-data-new_rimage_0",
>             "lxc-owncloud-data-new_rmeta_1", 
> "lxc-owncloud-data-new_rimage_1",
>             "lxc-owncloud-data-new_rmeta_2", 
> "lxc-owncloud-data-new_rimage_2"
>         ]
>     }
> }
>
> # lvchange --resync /dev/first/lxc-owncloud-data-new


-- 
---
Pozdrawiam
Adam Nieścierowicz

--------------U6xBm0vPv5d6M0O2N6DDpMFW
Content-Type: text/vcard; charset=UTF-8; name="adam_niescierowicz.vcf"
Content-Disposition: attachment; filename="adam_niescierowicz.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuO3F1b3RlZC1wcmludGFibGU6QWRhbSBOaWU9QzU9OUJjaWVyb3dp
Y3oNCm47cXVvdGVkLXByaW50YWJsZTpOaWU9QzU9OUJjaWVyb3dpY3o7QWRhbQ0KZW1haWw7
aW50ZXJuZXQ6YWRhbS5uaWVzY2llcm93aWN6QGp1c3RuZXQucGwNCngtbW96aWxsYS1odG1s
OlRSVUUNCnZlcnNpb246Mi4xDQplbmQ6dmNhcmQNCg0K

--------------U6xBm0vPv5d6M0O2N6DDpMFW--
