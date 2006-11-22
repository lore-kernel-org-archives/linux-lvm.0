Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAMNlofc018458
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 18:47:50 -0500
Received: from smtp01.nagra.com (smtp01.nagra.com [212.249.41.203])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAMNlm9K031243
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 18:47:48 -0500
Received: from smtp01.nagra.com (localhost.localdomain [127.0.0.1])
	by localhost.nagra.com (Postfix) with ESMTP id 90678268004
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 00:47:47 +0100 (CET)
Received: from aten2.hq.k.grp (unknown [172.31.239.43])
	by smtp01.nagra.com (Postfix) with ESMTP id 844D5268001
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2006 00:47:47 +0100 (CET)
From: Martial Paupe <martial.paupe@nagra.com>
Subject: Re: [linux-lvm] Big question ...
Date: Thu, 23 Nov 2006 00:48:38 +0100
References: <200611222304.28368.martial.paupe@nagra.com>
	<200611222343.16722.martial.paupe@nagra.com>
	<4564D8CC.7050705@redhat.com>
In-Reply-To: <4564D8CC.7050705@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200611230048.38971.martial.paupe@nagra.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Ok I'm in origin state no. I will sleep now and tomorow I will study my 
problem.

Many thanks for your help. Unluckly I can't offer to you a big beer ;-)

Best regards
Martial


On Thursday 23 November 2006 00:10, Bryn M. Reeves wrote:
> Martial Paupe wrote:
> > Hello Bryn,
> >
> > On Wednesday 22 November 2006 23:29, Bryn M. Reeves wrote:
> > I think that you speak about LVM2. I use RHES 3.5 and the version of lvm
> > are lvm-1.0.8-14.
>
> Yes, I was referring to LVM2. LVM1 doesn't have the --removemissing flag
> to vgreduce.
>
> By default LVM1 should make a backup of the volume group metadata before
> the vgextend command adds a new PV- it's worth checking /etc/lvmconf to
> see if you can restore the old metadata.
>
> Use vgcfgrestore -f <file> -n <vgname> -ll to see the physical & logical
> volumes in the backups and restore from the last good one (only the
> metadata is restored - data in the LVs remains unchanged).
>
> See the man page for vgcfgbackup/vgcfgrestore for more details.
>
> Regards,
>
> Bryn.
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Martial Paupe
Kudelski Group
[D] +41 21 732 04 55
[E] martial.paupe<AT>nagra.com
