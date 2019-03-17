Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE7991001DFE
	for <linux-lvm@redhat.com>; Sun, 17 Mar 2019 15:05:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CF4381F25
	for <linux-lvm@redhat.com>; Sun, 17 Mar 2019 15:05:32 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id n125so9520020pfn.5
	for <linux-lvm@redhat.com>; Sun, 17 Mar 2019 08:05:32 -0700 (PDT)
Received: from [0.0.0.0] ([59.78.1.187]) by smtp.gmail.com with ESMTPSA id
	q62sm9875253pga.32.2019.03.17.08.05.29 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 08:05:30 -0700 (PDT)
From: Zheng Lv <lv.zheng.2015@gmail.com>
Message-ID: <69454a32-dee0-d57b-9be6-a4c02028f394@gmail.com>
Date: Sun, 17 Mar 2019 23:05:23 +0800
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm]  Power loss consistency for RAID
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
To: linux-lvm@redhat.com

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
