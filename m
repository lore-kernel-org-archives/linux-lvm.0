Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t46DCIsP008854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 6 May 2015 09:12:19 -0400
Received: from smtp2.mail.ru (smtp2.mail.ru [94.100.179.91])
	by mx1.redhat.com (Postfix) with ESMTPS id C9AE66C
	for <linux-lvm@redhat.com>; Wed,  6 May 2015 13:12:16 +0000 (UTC)
Received: from [31.28.11.22] (port=50146 helo=[192.168.1.184])
	by smtp2.mail.ru with esmtpa (envelope-from <kv_sec@mail.ru>)
	id 1Ypz7W-0006BU-Ab
	for linux-lvm@redhat.com; Wed, 06 May 2015 16:12:14 +0300
Message-ID: <554A132D.7020505@mail.ru>
Date: Wed, 06 May 2015 16:12:13 +0300
From: Konstantin Krotov <kv_sec@mail.ru>
MIME-Version: 1.0
In-Reply-To: 9b5a3431cb59fb31b37bf9e944a186cd@alukardd.org
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin Pull LV suspended
Reply-To: kv_sec@mail.ru,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

> Hello.
>
> I need help in understanding why we got LV in suspended state.
>
> 16073      vg4  Vwi-sotz--  80.00g tp4           9.20
>
> In syslog we have this line:
>
> device-mapper: thin: Creation of new snapshot 106 of device 105 failed.
>
>
> This is host with VM under KVM. Accordingly to suspend state we have
> `qemu-system-x86` and `kworker` processes in "D"(uninterruptible
> sleep) state.
>
>
> We resume to normal state by entering "lvchange -ay /dev/vg4/16073".



Hello list!

I have a similar problem with suspend LV and VG.

Linux kernel 3.19.1

lvm> version
   LVM version:     2.02.106(2) (2014-04-10)
   Library version: 1.02.85 (2014-04-10)
   Driver version:  4.24.0

-- 
WBR
Konstantin V. Krotov
