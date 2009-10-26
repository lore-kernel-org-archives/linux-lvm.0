Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QJsTUt007729
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 15:54:29 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QJsGxd003240
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 15:54:17 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9QJlU1f002982
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 13:47:30 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n9QJs3jw216944
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 13:54:06 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id n9QJs1JF021236
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 13:54:01 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9QJs1Kh021167
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 13:54:01 -0600
Date: Mon, 26 Oct 2009 12:54:00 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive
Message-ID: <20091026195400.GA27710@us.ibm.com>
References: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
	<20091026161005.GB23405@us.ibm.com>
	<1256585354.25834.61.camel@elm.bottlehall.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256585354.25834.61.camel@elm.bottlehall.co.uk>
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

Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> > pvmove followed by vgreduce. If you have enough free space, pvmove
> > should work and there is no need to add another new drive.
> > 
> Thanks, I will give this a go. I think I was getting confused between
> allocated and used. I thought the destination PV had to have enough
> unallocated extents on it to absorb the old PV data rather than just
> unused.

Allocated PEs is the number of PEs allocated to logical volumes, Free
PE's is the number PEs not yet allocated. Free PEs+Allocated PEs =
Total PEs.  I think you have enough free PEs to cover the old drive if I
remember your output correctly.

> I tried mounting it as you suggest and it muttered about it looking like
> swap. So, I checked and it is mounted as swap! That explains that one.
> The newer naming convention of ...lv_swap would have made this much
> clearer!

That explains why the '#open count is 1" in your lvdisplay output!

Thanks, Malahal.
