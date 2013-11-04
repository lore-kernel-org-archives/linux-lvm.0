Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rA4GWPWf018583
	for <linux-lvm@redhat.com>; Mon, 4 Nov 2013 11:32:25 -0500
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA4GWOi3004566
	for <linux-lvm@redhat.com>; Mon, 4 Nov 2013 11:32:24 -0500
Received: by mail-ea0-f170.google.com with SMTP id q10so2989165eaj.1
	for <linux-lvm@redhat.com>; Mon, 04 Nov 2013 08:32:23 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 4 Nov 2013 09:32:23 -0700
Message-ID: <CAFp1kvMP+S015OCOqf+fJXJVVsOg28DDKdaCfuiixf4ag3G79A@mail.gmail.com>
From: Shi Jin <jinzishuai@gmail.com>
Subject: [linux-lvm] Is there any way for LVM2 mirrored volume to continue
 to work after the mirror is broken
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

Hi there,

I was reading https://wiki.gentoo.org/wiki/LVM#Failed_mirrors and this
page seems to suggest that the LVM mirror works differently from LVM2
RAID-1 in that when one of the two disks involved in the mirror/raid-1
is failed/removed:
* LVM mirroring would actually stop working and block IO until the OS
is rebooted with vgchange --partial
* LVM raid1 would simply continue to work in the degraded mode.

I tested both cases and the above is definitely true. But I am simply
surprised that is the behavior of LVM mirroring and wonder if there is
any way to keep the remaining leg to work without the need to reboot.

Thanks a lot,
Shi
