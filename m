Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB71XvmR015128
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 20:33:57 -0500
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB71XiEO009347
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 20:33:45 -0500
Received: by wwj40 with SMTP id 40so7245266wwj.27
	for <linux-lvm@redhat.com>; Mon, 06 Dec 2010 17:33:43 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 7 Dec 2010 08:33:43 +0700
Message-ID: <AANLkTi=EyqkiemX6PRXiTVKGAkXW-L8VoGw0-BQrygv7@mail.gmail.com>
From: hansbkk@gmail.com
Subject: [linux-lvm] Configuring extent size
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
To: linux-lvm@redhat.com

There is a lot of apparently authoritative but conflicting information
on this topic out on the interwebs. I suspect the problem is that
changes from LVM1 to LVM2 weren't explicitly highlighted.

For example, I believe this is no longer true, but it still figures
prominently in returns from google:

> a 4 MB extent size imposes a logical volume size limitation of 256 Gigabytes

I believe the below is now true, and that this is the reason the above
is no longer relevant:

> with LVM2, there's no limit on the maximum numbers of extents per PV/LV.

IOW, the FAQ's statement:

> For 32-bit CPUs on 2.6 kernels, the maximum LV size is 16TB.

is a hard upper limit, and is not related to extent size - please confirm.


And is there a maximum size for PV or VG and would this be related to
extent size?


Also, the man page state that the *default* extent size (if none is
specified) is 4MB, but the HowTo states it's 32MB. Which is true?

Or does this vary by vgcreate version, or per-distro configuration?


Finally

> having a large number of extents will slow down the tools

leads me to:

Would there be any negative impact of a very large extent size?

I'm thinking of using 1GB (4096*256=1048576). This would make extents
human-friendly when used directly as units in allocating space. Even
10 GB would only be 2% of the smallest drive I'm using, so wouldn't
hamper flexibility, but IMO this seems a bit "out there".

Any and all feedback welcome.
