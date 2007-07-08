Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l68HjPLQ020042
	for <linux-lvm@redhat.com>; Sun, 8 Jul 2007 13:45:25 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1I7ap3-0007Bm-Du
	for linux-lvm@redhat.com; Sun, 08 Jul 2007 18:45:25 +0100
Date: Sun, 8 Jul 2007 18:45:25 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Clone disk with LVM
Message-ID: <20070708174525.GZ30047@agk.fab.redhat.com>
References: <46897378.8040305@email.arc.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46897378.8040305@email.arc.nasa.gov>
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

On Mon, Jul 02, 2007 at 02:51:52PM -0700, Ryan Nelson wrote:
> It didn't even look like there was an option to 
> change the UUIDs for the lv. 
 
You don't need to.  LV UUIDs are always qualified by the VG UUID.
Create an LVM2 installation using LVM1 metadata with more than one VG
with at least one LV in each and you'll see duplicate LV UUIDs.

Alasdair
-- 
agk@redhat.com
