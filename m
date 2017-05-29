Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D324D73A
	for <linux-lvm@redhat.com>; Mon, 29 May 2017 18:32:51 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8C3DC049D5B
	for <linux-lvm@redhat.com>; Mon, 29 May 2017 18:32:50 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 7so65000529wmo.1
	for <linux-lvm@redhat.com>; Mon, 29 May 2017 11:32:50 -0700 (PDT)
References: <4857621d-c73a-081f-5264-cee196ddc6b2@mglug.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <2081009f-2975-a93e-9fee-085b96f36b89@gmail.com>
Date: Mon, 29 May 2017 20:32:48 +0200
MIME-Version: 1.0
In-Reply-To: <4857621d-c73a-081f-5264-cee196ddc6b2@mglug.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm.conf parameter for PVs to use for lvcreate ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Oliver Rath <rath@mglug.de>

Dne 23.5.2017 v 17:57 Oliver Rath napsal(a):
> Hi list,
> 
> if I use mulitiple PVs, Im able to select these PVs which should be used
> by my lv, i.e.
> 
> lvcreate --size 10G --name mylv myvg /dev/sda3 /dev/sdb3
> 
> Is it possible to set these "/dev/sda3 /dev/sdb3" as default in lvm.conf
> if nothing is explicitly given?
> 


You can set which PV is not 'allocatable'
(see 'man pvchange --allocatable)

This should be approximately what you want aim to have.

Regards

Zdenek
