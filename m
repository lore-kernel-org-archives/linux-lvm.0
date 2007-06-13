Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5D1qttc007407
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2007 21:52:56 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.240])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5D1qsku017997
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2007 21:52:54 -0400
Received: by an-out-0708.google.com with SMTP id c31so10675ana
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2007 18:52:54 -0700 (PDT)
Message-ID: <89f9efee0706121852rb00a21oab00877f4af43dfd@mail.gmail.com>
Date: Tue, 12 Jun 2007 21:52:54 -0400
From: "Leonard Smith" <lrsmith@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM2 resync speed problems
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I am running CentOS4.4 on  two "black" box systems that are
identically configured. Both have 500 GB internal drives, ( same type)
and were installed using the same kickstart configuration. The drives
are being mirrored using LVM.

When I check the first system it is re-syncing and the resync time and speed are

finish=18559.6min speed=355K/sec

On the second system the time and speed are

finish=89.5min speed=68170K/sec

I can't figure out why the speeds are different between the two. I
checked /proc/sys/dev/raid/speed_limit_ and they are the same. The
priority of the md proceses are they same.

I tweaked the setting of the speel_limit_min and increase the nice
priority of the resync process, on the first box, but I could never
get it better than

finish=4551.8min speed=1445K/sec


I've googled and I haven't found much more useful information that to
adjust those settings. Besides those setting what else dictates the
speed used?

Thanks,
Len
