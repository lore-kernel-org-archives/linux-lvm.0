Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3EC5Lj14139
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 08:05:21 -0400
Received: from mx2.nwlehighsd.org (www.nwlehighsd.org [209.50.139.56])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3EC5Iu6029376
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 08:05:18 -0400
Received: from amavis by mx2.nwlehighsd.org with scanned-ok (Exim 3.35 #1
	(Debian)) id 1BDj8i-0006pL-00
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 08:05:12 -0400
Received: from mx2.nwlehighsd.org ([127.0.0.1])
	by localhost (oddprocess [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26202-01 for <linux-lvm@redhat.com>;
	Wed, 14 Apr 2004 08:05:12 -0400 (EDT)
Received: from matt by mx2.nwlehighsd.org with local (Exim 3.35 #1 (Debian))
	id 1BDj8i-0006pE-00
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 08:05:12 -0400
Date: Wed, 14 Apr 2004 08:05:12 -0400
From: Matthew Daubenspeck <matt@oddprocess.org>
Subject: Re: [linux-lvm] quota command does not work
Message-ID: <20040414120512.GE24583@oddprocess.org>
References: <20040413151723.GB19598@oddprocess.org>
	<20040414083919.GA22343@redhat.com>
	<1081943571.8758.1.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1081943571.8758.1.camel@leto.cs.pocnet.net>
Reply-To: matt@oddprocess.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 14, 2004 at 01:52:52PM +0200, Christophe Saout wrote:
> > chgrp disk /dev/mapper/*
> > chmod g=rw /dev/mapper/*
> > 
> > We need to fix that in dmlib (if not already done ;)
> 
> The problem seems to be the volume group directory which is set 700
> here. Changing it to 755 fixes the problem for me, even if the device
> nodes in /dev/mapper themselves are still 600.

Ah ha! Confirmed. It works here now as well, without touching
/dev/mapper. I should have checked that.

Thanks for the quick responses!

-- 
  Matthew Daubenspeck
  http://www.oddprocess.org

08:03:13 up 23 days, 22:14, 1 user, load average: 0.00, 0.00, 0.00
