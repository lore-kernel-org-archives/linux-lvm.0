Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5JG3Rj2019440
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 17:03:27 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BbiJT-0005RV-EM
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 17:03:27 +0100
Date: Sat, 19 Jun 2004 17:03:27 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgcfgbackup: backup of several VGs into one file fails
Message-ID: <20040619160327.GC6302@agk.surrey.redhat.com>
References: <200406191345.32913.mailinglisten@hauke-laging.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200406191345.32913.mailinglisten@hauke-laging.de>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jun 19, 2004 at 01:45:32PM +0200, Hauke Laging wrote:
> I just tried to make a backup of all my VGs into one file using the 
> following command:

LVM2 text metadata files can only only hold a single VG at the moment.
vgcfgbackup should enforce that, but doesn't - I'll fix it.

The long-term plan is to allow them to hold multiple VGs but the
library certainly doesn't support that yet.

I'll think about it a bit and add a different extension to vgcfgbackup 
to make it easy to back up everything at once (maybe filename prefix or 
template option).
 
Alasdair
-- 
agk@redhat.com
