Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8LGBgin019291
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 17:11:42 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C9nF0-0004Wd-7g
	for linux-lvm@redhat.com; Tue, 21 Sep 2004 17:11:42 +0100
Date: Tue, 21 Sep 2004 17:11:42 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Hello. About a bug in lvm2
Message-ID: <20040921161142.GC11810@agk.surrey.redhat.com>
References: <41504CEF.8090508@cisko.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41504CEF.8090508@cisko.org>
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

On Tue, Sep 21, 2004 at 05:46:55PM +0200, Sebastian Hyrwall wrote:
> Im not sure but i may have found a bug in the lvm2 userspace-tools. Im 
> using gentoo right now and right now
> lvm2 cant "see" some harddrives.
 
Run vgscan -vvv, grep for lines mentioning the 'missing'
devices, and see what reasons it gives for ignoring them.

Alasdair
-- 
agk@redhat.com
