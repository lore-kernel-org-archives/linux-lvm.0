Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i71IMLa16117
	for <linux-lvm@redhat.com>; Sun, 1 Aug 2004 14:22:21 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i71IMKe1008504
	for <linux-lvm@redhat.com>; Sun, 1 Aug 2004 14:22:20 -0400
Received: by mproxy.gmail.com with SMTP id 76so108904rnl
	for <linux-lvm@redhat.com>; Sun, 01 Aug 2004 11:22:20 -0700 (PDT)
Message-ID: <902f774f0408011122195d73cc@mail.gmail.com>
Date: Sun, 1 Aug 2004 20:22:20 +0200
From: Marius Gravdal <mariusg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] hdd failure
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

One of the disks that made my LVM go bye-bye in the first place seems
to be dying aswell. Is there any way to make sure there's no data on
it before I remove it from the lv/vg? I've restored the lv, but I'm
reluctant to use it since one of the hdd's is spitting out a lot of
errors.

If I remember correctly it's one of the drives that I last put in, so
I don't think there's any data on it at all, but I'm not entirely
sure.

And if I do an lvreduce/vgreduce, how am I sure that it removes the
hdd I want to get out?

Sorry if I'm asking very obious questions here, but I'm not quite in
to the LVM logic yet :)

-- marius
