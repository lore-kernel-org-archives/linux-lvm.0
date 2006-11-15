Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAF3jguM019125
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 22:45:42 -0500
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAF3jeIN017337
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 22:45:40 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id 5385817FA97
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 22:45:40 -0500 (EST)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 05301-02-3 for <linux-lvm@redhat.com>;
	Tue, 14 Nov 2006 22:45:39 -0500 (EST)
Date: Tue, 14 Nov 2006 22:45:39 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Message-ID: <20061115034539.GA5315@bdmcc-us.com>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
	<01dbd6887fd9d439599e31bda27f3883@redhat.com>
	<20061114230003.GA3401@bdmcc-us.com>
	<20061114230658.GP30653@agk.surrey.redhat.com>
	<20061115013248.GA4251@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061115013248.GA4251@bdmcc-us.com>
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

On Tue, Nov 14, 2006 at 08:32:48PM -0500, Brian McCullough wrote:
> On Tue, Nov 14, 2006 at 11:06:58PM +0000, Alasdair G Kergon wrote:
> > On Tue, Nov 14, 2006 at 06:00:03PM -0500, Brian McCullough wrote:
> > >   Internal error: PV segments corrupted in vg_system.
> > 
> > First update your lvm2 software to avoid that bug: you shouldn't
> > see internal errors!

OK, I went to the source and compiled the latest version of both the
library and LVM2.

Versions:

[root@clachan ~]# lvm version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.6.0


pvscan:

[root@clachan ~]# pvscan
  5 PV(s) found for VG vg_system: expected 6
  Logical volume (lvol4) contains an incomplete mapping table.
  PV segment VG free_count mismatch: 1381 != 2572
  PV segment VG extent_count mismatch: 1417 != 2608
  Internal error: PV segments corrupted in vg_system.



Do I need to rebuild my kernel, too?

B-)
