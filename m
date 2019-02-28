Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6254F1001DE2
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 21:31:38 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14634307E076
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 21:31:37 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c55so18283520edb.0
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 13:31:37 -0800 (PST)
Received: from [10.30.72.133] ([185.156.175.59])
	by smtp.gmail.com with ESMTPSA id 31sm2773372edr.7.2019.02.28.13.31.34
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 13:31:34 -0800 (PST)
From: kurcze <wannabeachicken@gmail.com>
Message-ID: <2b82b876-1fea-5eb4-e37f-bc8bd3262a83@gmail.com>
Date: Thu, 28 Feb 2019 22:31:33 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] LVM thin provisioning on encrypted root unreliable
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

Hello everyone,


I can't manage to get thinly provisioned LVM setup to work.

The problem is: I can't get to the decryption prompt to enter a password 
to decrypt root filesystem. It just hangs there.

My Setup:

VG with 3 PVs: 1 SSD, 1 HDD, 1 NVMe SSD

Thin pool in this VG with 2 LVs (for / and /var mountpoints)

both partitions are encrypted using LUKS


I've spent quite a lot of time trying many possible solutions. The worst 
thing is: sometimes it seems to work flawlessly for several boots. These 
moments convince me every time, that the previous solution I tried was 
the correct one and I can happily go on with my life. That is not the 
case. Sometimes it doesn't work the first 3 times (after reboot) and 
then suddenly it does (possibly after some tweaking with kernel 
parameters). I can't recognize any pattern. I can also reboot 3 times 
without doing anything and the 4th time it works.

Unfortunately I'm not a pro in this area and I don't know any way to 
debug it.

I would really appreciate the help. I would also gladly provide any 
additional information or command output. Following files might be helpful:

1. dmesg output from initramfs prompt (with Call Trace)

https://pastebin.com/HJkSixCs

2. journal output during shutdown (not cleanly unmounted stuff)

https://pastebin.com/2exWgbze

3. lsblk output

https://pastebin.com/gHttQZH2

4. grepped lsinitramfs with some relevant files

https://pastebin.com/RV1A55MQ

5. lvs with devices

https://pastebin.com/KUv7iiM4


Best regards,

kurcze
