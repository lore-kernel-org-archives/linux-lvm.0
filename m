Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n4KLYjc4000456
	for <linux-lvm@redhat.com>; Wed, 20 May 2009 17:34:45 -0400
Message-Id: <527EFB9A-53C8-4998-9A00-514EBEE73C70@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <1020a8600903052232q545ff5bch6230d16e5fc478c7@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] lvm - gfs2 - snapshots
Date: Wed, 20 May 2009 16:32:49 -0500
References: <1020a8600903052232q545ff5bch6230d16e5fc478c7@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

snapshots are not cluster-aware yet.  You wouldn't want to do this  
(because you would corrupt your snapshots)

  brassow

On Mar 6, 2009, at 12:32 AM, mantra UNIX wrote:

> Hi there,
> I can create a snapshot logical volume with gfs2 file-system. But  
> having a hard time mounting the snapshot,  Is it possible with GFS2 ?
>
>
>
> -- 
> Regards,
> mantra - Instrument of Thought
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
