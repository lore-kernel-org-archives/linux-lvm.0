Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9ON5pRE023621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2015 19:05:51 -0400
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mx1.redhat.com (Postfix) with ESMTPS id F172F8CF58
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2015 23:05:49 +0000 (UTC)
Received: by vkgs66 with SMTP id s66so20451573vkg.1
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2015 16:05:49 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 25 Oct 2015 01:05:48 +0200
Message-ID: <CAE8gLh=cgQLwZeXZGSVw06dt2U0F0XyzmYfY8EaFcksjv2uUsA@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: [linux-lvm] md: personality for level 1 is not loaded
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

I have an inconvenient boot-time phenomenon which prevents me from
booting a RAID1 mirrored root volume.

Reported it on Launchpad:
https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/1509717

It's most probably distro-specific, but I wonder if you have some comments.

Thanks if you check it out!


Best regards,
MegaBrutal
