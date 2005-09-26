Received: from o.ww.redhat.com (vpn50-6.rdu.redhat.com [172.16.50.6])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	j8QAlPBv029111
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2005 12:47:25 +0200
Date: Mon, 26 Sep 2005 12:47:24 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM Status?
Message-ID: <20050926104724.GA3517@redhat.com>
References: <D3DC8F9206F0D24085E459720ECDF3ED693EFF@mail-18ps.atlarge.net>
	<1127693099.15029.1.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1127693099.15029.1.camel@pc7.dolda2000.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Mon, Sep 26, 2005 at 02:04:58AM +0200, Fredrik Tolf wrote:
> On Sun, 2005-09-25 at 10:15 -0500, Don Shesnicky wrote:
> > How do you check the status of an LVM set of disks in RHEL3 and 4?
> > The LVM FAQ mentions that you should have a /proc/lvm but my default
> > RHEL3 and 4 systems do not have this directory in /proc and doing a
> > Modprobe for lvm-mod does not create one. On an RHEL4 test system I
> > do see an lvm tool but it doesn't show the status. 
> 
> I'm not *sure* about this, but I believe that /proc/lvm was only used
> for LVM 1.0,

True.

> while device-mapper doesn't have such a thing.

True.

> RHEL3 is
> based on a 2.6 kernel, right?

No, RHEL3 is 2.4 based, RHEL4 is based on 2.6.

> 
> How about the userspace tools instead? Try pvdisplay, vgdisplay or
> lvdisplay, depending on what info you want. Or is there some other info
> that you're hunting for?

If you're using LVM2 (ie, running RHEL4), you might want to look
at the output formatable tools pvs, vgs, lvs.

> 
> Fredrik Tolf
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
