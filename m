Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1F9MLxl016819
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2013 04:22:21 -0500
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1F9MJJj018514
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2013 04:22:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id E79DF1B435D
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2013 10:22:18 +0100 (CET)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qM6G21ohce7c for <linux-lvm@redhat.com>;
	Fri, 15 Feb 2013 10:22:18 +0100 (CET)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id BB7CA1B435C
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2013 10:22:18 +0100 (CET)
Date: Fri, 15 Feb 2013 10:22:16 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20130215092216.GD20791@soda.linbit>
References: <511BB48A.3010009@ubuntu.com> <511C33AF.7020506@shiftmail.org>
	<20130214005854.GF24130@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130214005854.GF24130@agk-dp.fab.redhat.com>
Subject: Re: [linux-lvm] pvmove doesn't work the way the man page says
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
To: linux-lvm@redhat.com

On Thu, Feb 14, 2013 at 12:58:54AM +0000, Alasdair G Kergon wrote:
> On Thu, Feb 14, 2013 at 01:45:35AM +0100, Spelic wrote:
> > breaking it up in smaller subsegments would probably have been wiser,  
> 
> The plan was always for more frequent checkpoints, but it involves more
> complicated code and there's simply been no need to do this: given how rarely
> pvmove is used, the current approach seems to be good enough and nobody's
> written the extra code yet.

Also, if you want more frequent checkpoints,
you can do that by calling pvmove appropriately:
just don't move the whole thing at once,
but repeatedly call pvmove with an explicit extent range.

	Lars
