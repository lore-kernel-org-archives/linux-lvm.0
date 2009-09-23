Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8NEeguD013511
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 10:40:42 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8NEeT84023206
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 10:40:29 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n8NEYKJv017900
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 08:34:20 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n8NEeJZm166554
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 08:40:25 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n8NEeFck021500
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 08:40:15 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n8NEeEvm021372
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 08:40:14 -0600
Date: Wed, 23 Sep 2009 07:40:13 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] accidentally removed an lv.  can i restore it?
Message-ID: <20090923144013.GA6380@us.ibm.com>
References: <1253715341.26295.521.camel@pc.interlinx.bc.ca>
	<20090923142132.GD3866@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090923142132.GD3866@agk-dp.fab.redhat.com>
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

Alasdair G Kergon [agk@redhat.com] wrote:
> Look into vgcfgrestore.

Also look at your /etc/lvm/archive/ for all archived metadata.  You
should be able to use '--list' option.
