Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9QKUl1D007005
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 21:30:47 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GdBsF-0001uP-3K
	for linux-lvm@redhat.com; Thu, 26 Oct 2006 21:30:47 +0100
Date: Thu, 26 Oct 2006 21:30:47 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Mirror resync direction
Message-ID: <20061026203047.GW3928@agk.surrey.redhat.com>
References: <20061026211738.008da405@nim.leo>
	<20061026202702.GF1319@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061026202702.GF1319@agk.surrey.redhat.com>
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

On Thu, Oct 26, 2006 at 09:27:02PM +0100, Alasdair G Kergon wrote:
> Firstly, this is work in progress, so you should be using newer
> tools.  Secondly, with newer tools you should follow a different
> procedure: use vgreduce --removemissing (carefully) to remove the
> lost device, add the replacement disk to the VG in the normal
> way, then use lvconvert to turn the LV back into a mirror.
 
And I should add, dmeventd will do these steps automatically on failure if you
configure it into the lvm2 and device-mapper packages and apply the right
kernel patches (they're nearly ready for upstream submission).

Alasdair
-- 
agk@redhat.com
