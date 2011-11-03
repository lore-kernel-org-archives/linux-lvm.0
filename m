Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA36rWst029301
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2011 02:53:32 -0400
Received: from kenny.oneemedia.com (mail-o.oneemedia.com [92.240.244.203])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA36rUVG032733
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2011 02:53:31 -0400
Received: from MPODMAKA1.emea.hpqcorp.net (mail-o.oneemedia.com
	[92.240.244.203]) (Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTPA id 1D7D1200097
	for <linux-lvm@redhat.com>; Thu,  3 Nov 2011 07:53:29 +0100 (CET)
Date: Thu, 3 Nov 2011 07:53:28 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <1623746040.20111103075328@marki-online.net>
In-Reply-To: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
References: <4EB15A20.9000109@ankh.org>
	<825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
	Volume Group ?
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Wednesday, November 2, 2011, 16:06:12, Dan White wrote:

> This is on a RHEL 5.7 system.
> Is there a way to do this without the rebooting ?

Each layer must support the resize. For example we had issues with
multipath on SLES10 not being able to see the new LUN size. We were
using md raid1 over 2 LUNs from 2 arrays via multipath. So the only
solution except reboot was to break the mirror, remove device from
multipath, rescan busses so that all paths (/dev/sdX) see the new
size, apply it to multipath again (now it will see the new size) and
re-mirror. Then the same with the other side of mirror, then grow MD
device and finally grow PV. Of course it is not very useful if you
have big LUNs. On SLES11 multipath has command to rescan the new size
of underlying devices.

-- 
  bYE, Marki
