Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8BEWX5H013859
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 10:32:33 -0400
Received: from lists.geoinf.fu-berlin.de (lists.geoinf.fu-berlin.de
	[160.45.89.23])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m8BEWQuu005357
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 10:32:27 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by lists.geoinf.fu-berlin.de (Postfix) with ESMTP id 923D918359
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 16:32:26 +0200 (CEST)
Message-ID: <48C92BDA.3010602@fu-berlin.de>
Date: Thu, 11 Sep 2008 16:31:54 +0200
From: Sebastian Walter <sebastian.walter@fu-berlin.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove abort
References: <48C92937.9090506@fu-berlin.de>
	<20080911142828.GC24064@agk.fab.redhat.com>
In-Reply-To: <20080911142828.GC24064@agk.fab.redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

"pvmove --abort" solved the problem. It cleaned the mirrored LV and
everything looks sane now. Thank you very much!


Alasdair G Kergon wrote:
> pvmove --abort is the correct way to stop a pvmove.
> Then see how much got moved and decide if you want to pvmove it back.
>
> The man page explains how it works, but the data moving happens in
> the kernel - in the background if you like - and after the move begins,
> the 'pvmove' process just monitors progress and tidies up when the
> kernel has finished what it's been asked to do.
>
> Alasdair
>   
