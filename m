Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA386608F2
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:25:25 +0000 (UTC)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C38130832C8
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:25:14 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id y22-v6so3126469wma.0
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 07:25:14 -0700 (PDT)
Received: from RL-MBPRO001.local (host81-150-47-5.in-addr.btopenworld.com.
	[81.150.47.5]) by smtp.gmail.com with ESMTPSA id
	w9-v6sm10247274wrk.28.2018.07.18.07.25.11 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 07:25:11 -0700 (PDT)
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
	<c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
	<CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
	<213e498ea447f141c7a975c13416281e@assyoma.it>
	<CAG+RErkPfHbBGS9p90nu_mFErMsPQanPwEYz24DP5Yh3jQUBKg@mail.gmail.com>
	<880611df631d8ad243b8c2974102bce8@assyoma.it>
From: Ryan Launchbury <ryan@magenta.tv>
Message-ID: <6946bbe9-3073-da99-b7d1-bceb978344a3@magenta.tv>
Date: Wed, 18 Jul 2018 15:25:10 +0100
MIME-Version: 1.0
In-Reply-To: <880611df631d8ad243b8c2974102bce8@assyoma.it>
Content-Type: multipart/alternative;
	boundary="------------DAE0342D44F54F709492B185"
Content-Language: en-GB
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------DAE0342D44F54F709492B185
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi all,

Does anyone have any other ideas or potential workarounds for this issue?

Please let me know if you require more info.

Best regards,
Ryan



Gionatan Danti wrote on 25/06/2018 18:40:
> Il 25-06-2018 19:20 Ryan Launchbury ha scritto:
>> Hi Gionatan,
>>
>> The system with the issue is with  writeback cache mode enabled.
>>
>> Best regards,
>>
>> Ryan
>
> Ah, I was under the impression that it was a writethough cache.
> Sorry for the noise.
>


--------------DAE0342D44F54F709492B185
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head><body text="#000000" bgcolor="#FFFFFF">Hi all,<br>
<br>
Does anyone have any other ideas or potential workarounds for this 
issue?<br>
<br>
Please let me know if you require more info.<br>
<br>
Best regards,<br>
Ryan<br>
<div class="moz-signature"><span style="font-family: arial,sans-serif; 
color: black; font-size: 7.5pt;"></span><br>
  <br>
</div>
<br>
<span>Gionatan Danti wrote on 25/06/2018 18:40:</span><br>
<blockquote type="cite" 
cite="mid:880611df631d8ad243b8c2974102bce8@assyoma.it">Il 25-06-2018 
19:20 Ryan Launchbury ha scritto:
  <br>
  <blockquote type="cite">Hi Gionatan,
<br>
<br>The system with the issue is with  writeback cache mode enabled.
<br>
<br>Best regards,
<br>
<br>Ryan
<br></blockquote>

  <br>
Ah, I was under the impression that it was a writethough cache.
  <br>
Sorry for the noise.
  <br>

  <br>
</blockquote>
<br>
</body></html>

--------------DAE0342D44F54F709492B185--
