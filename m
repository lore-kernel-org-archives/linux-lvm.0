Received: from [192.168.1.110] (vpn50-130.rdu.redhat.com [172.16.50.130])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j9ILEX3H019720
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 17:14:34 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1129665057.4262.7.camel@cantrell.patsoffice.com>
References: <1129665057.4262.7.camel@cantrell.patsoffice.com>
Message-Id: <85f72c0fd806dec224faff1ca6dd83a3@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Problem with LVM2 and device-mapper
Date: Tue, 18 Oct 2005 16:14:44 -0500
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

After a failed vgchange -ay, what does 'dmsetup ls' report?

I thought I've seen something like this in the past, but it always had 
to do with a partial load of a logical volume.

  brassow

On Oct 18, 2005, at 2:50 PM, Patrick Lawrence (LVM List) wrote:

> Hello,
>
> I am using CentOS 4 and just did an upgrade from 4.1 to 4.2 on my 
> x86_64
> home server.  After a reboot, one of my vol groups stopped working.
> It's a volume group spread across 2 disks and when I try to activate
> that volgroup I get the following:
>
> <snip>
> [root@hetfield mapper]# vgchange -ay VolGroup02
>    device-mapper ioctl cmd 9 failed: Invalid argument
>    Couldn't load device 'VolGroup02-DVD'.
>    1 logical volume(s) in volume group "VolGroup02" now active
> <snip>
>
> and the relevant portion of the /var/log/messages has:
>
> <snip>
> Oct 17 08:45:07 hetfield kernel: device-mapper: dm-linear: Device 
> lookup
> failed
> Oct 17 08:45:07 hetfield kernel: device-mapper: error adding target to
> table
> <snip>
>
> My other two volgroups are working fine.  It's just this third one that
> has problems.
>
> I did quite a bit of googling yesterday, but I didn't come up with much
> although I have to confess that I know jack about the device mapper...
>
> Is there anything I can provide to diagnose the problem further?  Since
> CentOS tracks RHEL4 very closely, I suspect this affects RHEL4 as well.
>
> Regards,
>
> Pat
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
