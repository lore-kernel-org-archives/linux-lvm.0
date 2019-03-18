Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C51C19C7A
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 09:32:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6D05308FBAF
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 09:32:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id 33so16191885wrb.13
	for <linux-lvm@redhat.com>; Mon, 18 Mar 2019 02:32:50 -0700 (PDT)
Received: from [10.106.220.126] ([5.90.30.150])
	by smtp.gmail.com with ESMTPSA id
	y7sm14698697wmi.34.2019.03.18.02.32.47 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 02:32:48 -0700 (PDT)
Date: Mon, 18 Mar 2019 10:32:45 +0100
Message-ID: <ak8bf3vblfil31tj1fe375n3.1552901565436@gmail.com>
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

it is automatic 

though you should avoid power losses as better as you can

with online PSU against line interactive ones ( which are good for consumer PCs and displays)





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
