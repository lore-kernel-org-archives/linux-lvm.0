Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF75614C5
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 09:35:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2F6E3082AED
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 09:35:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y13so11657858wrd.3
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 02:35:12 -0700 (PDT)
Received: from [10.106.220.126] ([5.90.30.150])
	by smtp.gmail.com with ESMTPSA id t2sm35445943wra.9.2019.03.18.02.35.10
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 02:35:10 -0700 (PDT)
Date: Mon, 18 Mar 2019 10:35:07 +0100
Message-ID: <n05edth5kimisr299phhenn2.1552901707908@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
In-Reply-To: <69454a32-dee0-d57b-9be6-a4c02028f394@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Power loss consistency for RAID
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

but if a RAID got lost, you can always ask to 

https://www.RecuperoDatiRAIDFasTec.it

which is the unique data recovery company that has flat rates for raid recovery starting from 150,00 euro per disk

or the other way round, 900 euro for immediate/emergency recovery





	  Messaggio originale  



Da: lv.zheng.2015@gmail.com
Inviato: 18 marzo 2019 10:05
A: linux-lvm@redhat.com
Rispondi a: linux-lvm@redhat.com
Oggetto: [linux-lvm] Power loss consistency for RAID


Dear all,

I'm recently considering using software RAID instead of hardware
controllers for my home server.

AFAIK, write operation on a RAID array is not atomic across disks. I'm
concerned that what happens to RAID1/5/6/10 LVs after power loss.

Is manual recovery required, or is it automatically checked and repaired
on LV activation?

Also I'm curious about how such recovery works internally.

Many thanks,
Zheng Lv

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
