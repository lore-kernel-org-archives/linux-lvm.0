Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9HMBt69016888
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 18:11:55 -0400
Received: from mail.osl.inic.no (mail02.osl.inic.no [85.19.150.32])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9HMBmLA027532
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 18:11:49 -0400
Received: from [127.0.0.1] (unverified [80.202.70.172]) by mail.osl.inic.no
	(Rockliffe SMTPRA 7.0.3) with ESMTP id <B0011663247@mail.osl.inic.no>
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 00:11:54 +0200
Message-ID: <4716889A.6020206@mortent.org>
Date: Thu, 18 Oct 2007 00:11:38 +0200
From: Morten Torstensen <morten@mortent.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove obliterates filesystem (Opensuse 10.2, x86-64)
References: <ff3hde$7rt$2@ger.gmane.org>
	<20071017012858.GW10006@agk.fab.redhat.com>
In-Reply-To: <20071017012858.GW10006@agk.fab.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

 > [snip pvmove problems]

This is why, imo, why lvm on linux needs to virtualize PE in lVm... a LV 
only maps to LE (logical extents) that can themselves be mapped to one 
or more PEs. Then you can pvmove by adding maps and removing old maps 
after verifying that the new mapping is ok.

This is basically how LVM is implemented in AIX. Is this a too big NIH 
problem for LVM on Linux? I am amazed that LVM on Linux doesn't steal 
more ideas from LVM on AIX, as that is without doubt the best LVM 
implementation you have out there. Big words, yes... if anyone can argue 
why I am wrong I am happy to hear why :) (and gladly accept defeat if 
that is required)

//Morten
