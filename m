Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i7NDcMRE003557
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2004 15:38:22 +0200
Date: Mon, 23 Aug 2004 15:38:22 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] restore question
Message-ID: <20040823133822.GA9740@redhat.com>
References: <20040822133158.GB6714@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040822133158.GB6714@localhost>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Sun, Aug 22, 2004 at 03:31:58PM +0200, Fraser Pringle wrote:
> Hi,
> 
> I have a problem with using lvm and I'd be grateful for some advice.
> 
> I have a data volume group "datavg" on a mirrored raid partion that was running
> fine until I experienced a system crash.  After the crash the /dev/md0
> raid device was not recognised by the lvm system and neither was the
> datavg.  After finding some advice on this list I ran the commands:
> 
> pvcreate /dev/md0
> vgcfgrestore -n datavg /dev/md0
> vgscan
> 
> to restore the datavg.  This seemed to work, however, the volume group
> seems to have been restored to a point some time in the past, i.e. there
> are many files missing.  I'm not too sure how this could have happend as
> all the reading I've done seems to suggest that the vgcfgrestore command
> should just have restored the configuration and not any data.

Right, the vgcfgrestore restored the most recent LVM metadata to the device.

This doesn't change any data content withing Logical Volumes.

> Have I
> somehow restored a snapshot of the volume group?  Does anyone have any
> suggestions as to how I might retrieve my data?

Hard to tell waht happened without more information.

What does lvscan show ?
What does lvdisplay show on the LVs ?

> 
> Any advice would be very welcome.
> 
> Regards,
> Fraser
> 
> lvm version: 1.0.8-4
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
