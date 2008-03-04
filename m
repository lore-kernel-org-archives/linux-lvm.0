Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m24NwUJZ028440
	for <linux-lvm@redhat.com>; Tue, 4 Mar 2008 18:58:30 -0500
Received: from biscayne-one-station.mit.edu (BISCAYNE-ONE-STATION.MIT.EDU
	[18.7.7.80])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m24NvwN5019198
	for <linux-lvm@redhat.com>; Tue, 4 Mar 2008 18:57:58 -0500
Received: from outgoing.mit.edu (OUTGOING-AUTH.MIT.EDU [18.7.22.103])
	by biscayne-one-station.mit.edu (8.13.6/8.9.2) with ESMTP id
	m24Nvq3b016387
	for <linux-lvm@redhat.com>; Tue, 4 Mar 2008 18:57:52 -0500 (EST)
Received: from [10.0.0.102] (c-65-96-107-158.hsd1.ma.comcast.net
	[65.96.107.158]) (authenticated bits=0)
	(User authenticated as ghudson@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.13.6/8.12.4) with ESMTP id m24NvpBh023209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 4 Mar 2008 18:57:52 -0500 (EST)
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
From: Greg Hudson <ghudson@MIT.EDU>
In-Reply-To: <20080229201425.GK1788@agk.fab.redhat.com>
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>
	<20080229183148.GI1788@agk.fab.redhat.com>
	<1204312265.5850.7.camel@error-messages.mit.edu>
	<47C8589A.7000309@redhat.com>
	<1204313716.5850.12.camel@error-messages.mit.edu>
	<20080229201425.GK1788@agk.fab.redhat.com>
Date: Tue, 04 Mar 2008 18:57:52 -0500
Message-Id: <1204675072.6272.41.camel@error-messages.mit.edu>
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


On Fri, 2008-02-29 at 20:14 +0000, Alasdair G Kergon wrote:
> I notice this is ubuntu: Can you eliminate the distribution, by
> reproducing on a different distribution, or using a current upstream
> development kernel like 2.6.25-rc3?

Apologies for the delay.  I was unable to reproduce this bug in many
trials on 2.6.25-rc3, so it may have been either introduced by Ubuntu in
gutsy or (more likely) fixed in the mainline kernel source since 2.6.22.

Anders Kaseorg has also seen this problem on Gutsy but was unable to
reproduce it on Hardy, which lends credence to the second theory.

> What is /tmp ?

A regular old directory on the root fileystem, which is ext3fs on a
different LVM volume group on a different disk from the volume group
containing the LV's I'm snapshotting.
