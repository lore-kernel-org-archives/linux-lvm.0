Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k33FupsY011501
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 16:56:51 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FQRQB-0002ND-49
	for linux-lvm@redhat.com; Mon, 03 Apr 2006 16:56:51 +0100
Date: Mon, 3 Apr 2006 16:56:50 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] dmsetup works, but LVM2 fails
Message-ID: <20060403155650.GC4197@agk.surrey.redhat.com>
References: <m2psk0i1vs.fsf@janus.isnogud.escape.de>
	<20060403135204.GB4197@agk.surrey.redhat.com>
	<m2irpq4rmb.fsf@janus.isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2irpq4rmb.fsf@janus.isnogud.escape.de>
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

On Mon, Apr 03, 2006 at 05:15:56PM +0200, Urs Thuermann wrote:
> Do you mean by "For now" that this will change?  

A few people have had trouble over this, so I've gone ahead and
added some code to libdevmapper to handle the compatibility.  
It's inefficient, but at least it should work.

Alasdair
-- 
agk@redhat.com
