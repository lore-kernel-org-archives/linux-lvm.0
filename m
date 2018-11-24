Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 497D086C20
	for <linux-lvm@redhat.com>; Sat, 24 Nov 2018 15:43:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5266B3082125
	for <linux-lvm@redhat.com>; Sat, 24 Nov 2018 15:43:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j207so7140017wmj.1
	for <linux-lvm@redhat.com>; Sat, 24 Nov 2018 07:43:40 -0800 (PST)
Received: from [192.168.10.22] (78-134-60-154.v4.ngi.it. [78.134.60.154])
	by smtp.gmail.com with ESMTPSA id
	a62sm4176343wmf.47.2018.11.24.07.43.37 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Nov 2018 07:43:37 -0800 (PST)
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <97fed68b-f7fc-e4c4-97f6-f253046d48fa@gmail.com>
Date: Sat, 24 Nov 2018 16:43:31 +0100
MIME-Version: 1.0
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM RAID: task mdX_raid1:221 blocked for more than 120
	seconds
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

Hello, I'm writing here to have your opinion and possibly some advice 
about some Debian bugs related to LVM RAID that are still unresolved:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913119
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913138
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=904822

Bug #913119 was filed by me, so I can personally provide some more 
information and do tests.

Premises related di Debian unstable:
* Debian's kernel is currently 4.18.20.
* From kernel 4.17~rc7 Debian enabled SCSI_MQ_DEFAULT and DM_MQ_DEFAULT.
* Debian's LVM userland is 2.02.176

The above reports shows blocked I/O with different type of LVM RAID and 
with #913119 I've succesfully workarounded passing the following kernel 
parameters:
scsi_mod.use_blk_mq=0 dm_mod.use_blk_mq=0

I've read that RHEL will default to enabling SCSI_MQ_DEFAULT and 
DM_MQ_DEFAULT and will use kernel 4.18. Maybe you have already 
encountered this bug and it's already resolved. Or there are patches 
pending.

What do you think? Should I file a bug in Red Hat bug tracker?

Please, keep me in CC as I'm not subscribed to the list.

Cesare.
