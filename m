Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o94H5fMR019794
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 13:05:41 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o94H5TfM005896
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 13:05:30 -0400
Received: by iwn5 with SMTP id 5so9263996iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 10:05:29 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
	<AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Mon, 4 Oct 2010 18:37:44 +0200
Message-ID: <AANLkTikg8U38VEwJOJY+=vSLLjeLK04VmtvmYBhpfjbV@mail.gmail.com>
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
Cc: Phillip Susi <psusi@cfl.rr.com>

Hi!

2010/10/4 Tapas Mishra <mightydreams@gmail.com>

[…]
> 20525 execve("/bin/mount", ["mount", "/dev/mapper/nintendo-backu"...,
"/mnt/backup/"], [/* 18 vars */]) = 0
[…]

Is that a typo "/dev/mapper/nintendo-backu"? If it is, or if it's just
truncated output, what kind of filesystem is on "/dev/mapper/nintendo-backu"?


Regards,
Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
