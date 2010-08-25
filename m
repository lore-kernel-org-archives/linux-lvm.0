Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7PCMZpV008839
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 08:22:36 -0400
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7PCMQl4016331
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 08:22:27 -0400
Received: by yxg6 with SMTP id 6so170269yxg.33
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 05:22:26 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <4C74FED0.5000603@redhat.com>
References: <loom.20100825T100856-592@post.gmane.org>
	<4C74FED0.5000603@redhat.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Wed, 25 Aug 2010 14:14:27 +0200
Message-ID: <AANLkTin_Bwrj=2wHQM_jQH2KAkf8FbtiApSzsvwrRBEz@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can't remove snapshot at first
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello!

2010/8/25 Milan Broz <mbroz@redhat.com>:
> On 08/25/2010 10:12 AM, Alexander Skwar wrote:
>> I noticed, that rather often, I'm unable to remove an unused
>> snapshot volume at first command execution. See this:
>>
>> --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot
>>   Can't remove open logical volume "Home-Backup_Snapshot"
>>
>> --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot
>> Do you really want to remove active logical volume Home-Backup_Snapshot? [y/n]:
>>
>> Between those two commands, I did not do anything at all! I ran the
>> commands directly after each other in like 5 seconds or so.
>
> I t is possible that udev run some async scan in reaction to even (during snap manipulation).
>
> Distro maintainers should probably update lvm udev rules
> (and possibly udisks rules etc) to work relieably.

Guess so.

> Upstream lvm2 with combination of recent udev and udisks package
> should have this fixed (hopefully).

Hm. I have udisks 1.0.1 installed.
http://cgit.freedesktop.org/DeviceKit/DeviceKit-disks/
lists 1.0.1 as the most recent, so what should Arch Linux do in this
case?

Same for udev - http://www.kernel.org/pub/linux/utils/kernel/hotplug/?C=M;O=D
lists udev-161 as the latest and I do have udev-161 installed.

But LVM2 is indeed out of date - I've got 2.02.70. Would've .71 or .73 have
fixed this?

BTW: I'm on kernel 2.6.35.3-1. Well, I guess that should be 2.6.35.3,
but should the
uname -a output show 2.6.35.3?

Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
