Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8RBLHr24018
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 07:21:17 -0400
Received: from gateway.unetix.nl (a213-84-10-61.adsl.xs4all.nl [213.84.10.61])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8RBL76Z013548
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 07:21:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by gateway.unetix.nl (Postfix) with ESMTP id 5DA791F8FC2
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 13:21:00 +0200 (CEST)
Received: from [192.168.253.129] (unknown [192.168.253.129])
	by gateway.unetix.nl (Postfix) with ESMTP id 5514E1F8FC2
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 13:21:00 +0200 (CEST)
From: Wim Bakker <wim@unetix.nl>
Subject: Re: [linux-lvm] Devive mapper compile error
Date: Mon, 27 Sep 2004 13:21:05 +0200
References: <200409271222.55865.wim@unetix.nl>
	<20040927104812.GP11810@agk.surrey.redhat.com>
In-Reply-To: <20040927104812.GP11810@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200409271321.05456.wim@unetix.nl>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Monday 27 September 2004 12:48, Alasdair G Kergon wrote:
> On Mon, Sep 27, 2004 at 12:22:55PM +0200, Wim Bakker wrote:
> > ioctl/libdm-iface.c:982: error: dereferencing pointer to incomplete type
> >
> > What might be causing this?
>
> Missing header files or incorrect arguments to 'configure'?
> Check the instructions in the 'INSTALL' file carefully.
> (e.g. Most people shouldn't specify a kernel source dir).
>
> Alasdair

Yes , thanks , that was it , I gave a kernel dir as option,

now only vgdisplay -c doesn't work, but maybe it isn't an option anymore?


TIA
Wim Bakker
