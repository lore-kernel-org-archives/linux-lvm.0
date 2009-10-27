Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9R0KNpK030123
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 20:20:23 -0400
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9R0KAvh011649
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 20:20:10 -0400
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9R0Fqu7030379
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 20:15:52 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9R0K9NS1224950
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 20:20:09 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9R0K8K1023310
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 20:20:09 -0400
Date: Mon, 26 Oct 2009 17:20:08 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive
Message-ID: <20091027002008.GA1106@us.ibm.com>
References: <7vgn6o$494l6v@smtpout.karoo.kcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7vgn6o$494l6v@smtpout.karoo.kcom.com>
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
To: postmaster@bottlehall.eclipse.co.uk
Cc: linux-lvm@redhat.com

postmaster@bottlehall.eclipse.co.uk [postmaster@bottlehall.eclipse.co.uk] wrote:
>    Fixed it!
> 
>    Rummaging around with dmsetup, I discovered that lvm wasn't making the
>    pvmove lv active - it was suspended. It seems everything trying to run
>    against it was waiting for it to unsuspend. Using dmsetup to resume it
>    then meant that pvmove --abort worked and then a normal re-boot followed.

That is good to know!

Thanks, Malahal.
