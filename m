Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA1NKXV01894
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 18:20:33 -0500
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA1NKUix030611
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 18:20:30 -0500
Received: from jgs4.ino.pvt (unknown [172.16.1.75])
	by mail.inostor.com (Postfix) with ESMTP id 9C61E2B515
	for <linux-lvm@redhat.com>; Tue,  1 Nov 2005 15:16:01 -0800 (PST)
Subject: Re: [linux-lvm] Creating snapshot causes processes hang?
From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
In-Reply-To: <20051101220316.6F44973980@hormel.redhat.com>
References: <20051101220316.6F44973980@hormel.redhat.com>
Date: Tue, 01 Nov 2005 15:20:21 -0800
Message-Id: <1130887221.16627.2.camel@jgs4.ino.pvt>
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
To: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>

> Date: Tue, 01 Nov 2005 16:02:55 -0600
> From: Kelly Sauke <ksauke@fastenal.com>
> Subject: Re: [linux-lvm] Creating snapshot causes processes hang?
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <4367E60F.8020004@fastenal.com>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> http://www.redhat.com/archives/linux-lvm/2005-July/msg00117.html
> 

AHA! -- could this be a confirmation of what I have seen where lvremove
triggers the kcopyd BUG and consequent system deadlock?

(ref: my recent posting --  https://www.redhat.com/archives/linux-
lvm/2005-November/msg00002.html, where I report breakage upon lvremove
when there are 2 snapshots and i/o is occurring)


If so, do I also understand correctly that using unreleased patches and
some manual dmsetup commands might constitute a workaround?

I don't mind living with manual workarounds until snapshots is fixed,
but it would be wonderful to see an explicit recipe [for dummies, please
<grin>] for following the suggestions in the AGK july posting referenced
by ksauke, above), namely:

  "Further patches are needed, but those two plus correct dmsetup use
should avoid machine lockups."

In particular:
have any of the 18 patches shown at 
  ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-
rc2/2.6.12-rc2-udm1/
gotten into 2.6.13 or 2.6.14, or into kernels blessed by Fedora? (eg,
FC4-1526, maybe)

And, could someone give me an example of "correct dmsetup" use? I
presume it involves suspend and resume -- but what else?

.. and in my case, what if there is an existing snapshot when I need to
create/remove a second one?



..jim
