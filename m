Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i82HgUJ0017040
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 18:42:30 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C2vbS-0005Hy-B8
	for linux-lvm@redhat.com; Thu, 02 Sep 2004 18:42:30 +0100
Date: Thu, 2 Sep 2004 18:42:30 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: partition strategy
Message-ID: <20040902174230.GG6264@agk.surrey.redhat.com>
References: <412CE781.9000409@m-cam.com> <41363AA0.5030107@m-cam.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41363AA0.5030107@m-cam.com>
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

On Wed, Sep 01, 2004 at 05:09:52PM -0400, Arshavir Grigorian wrote:
> >Is it better to create 3 partitions 2 x230G + 1G 
> >OR
> >Is it better to create 2 paritions 230G and 231G, put both in a vg, 

The VG contains the same space in both cases so do the simplest
ie the first option.  In both cases you'll need to run lvcreate for
460G followed by lvextend for 1G.

Alasdair
-- 
agk@redhat.com
