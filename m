Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i83IqFJ0019126
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 19:52:15 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C3JAU-0005De-My
	for linux-lvm@redhat.com; Fri, 03 Sep 2004 19:52:14 +0100
Date: Fri, 3 Sep 2004 19:52:14 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "broken" snapshot volume -- how to remove?
Message-ID: <20040903185214.GR6264@agk.surrey.redhat.com>
References: <Pine.LNX.4.44.0409032009040.30366-200000@lothlorien.homelinux.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0409032009040.30366-200000@lothlorien.homelinux.net>
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

On Fri, Sep 03, 2004 at 08:21:59PM +0200, Helge Bahmann wrote:
> I *have* to bring the vg into a consistent state and I urgently need to
> drop the snapshot volume -- is there any tool to manipulate lvm purely in
> userspace that can simply delete the snapshot volume?
 
LVM2 userspace tools would do this:
  Source code from http://sources.redhat.com/lvm2/
  To stop them talking to the kernel:
    configure --disable-devmapper 
  before compiling.

And of course you must deactivate all your LVs before using
them (ie vgchange -an).

Alasdair
-- 
agk@redhat.com
