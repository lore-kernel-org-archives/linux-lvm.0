Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KNKWV07621
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 19:20:32 -0400
Received: from mammoth.jinr.ru (mammoth.jinr.ru [159.93.44.107])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9KNKMwH003949
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 19:20:23 -0400
Received: from mammoth.jinr.ru (localhost.localdomain [127.0.0.1])
	by mammoth.jinr.ru (8.13.1/8.13.1) with ESMTP id j9KNKL4d018053
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 03:20:21 +0400
Received: from localhost (vvm@localhost)
	by mammoth.jinr.ru (8.13.1/8.13.1/Submit) with ESMTP id j9KNKLar018048
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 03:20:21 +0400
Date: Fri, 21 Oct 2005 03:20:21 +0400 (MSD)
From: Valery Mitsyn <vvm@mammoth.jinr.ru>
Subject: Re: [linux-lvm] Problem with LVM2 and device-mapper
In-Reply-To: <1129665057.4262.7.camel@cantrell.patsoffice.com>
Message-ID: <Pine.LNX.4.63.0510210311020.15833@mammoth.jinr.ru>
References: <1129665057.4262.7.camel@cantrell.patsoffice.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Patrick,

I am using Scientific Linux CERN SLC release 4.1.
got the some problem after upgrade too.


On Tue, 18 Oct 2005, Patrick Lawrence (LVM List) wrote:

> Hello,
>
> I am using CentOS 4 and just did an upgrade from 4.1 to 4.2 on my x86_64
> home server.  After a reboot, one of my vol groups stopped working.
> It's a volume group spread across 2 disks and when I try to activate
> that volgroup I get the following:
>
> <snip>
> [root@hetfield mapper]# vgchange -ay VolGroup02
>   device-mapper ioctl cmd 9 failed: Invalid argument
>   Couldn't load device 'VolGroup02-DVD'.
>   1 logical volume(s) in volume group "VolGroup02" now active

  Got the some problem after upgrade too.
For me it was "/sbin/dmraid -i -a y" in /etc/rc.d/rc.sysinit
which grab and lock somehow PV on PDC (hmmm. RAID card).
I don't know how it happend in details but looks like
"rpm -e dmraid" should help.

> <snip>
>
> and the relevant portion of the /var/log/messages has:
>
> <snip>
> Oct 17 08:45:07 hetfield kernel: device-mapper: dm-linear: Device lookup
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

-- 
Best regards,
  Valery Mitsyn
