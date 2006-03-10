Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2AG4A104686
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 11:04:10 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2AG44nw000792
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 11:04:04 -0500
Received: by xproxy.gmail.com with SMTP id t14so496550wxc
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 08:04:04 -0800 (PST)
Message-ID: <6c3e3c670603100757k7b8632d1kf0b93542535059b3@mail.gmail.com>
Date: Fri, 10 Mar 2006 10:57:02 -0500
From: "Chad Rebuck" <chadrebuck@gmail.com>
Subject: Re: [linux-lvm] pvmove didn't work - now system won't boot
In-Reply-To: <6c3e3c670603091623h5eba4488y7dc8d96916a20af4@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
	<20060309165329.GC25789@percy.comedia.it>
	<6c3e3c670603090936j58ec03b0ke7e37d8b622d4ddd@mail.gmail.com>
	<6c3e3c670603091623h5eba4488y7dc8d96916a20af4@mail.gmail.com>
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

I am confident someone else will read and reply someday so I'll keep posting :)

I believe the source of my problem is that I reduced the size of my LV
by 10G to make room for the PV I moved.  However, I did not reduce the
filesystem by 10G so fsck is seeing the filesystem is too big for the
LV.

If I run 'e2fsadm -L-10G /dev/pv00/lv00' then maybe everything will
work once again?

This util wasn't available on my fedora 4 rescue CD but maybe I can
find it on knoppix or another rescue disk.

My file system is ext3.  Is this any problem with versions of e2fsadm
I am likely to find on popular live or recovery CDs?

Chad
