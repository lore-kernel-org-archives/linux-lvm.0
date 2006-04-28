Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3SM93eA025743
	for <linux-lvm@redhat.com>; Fri, 28 Apr 2006 18:09:03 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1C4766A743ADF74FAEDF2AAD0679BAA207EF5D59@cacexc03.americas.cpqcorp.net>
References: <1C4766A743ADF74FAEDF2AAD0679BAA207EF5D59@cacexc03.americas.cpqcorp.net>
Message-Id: <6ba120aac522ac2271dd48b02b456089@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Running LVM commands in parallel
Date: Fri, 28 Apr 2006 17:11:05 -0500
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

anymore info on the type of failure?  output?

  brassow

On Apr 28, 2006, at 1:51 PM, Stern, Rick (Serviceguard Linux) wrote:

> Will the following work?  This is to test a function that uses LVM
> command.
>
> I have multiple scripts that are running in parallel.
> Each script is associated with one volume group.
> In the script are vgchange commands to activate the VG,
> file system mounts, file writes, and unmounts and then a
> deactivate of the VG.
>
> So it is possible to have a 2 instances of vgchange running at the same
> time (on different VGs).
>
> The reason I'm asking is that I am getting a failure where a deactivate
> does not work on
> a VG after running these scripts for about 12 hours.
>
> Thanks,
> Rick
>
>
>
> Rick Stern
> Serviceguard for Linux Program Manager and Architect
> Hewlett-Packard
> Availability Clusters Solutions Lab
> 408-873-5252
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
