Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GJwogv030645
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 20:58:50 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Fg5gw-00013m-5o
	for linux-lvm@redhat.com; Tue, 16 May 2006 20:58:50 +0100
Date: Tue, 16 May 2006 20:58:50 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 tools<-->library<-->driver compatibility
Message-ID: <20060516195850.GK16180@agk.surrey.redhat.com>
References: <4468C22C.4050908@dogpad.net> <446A1E23.7050306@dogpad.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <446A1E23.7050306@dogpad.net>
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

On Tue, May 16, 2006 at 01:46:59PM -0500, Joe Harvell wrote:
> How can I determine which combinations should be compatible?  What 
> version of the tools/library do I need to downgrade to in my installed 
> environment?  

Don't downgrade userspace tools - upgrade them.  Best to use the same versions
of userspace packages in both environments.  But avoid snapshots.
(You'd need old packages on 2.4 to use them, and they're buggy anyway.)

The 2.4 kernel patches haven't been updated for some time and contain some 
bugs that already got fixed in the 2.6 tree.

Alasdair
-- 
agk@redhat.com
