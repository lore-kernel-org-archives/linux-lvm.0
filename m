Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8CBjFrI003775
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 12:45:15 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C6SnD-0001Y3-2b
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 12:45:15 +0100
Date: Sun, 12 Sep 2004 12:45:15 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove: ABORTING: Volume group metadata update failed.
Message-ID: <20040912114514.GI1094@agk.surrey.redhat.com>
References: <Pine.LNX.4.58.0409120340470.3989@philos.nvg.ntnu.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0409120340470.3989@philos.nvg.ntnu.no>
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

LVM2 pvmove only supports the new on-disk metadata format, not the 
old format used by LVM1, so you need to 'vgconvert' first: I'll add a 
specific error message to explain this!

Alasdair
-- 
agk@redhat.com
