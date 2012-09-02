Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q822DxMW023030
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:13:59 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q822DvRx006986
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:13:58 -0400
Received: by lbbgj3 with SMTP id gj3so2093016lbb.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 19:13:57 -0700 (PDT)
Received: by lagy9 with SMTP id y9so3292729lag.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 19:13:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+ZVM8vctTgXR27i6WMcLwLAq9_q2Dm4PPaaX8=pRQG_E+kmcA@mail.gmail.com>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
	<CANN7Ug34MtUPMorfLxZqRTG7CDsaP0vD+8CBk+e-B4+JG8tX5w@mail.gmail.com>
	<CA+ZVM8vctTgXR27i6WMcLwLAq9_q2Dm4PPaaX8=pRQG_E+kmcA@mail.gmail.com>
From: Scott Merrilees <scott@merrilees.net>
Date: Sun, 2 Sep 2012 12:13:33 +1000
Message-ID: <CANN7Ug3UvjyEtYyBDPv6C5QScq0PMSsG5OJ+GkSZYZj3e7o8Xg@mail.gmail.com>
Subject: Re: [linux-lvm] Removing vg and lv after physical drive has been
	removed
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

So noreboot fix wanted.  Potentially more difficult.

What about the other command, to collect the unique errors?  It should
show pv_uuids of missing pvs.

I was hoping to see vg04 config.  Since we do not, does that mean vg04
was entirely on the replaced disk?

IIRC I have previously recreated a pv with the uuid reported by pvs,
and then removed it cleanly.

You could also look in /etc/lvm/backup/vg04, and you should be able to
get the pv uuids from there.
--
Scott Merrilees
