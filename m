Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAIAOFfP019886
	for <linux-lvm@redhat.com>; Sat, 18 Nov 2006 05:24:15 -0500
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAIAOAaJ001805
	for <linux-lvm@redhat.com>; Sat, 18 Nov 2006 05:24:10 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id 92B0F17FA97
	for <linux-lvm@redhat.com>; Sat, 18 Nov 2006 05:24:04 -0500 (EST)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 08905-03-2 for <linux-lvm@redhat.com>;
	Sat, 18 Nov 2006 05:24:02 -0500 (EST)
Date: Sat, 18 Nov 2006 05:24:02 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Message-ID: <20061118102402.GA6566@bdmcc-us.com>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
	<01dbd6887fd9d439599e31bda27f3883@redhat.com>
	<20061114230003.GA3401@bdmcc-us.com>
	<20061114230658.GP30653@agk.surrey.redhat.com>
	<20061117134435.GA32647@bdmcc-us.com>
	<20061117192124.GA4409@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061117192124.GA4409@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 17, 2006 at 07:21:24PM +0000, Alasdair G Kergon wrote:
> On Fri, Nov 17, 2006 at 08:44:35AM -0500, Brian McCullough wrote:
> > OK, as mentioned in previous messages, I have updated to the most recent
> > versions found on the FTP site ( lvm2 and dm )
> 
> If you see that with the latest (2.02.14) then we've still
> got a bug to fix there.
> 
> If you lost a partition table, look for something like 'gpart'
> to try to recreate it.  Then you'll need to recreate the PV
> and get the VG/LV back in place - the procedure depends on
> whether it's lvm1 or lvm2 metadata and how much info you still
> have (or can remember) about the layout.


The partition table is fine.  There are 5 ext2/3 partitions, one swap
partition and 5 LVM ( 8e ) partitions.  The LVM partitions appear to be
LVM version 1.


Thanks,
Brian



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
