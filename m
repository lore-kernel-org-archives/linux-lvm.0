Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8CFVwrI021619
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 16:31:58 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C6WKc-0005Bq-1K
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 16:31:58 +0100
Date: Sun, 12 Sep 2004 16:31:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove: ABORTING: Volume group metadata update failed.
Message-ID: <20040912153157.GL1094@agk.surrey.redhat.com>
References: <Pine.LNX.4.58.0409120340470.3989@philos.nvg.ntnu.no>
	<20040912114514.GI1094@agk.surrey.redhat.com>
	<1094990549l.5671l.0l@tangerine>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1094990549l.5671l.0l@tangerine>
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

On Sun, Sep 12, 2004 at 12:02:22PM +0000, Jean-Luc Coulon (f5ibh) wrote:
> Does running  "vgconvert -M2 vg00"  safe if vg00 is an active VG ?
 
Normally should be OK: it should detect situations when LVs 
mustn't be active (e.g. when they need renumbering) and gives 
an error instead.

Alasdair
-- 
agk@redhat.com
