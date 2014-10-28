Received: from localhost (vpn1-5-137.ams2.redhat.com [10.36.5.137])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9SE968d016953
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 10:09:07 -0400
Date: Tue, 28 Oct 2014 14:09:06 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20141028140905.GA16396@debian>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
	<544C05A2.8090004@redhat.com>
	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
	<544C2897.6020708@redhat.com>
	<CACaajQtovTJHJQCh1uR7jojxyrpsjcrbO65qngyO6DvuDnYHWw@mail.gmail.com>
	<544E0D43.6010606@gmail.com>
	<CACaajQtS00j9wwTXePVA5qi3cb9PwXDukVnPktxZGOR_XtFAdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACaajQtS00j9wwTXePVA5qi3cb9PwXDukVnPktxZGOR_XtFAdQ@mail.gmail.com>
Subject: Re: [linux-lvm] [dm-devel] fix corrupted thin pool
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 28, 2014 at 05:55:12PM +0400, Vasiliy Tolstov wrote:
> thin_dump --repair /dev/mapper/vg1-tp1_tmeta0

thin_dump spits just spits out xml, it doesn't change the device it's
reading.  So the process is either:

thin_dump --repair <dev> > metadata.xml
thin_restore -i metadata.xml -o <dev>

or you can use the thin_repair tool which does both of these
processes.

> <superblock uuid="" time="27" transaction="120" data_block_size="128"
> nr_data_blocks="7290880">
> </superblock>

This is worrying, you seem to have no volumes in your pool?
