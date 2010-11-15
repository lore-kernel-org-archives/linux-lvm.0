Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFBswa4029002
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 06:54:59 -0500
Received: from ns.mindbit.ro (ns.mindbit.ro [80.86.127.26])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFBsicx005733
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 06:54:45 -0500
Received: from [192.168.243.1] ([193.39.73.67]) (authenticated bits=0)
	by ns.mindbit.ro (8.13.8/8.13.8) with ESMTP id oAFBshoq017665
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:54:43 +0200
From: Radu Rendec <radu.rendec@mindbit.ro>
Date: Mon, 15 Nov 2010 13:54:42 +0200
Message-ID: <1289822082.3353.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange "waiting" message
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
To: linux-lvm@redhat.com

Hello,

I've run across a strange message that keeps being logged on a recently
upgraded system:

lvm[1081]: Another thread is handling an event. Waiting...

This starts appearing during system services startup (the kernel is
already done booting, init is started etc) and keeps popping up every 10
seconds.

However, lvm seems to be working (I can list LVs, add new ones, perform
I/O on existing ones etc).

The system was originally installed with Centos 5 x86_32 and existing
VGs / LVs were created on that platform. Recently, the system has been
reinstalled with Fedora 14 x86_64, while keeping the lvm stuff
untouched.

All google searches about this message led to cases where people tried
strange things with mirroring and multipath, but this is not the case.
It's just a simple VG with one PV on top of a linux raid5 device.

Is there any simple way to figure out what's holding the lock and what's
waiting on it?

Any (well, almost ;) information about that system can be provided if
needed - I tried to keep this message short and not to include (possibly
irrelevant) system logs and/or info.

Thanks,

Radu Rendec
