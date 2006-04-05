Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k35I3q0h021005
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 19:03:52 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FRCMC-00051Z-0i
	for linux-lvm@redhat.com; Wed, 05 Apr 2006 19:03:52 +0100
Date: Wed, 5 Apr 2006 19:03:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove to smaller PVs
Message-ID: <20060405180351.GY4197@agk.surrey.redhat.com>
References: <1144258458.32119.8.camel@pc7.dolda2000.com>
	<20060405174425.GX4197@agk.surrey.redhat.com>
	<1144259900.32119.11.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1144259900.32119.11.camel@pc7.dolda2000.com>
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

On Wed, Apr 05, 2006 at 07:58:19PM +0200, Fredrik Tolf wrote:
> However, is there a "canonical" way to check where PEs have been
> allocated inside PVs? 

lvs -o+devices
gives start PEs in parentheses

Alasdair
-- 
agk@redhat.com
