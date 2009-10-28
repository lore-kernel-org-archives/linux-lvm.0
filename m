Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9SG82Wo021711
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 12:08:02 -0400
Received: from e8.ny.us.ibm.com (e8.ny.us.ibm.com [32.97.182.138])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9SG7nAO012704
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 12:07:50 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e8.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9SC4P3r026256
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 08:04:25 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9SG7nE8089880
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 12:07:49 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9SG7nv3022992
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 12:07:49 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9SG7mZJ022981
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 12:07:48 -0400
Date: Wed, 28 Oct 2009 09:07:47 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive - revisited
Message-ID: <20091028160747.GB11257@us.ibm.com>
References: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
	<20091028012931.GA27808@us.ibm.com>
	<1256714228.2246.15.camel@elm.bottlehall.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256714228.2246.15.camel@elm.bottlehall.co.uk>
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
> Hi Malahal
> 
> Thanks for your reply. I don't really want to use the new/temporary disc
> long-term, it seems that pvmove needs space to create a mirror-lv whilst
> it is working and it seemed possible that the original problem was that
> this extra space wasn't there.

As far as I know, you don't need extra space. The temporary mirror is
created to copy the data. I believe, it creates a corelog mirror and
should NOT need extra space. Let us hope someone responds from the
dm-devel list!
