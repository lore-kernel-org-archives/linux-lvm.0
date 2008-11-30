Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAUCYeiF001123
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 07:34:40 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1L6lVY-0005pC-3y
	for linux-lvm@redhat.com; Sun, 30 Nov 2008 12:34:40 +0000
Date: Sun, 30 Nov 2008 12:34:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize complains about too many metadata
Message-ID: <20081130123440.GG13235@agk.fab.redhat.com>
References: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
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

On Sat, Nov 29, 2008 at 04:13:31PM +0100, Fabio Coatti wrote:
>   /dev/md1: too many metadata areas for pvresize

That's meant to be saying you chose to place a second copy of the metadata at
the end of the device and if you want to increase the size of the data area you
have to shift that metadata first and there is no code that does that.

Workaround is to reduce to 1 metadata area first (backup VG, redo pvcreate with
uuid & restorefile, restore VG), then extend, then put the 2nd metadata area
back (same process) if you still want it.

Alasdair
-- 
agk@redhat.com
