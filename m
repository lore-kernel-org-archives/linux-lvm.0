Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jA2NbMm1015030
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2005 23:37:22 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EXSAU-0005RD-L3
	for linux-lvm@redhat.com; Wed, 02 Nov 2005 23:37:22 +0000
Date: Wed, 2 Nov 2005 23:37:22 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unable to remove a pvmove LV
Message-ID: <20051102233722.GK26394@agk.surrey.redhat.com>
References: <200511012135.50701.krustev@krustev.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200511012135.50701.krustev@krustev.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Nov 02, 2005 at 10:28:20PM +0200, Delian Krustev wrote:
> Surprisingly after trying to resume some minutes
> later I've found the move had completed successfully.
 
The userspace process just manage and monitor the pvmove - the actual
work is done by a kernel thread.

So killing the userspace processes doesn't stop the pvmove.
Only pvmove --abort is capable of telling the kernel to
abandon it.

Alasdair
-- 
agk@redhat.com
