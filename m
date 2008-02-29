Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1TJZfaf025619
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:35:41 -0500
Received: from biscayne-one-station.mit.edu (BISCAYNE-ONE-STATION.MIT.EDU
	[18.7.7.80])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1TJZ93k015180
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:35:09 -0500
Received: from outgoing.mit.edu (OUTGOING-AUTH.MIT.EDU [18.7.22.103])
	by biscayne-one-station.mit.edu (8.13.6/8.9.2) with ESMTP id
	m1TJZ3ZK024762
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:35:03 -0500 (EST)
Received: from [10.0.0.102] (c-65-96-107-158.hsd1.ma.comcast.net
	[65.96.107.158]) (authenticated bits=0)
	(User authenticated as ghudson@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.13.6/8.12.4) with ESMTP id m1TJZ2tc007873
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:35:03 -0500 (EST)
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
From: Greg Hudson <ghudson@MIT.EDU>
In-Reply-To: <47C8589A.7000309@redhat.com>
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>
	<20080229183148.GI1788@agk.fab.redhat.com>
	<1204312265.5850.7.camel@error-messages.mit.edu>
	<47C8589A.7000309@redhat.com>
Date: Fri, 29 Feb 2008 14:35:16 -0500
Message-Id: <1204313716.5850.12.camel@error-messages.mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2008-02-29 at 19:10 +0000, Bryn M. Reeves wrote:
> Greg Hudson wrote:
> > Nope, that never made it go away.  I'm not sure in what situations
> > flushing write buffers would have any effect.  If I had a way to throw
> > away the read-only page cache and force a file reload from disk, I would
> > expect that to eliminate the visible effect of the corruption; at the
> > moment the only reliable way I know how to do that is to reboot.

> To free pagecache:
>         echo 1 > /proc/sys/vm/drop_caches

Thank you!  Verified that freeing the page cache causes the
apparently-corrupted file's md5sum to revert to the correct value:

[Abbreviated diff output:]
--- /tmp/sum.pre        2008-02-29 14:30:29.000000000 -0500
+++ /tmp/sum.post       2008-02-29 14:30:32.000000000 -0500
-3e497fef20ce899c5621dcfbcbfec9a3  /tmp/test/krb5-1.6.dfsg/src/windows/cns/kerbnet.hlp
+e9725c38b630515dc304a26bde28fa51  /tmp/test/krb5-1.6.dfsg/src/windows/cns/kerbnet.hlp

root@linux-build-10:~# md5sum /tmp/test/krb5-1.6.dfsg/src/windows/cns/kerbnet.hlp
e9725c38b630515dc304a26bde28fa51  /tmp/test/krb5-1.6.dfsg/src/windows/cns/kerbnet.hlp
root@linux-build-10:~# echo 1 > /proc/sys/vm/drop_caches
root@linux-build-10:~# md5sum /tmp/test/krb5-1.6.dfsg/src/windows/cns/kerbnet.hlp
3e497fef20ce899c5621dcfbcbfec9a3  /tmp/test/krb5-1.6.dfsg/src/windows/cns/kerbnet.hlp
