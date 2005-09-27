Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j8RDQ76S028873
	for <linux-lvm@redhat.com>; Tue, 27 Sep 2005 14:26:07 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EKFTC-0004ta-V7
	for linux-lvm@redhat.com; Tue, 27 Sep 2005 14:26:06 +0100
Date: Tue, 27 Sep 2005 14:26:06 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize not implemented,
	any way to use pvcreate instead?
Message-ID: <20050927132606.GL18976@agk.surrey.redhat.com>
References: <20050927102748.GU27884@neu.nirvana>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050927102748.GU27884@neu.nirvana>
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
To: linux-lvm@redhat.com

On Tue, Sep 27, 2005 at 12:27:48PM +0200, Axel Thimm wrote:
> Does this imply that I can use pvcreate to resize a pv? Or is there
> any other non-destructive way not involving creating new pvs?
 
https://www.redhat.com/archives/linux-lvm/2005-February/msg00021.html
https://www.redhat.com/archives/linux-lvm/2005-July/msg00027.html

Alasdair
-- 
agk@redhat.com
