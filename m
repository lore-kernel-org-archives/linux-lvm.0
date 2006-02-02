Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12NfE101786
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 18:41:14 -0500
Received: from mail.silentmedia.com (fire.silentmedia.com [216.254.19.118])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12Nf2DW018680
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 18:41:03 -0500
Received: from unknown (HELO babylon) (bench.silentmedia@[10.5.5.254])
	(envelope-sender <bench@silentmedia.com>)
	by 0 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Feb 2006 23:40:57 -0000
Date: Thu, 2 Feb 2006 15:40:57 -0800 (PST)
From: Ben <bench@silentmedia.com>
Subject: Re: [linux-lvm] Expanding volume groups to fill a growing disk
In-Reply-To: <20060202232526.GU4280@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.64.0602021537310.1276@localhost.localdomain>
References: <Pine.LNX.4.64.0602021457070.1276@localhost.localdomain>
	<20060202232526.GU4280@agk.surrey.redhat.com>
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

What version do I need?

[root@cash src]# pvresize --help
   pvresize: Resize a physical volume in use by a volume group

Not implemented.  Use pvcreate options.
[root@cash src]# pvresize --version
   LVM version:     2.01.08 (2005-03-22)
   Library version: 1.01.02 (2005-05-17)
   Driver version:  4.4.0


On Thu, 2 Feb 2006, Alasdair G Kergon wrote:

> On Thu, Feb 02, 2006 at 03:06:31PM -0800, Ben wrote:
>> Do I have to use fdisk to make a new partition, and then use pvcreate
>> followed by vgextend?
>
> pvresize, at least in recent releases.
>
> Alasdair
> -- 
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
