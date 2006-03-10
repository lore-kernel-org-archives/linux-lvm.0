Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2A0NC117184
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 19:23:12 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2A0N28L032448
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 19:23:02 -0500
Received: by xproxy.gmail.com with SMTP id s18so385514wxc
	for <linux-lvm@redhat.com>; Thu, 09 Mar 2006 16:23:02 -0800 (PST)
Message-ID: <6c3e3c670603091623h5eba4488y7dc8d96916a20af4@mail.gmail.com>
Date: Thu, 9 Mar 2006 19:23:02 -0500
From: "Chad Rebuck" <chadrebuck@gmail.com>
Subject: Re: [linux-lvm] pvmove didn't work - now system won't boot
In-Reply-To: <6c3e3c670603090936j58ec03b0ke7e37d8b622d4ddd@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
	<20060309165329.GC25789@percy.comedia.it>
	<6c3e3c670603090936j58ec03b0ke7e37d8b622d4ddd@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

When I boot my system the two PVs are found, but it drops me to a
prompt when attempting to start LVM.  It says to run fsck manually
because there is a superblock or partition problem.  If I do run fsck
on /dev/volgroup/logvol it can't fix the problems because of a write
error.  I believe all my files are intact on the two remaining drives
but I just can't find out what needs to be done.  Between the man
pages and everything I have read so far I just can't figure it out.

If my root fs is on lvm I really have no way to copy/paste the output
of all these various commands.  How am I supposed to go about doing
so?

As my system boots it is trying to read PV or LV data from /dev/hdd -
which is not one of my drives now.  Is some part of LVM config trying
to read from this drive?  I ran "grep -r hdd /etc/lvm" and only found
references to this drive in the older configs, but it isn't in the
latest config.

Still looking for help,
Chad
