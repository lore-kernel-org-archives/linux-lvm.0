Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3H8gvQr010311
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 04:42:57 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3H8gOsg011539
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 04:42:24 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 81A4D8737B
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 10:42:24 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 2SW3Kiz4-8W3 for <linux-lvm@redhat.com>;
	Fri, 17 Apr 2009 10:42:24 +0200 (CEST)
Date: Fri, 17 Apr 2009 10:42:24 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Move an array/volgroup to another machine.
Message-ID: <20090417084224.GB1483@maude.comedia.it>
References: <49E757A9.6090108@verizon.net> <49E758EF.40309@brunson.com>
	<49E75944.9080100@brunson.com> <49E75DDD.7040500@verizon.net>
	<49E75FB5.2050700@brunson.com> <49E761B0.5020506@verizon.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49E761B0.5020506@verizon.net>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Apr 16, 2009 at 12:49:52PM -0400, Gerry Reno wrote:
> It's an 'md' software raid device.  I think we can probably just try to 
> assemble the array using the UUID.  Maybe something like:
> mdadm -vv -A /dev/md4 --uuid=UUID
>
the above depende on the device line in your mdadm.conf,
if it is something like 'DEVICE partitions' or 'DEVICE /dev/*' it should
work.
you still would like to have it in mdadm.conf for automatic activation
at boot.
i would run
mdadm -Esc partitions | grep UUID

maybe check the line you added to see if the minor is what you want
and add it to /etc/mdadm.conf

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
