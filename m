Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAHDic3s018868
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 08:44:38 -0500
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAHDiavO022546
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 08:44:37 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id 02F8317FA9B
	for <linux-lvm@redhat.com>; Fri, 17 Nov 2006 08:44:36 -0500 (EST)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 00302-01-4 for <linux-lvm@redhat.com>;
	Fri, 17 Nov 2006 08:44:35 -0500 (EST)
Date: Fri, 17 Nov 2006 08:44:35 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Message-ID: <20061117134435.GA32647@bdmcc-us.com>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
	<01dbd6887fd9d439599e31bda27f3883@redhat.com>
	<20061114230003.GA3401@bdmcc-us.com>
	<20061114230658.GP30653@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061114230658.GP30653@agk.surrey.redhat.com>
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

On Tue, Nov 14, 2006 at 11:06:58PM +0000, Alasdair G Kergon wrote:
> On Tue, Nov 14, 2006 at 06:00:03PM -0500, Brian McCullough wrote:
> >   Internal error: PV segments corrupted in vg_system.
> 
> First update your lvm2 software to avoid that bug: you shouldn't
> see internal errors!


OK, as mentioned in previous messages, I have updated to the most recent
versions found on the FTP site ( lvm2 and dm ), but I am still getting
the same internal error being reported.  Do I need to do something with
the kernel?  I am running 2.6.17 on an AMD X86_64.

Is there somewhere in the LVM code that I could look for where this
internal error is being generated, so that I could perhaps dump the data
structures?


Thank you,
Brian
