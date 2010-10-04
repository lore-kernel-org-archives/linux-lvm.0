Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o94IV7NU012505
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 14:31:07 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o94IUu5P027393
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 14:30:56 -0400
Received: by iwn5 with SMTP id 5so9376717iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 11:30:56 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
	<AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
	<AANLkTinJF0pg+fwt2R6S5C2w6g31N4qqwmnnepjcYnB8@mail.gmail.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Mon, 4 Oct 2010 20:30:35 +0200
Message-ID: <AANLkTik6bkG0hc0_ZsW81S2kgYcDVVm6Zt_UhbWMdmpj@mail.gmail.com>
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

Hi.

2010/10/4 Tapas Mishra <mightydreams@gmail.com>:
> It was a type error
> on this lvm I created a filesystem in cfdisk whose type is 83 and
> another whose type is 82.

Okay. In cfdisk, you don't create filesystems. And cfdisk is
of no use for dealing with LVM (besides maybe creating
partitions which have to be made PVs with pvcreate).

Hence the question: What filesystem is on this lv? And I'd
like to restate the advice from someone else:

   Read the howto!

Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
