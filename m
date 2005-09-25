Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j8PJUX71015475
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2005 20:30:33 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EJcCn-0000aT-2Q
	for linux-lvm@redhat.com; Sun, 25 Sep 2005 20:30:33 +0100
Date: Sun, 25 Sep 2005 20:30:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Mirror docs?
Message-ID: <20050925193032.GH18976@agk.surrey.redhat.com>
References: <1127592473.14915.2.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1127592473.14915.2.camel@pc7.dolda2000.com>
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

On Sat, Sep 24, 2005 at 10:07:53PM +0200, Fredrik Tolf wrote:
> cannot seem to find any documentation on how to use the LVM tools to
> actually set up mirroring.
 
The existing dm mirroring code is used by pvmove (move data using
temporary mirrors described on the pvmove man page).

Other lvm2 tools are in the process of being enhanced to support 
dm mirroring but this work is not finished yet.  [e.g. lvcreate -m]

Alasdair
-- 
agk@redhat.com
