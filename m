Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o94I0UXC002570
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 14:00:30 -0400
Received: from mail-px0-f174.google.com (mail-px0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o94I0Ka9014803
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 14:00:20 -0400
Received: by pxi10 with SMTP id 10so1671904pxi.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 11:00:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
Date: Mon, 4 Oct 2010 23:03:58 +0530
Message-ID: <AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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

It was a type error
on this lvm I created a filesystem in cfdisk whose type is 83 and
another whose type is 82.
On Mon, Oct 4, 2010 at 10:07 PM, Alexander Skwar
<alexanders.mailinglists+nospam@gmail.com> wrote:
> Hi!
>
> 2010/10/4 Tapas Mishra <mightydreams@gmail.com>
>
> […]
>> 20525 execve("/bin/mount", ["mount", "/dev/mapper/nintendo-backu"...,
> "/mnt/backup/"], [/* 18 vars */]) = 0
> […]
>
> Is that a typo "/dev/mapper/nintendo-backu"? If it is, or if it's just
> truncated output, what kind of filesystem is on "/dev/mapper/nintendo-backu"?
>
>
> Regards,
> Alexander
> --
> ↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
> ↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
