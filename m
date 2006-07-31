Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6V7wohG004011
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 03:58:50 -0400
Received: from dot.freshdot.net
	(IDENT:c7b4ea6b28ee7a1aae1060ccbc2b331b@dot.freshdot.net
	[80.69.73.239])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6V7wlvc008048
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 03:58:49 -0400
Received: from ssmeenk by dot.freshdot.net with local (Exim 4.62)
	(envelope-from <ssm+lvm@freshdot.net>) id 1G7Sfm-0008N5-51
	for linux-lvm@redhat.com; Mon, 31 Jul 2006 09:58:46 +0200
Date: Mon, 31 Jul 2006 09:58:46 +0200
From: Sander Smeenk <ssm+lvm@freshdot.net>
Subject: Re: [linux-lvm] Performance impact of LVM
Message-ID: <20060731075846.GA32150@freshdot.net>
References: <20060727120250.GB17454@freshdot.net>
	<44C8DC2D.3000408@conterra.de>
	<Pine.LNX.4.64.0607280846060.6888@mhw.ulib.iupui.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0607280846060.6888@mhw.ulib.iupui.edu>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Quoting Mark H. Wood (mwood@IUPUI.Edu):

> Some uses of LVM *could* increase I/O wait time.  It's easy to paste new 
> extents onto existing volumes, and the new extent probably won't be 
> contiguous with the old one.  So you *could* see longer average seek 
> delays due to additional arm travel distance between extents.  It's 
> strongly dependent on access patterns.

Hmm. Yeah, this setup i'm using was created and thereafter never changed
(yet). So i guess it should all still be contiguous...

Thanks for the info though. I'll see if i can do some tests when i get
my new hardware to play with. But as said before, it's probably not even
measurable. The added latency that is...

Thanks!
Sander.
-- 
| The older you get, the better you realize you were.
| 1024D/08CEC94D - 34B3 3314 B146 E13C 70C8  9BDB D463 7E41 08CE C94D
