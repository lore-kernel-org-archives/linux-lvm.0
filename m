Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA3DiFV17026
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 08:44:15 -0500
Received: from storm.itahost.com (storm.itahost.com [83.148.74.3])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jA3DiEnw004093
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 08:44:15 -0500
From: Delian Krustev <linux-lvm@krustev.net>
Subject: Re: [linux-lvm] Unable to remove a pvmove LV
Date: Thu, 3 Nov 2005 15:44:08 +0200
References: <200511012135.50701.krustev@krustev.net>
	<20051102233722.GK26394@agk.surrey.redhat.com>
In-Reply-To: <20051102233722.GK26394@agk.surrey.redhat.com>
MIME-Version: 1.0
Message-Id: <200511031544.08827.linux-lvm@krustev.net>
Content-Transfer-Encoding: 8bit
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

On Thursday 03 November 2005 01:37, Alasdair G Kergon wrote:
> On Wed, Nov 02, 2005 at 10:28:20PM +0200, Delian Krustev wrote:
> > Surprisingly after trying to resume some minutes
> > later I've found the move had completed successfully.
>
> The userspace process just manage and monitor the pvmove - the actual
> work is done by a kernel thread.
>
> So killing the userspace processes doesn't stop the pvmove.
> Only pvmove --abort is capable of telling the kernel to
> abandon it.

The bug in the userspace is quite nasty though. Has it been reported and/or
fixed in the recent versions ?

Additionally, would you suggest a way to remove the stale LV ? Ofcourse
as a last step I might go creating a new VG and moving the data to it,
but moving a terrabyte is not s.t. I would like to do often.

On the other side, the stale LV is not causing any problems ..

Cheers,
Delian
