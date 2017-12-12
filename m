Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F354F9A0
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2017 15:22:19 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EABFFC04AC47
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2017 15:22:18 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f140so20972417wmd.2
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2017 07:22:18 -0800 (PST)
References: <VI1PR05MB15032E32F70BEB2B14AABE56D1340@VI1PR05MB1503.eurprd05.prod.outlook.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <2c45e680-f84d-b067-dd52-684e45560b6a@gmail.com>
Date: Tue, 12 Dec 2017 16:22:15 +0100
MIME-Version: 1.0
In-Reply-To: <VI1PR05MB15032E32F70BEB2B14AABE56D1340@VI1PR05MB1503.eurprd05.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM2 - pvresize alert
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?VESEL=c3=8dK_Jan?= <jveselik@csob.cz>

Dne 12.12.2017 v 14:13 VESELÍK Jan napsal(a):
> Hello,
> 
> I would like to suggest small tweak in command pvresize. If you use parameter 
> –setphysicalvolumesize, you will get only pasive wargning with this 
> potentially dangerous action. In comparrison to lvresize with parameter –L -, 
> meaning making logical volume smaller, you receive warning and prompt to 
> continue.
> 
> Is it possible to implement this kind of prompt to enter yes or no before 
> every lvm action that could pottentially lead to data loss.

Hi

Latest versions (>= 2.02.171) of lvm2 provides this prompt:


# pvs
   PV         VG Fmt  Attr PSize   PFree
   /dev/loop0 vg lvm2 a--  <30,00g <30,00g


# pvresize --setphysical 1T /dev/loop0
   WARNING: /dev/loop0: Overriding real size 30,00 GiB. You could lose data.
/dev/loop0: Requested size 1,00 TiB exceeds real size 30,00 GiB. Proceed?  [y/n]:



Regards

Zdenek
