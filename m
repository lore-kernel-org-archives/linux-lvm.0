Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i63Gkc1m017124
	for <linux-lvm@redhat.com>; Sat, 3 Jul 2004 17:46:38 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Bgnew-0002rw-CV
	for linux-lvm@redhat.com; Sat, 03 Jul 2004 17:46:38 +0100
Date: Sat, 3 Jul 2004 17:46:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove - Can't expand LV: Mirror support
	missingfromkernel?
Message-ID: <20040703164638.GF32058@agk.surrey.redhat.com>
References: <20040703002208.GN10907@polop.usc.edu>
	<009801c460a5$be609ed0$0201a8c0@fosi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009801c460a5$be609ed0$0201a8c0@fosi>
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

On Sat, Jul 03, 2004 at 02:30:45PM +1200, Steve Wray wrote:
> Indeed and this is what I have in the .config for a kernel which can't 
> do a pvmove;
 
> CONFIG_DM_MIRROR=m

> oh and, yes, I did run modprobe dm-mirror.

What does 'dmsetup targets' return?
Does it include 'mirror' in the output list?
(And confirm what versions you're using: run 'lvm version')
 
Alasdair
-- 
agk@redhat.com
