Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k41Ffost010989
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 11:41:50 -0400
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k41Ffkm4012649
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 11:41:46 -0400
Received: from cacexg13.americas.cpqcorp.net (cacexg13.americas.cpqcorp.net
	[16.92.1.76]) by palrel13.hp.com (Postfix) with ESMTP id BF18935A2A
	for <linux-lvm@redhat.com>; Mon,  1 May 2006 08:41:38 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 1 May 2006 08:41:14 -0700
Message-ID: <1C4766A743ADF74FAEDF2AAD0679BAA207EF63FF@cacexc03.americas.cpqcorp.net>
From: "Stern, Rick (Serviceguard Linux)" <rick.stern@hp.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RE: linux-lvm Digest, Vol 26, Issue 18
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
To: linux-lvm@redhat.com

I'm working with another engineer on this.  He's a little unfamiliar
with 
this area but I'll try to get him to signup on the list and respond 
directly.

The script dumps a fair amount of info after a failure and so far there
is
nothing that is suspect in that data, i.e. it seems that there are no 
active mounts our anything else open.  

He will be putting a few more tests & basic debug print statements into
the 
script - including between the unmount and the deactivate.  Obviously
this 
will change some timing.  Also, I've asked him to re-try the deactivate
in 
the script after the first failure. As we have more info, we'll post it.

Thanks,
Rick

------------------------------------------------------------------------
Date: Fri, 28 Apr 2006 17:11:05 -0500
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Running LVM commands in parallel
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <6ba120aac522ac2271dd48b02b456089@redhat.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed

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
> So it is possible to have a 2 instances of vgchange running at the
same
> time (on different VGs).
>
> The reason I'm asking is that I am getting a failure where a
deactivate
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
