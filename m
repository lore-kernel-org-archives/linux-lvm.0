Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJHJtr22617
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:19:55 -0500
Received: from mail.rnbhq.org (foobar@preston.muon.de [82.165.25.30])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAJHJojr021623
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:19:51 -0500
Received: from port-212-202-8-76.dynamic.qsc.de
	([212.202.8.76] helo=sisko.muon.local ident=foobar)
	by mail.rnbhq.org with asmtp 
	(Cipher TLSv1:DES-CBC3-SHA:168) (Exim 3.35 #1 (Debian))
	id 1CVCQ2-0000cw-00
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 18:19:34 +0100
Received: from trip.muon.local ([192.168.0.248] helo=trip ident=Debian-exim)
	by sisko.muon.local with esmtp (Exim 3.35 #1 (Debian))
	id 1CVCQ1-0000dL-00
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 18:19:33 +0100
Received: from juergens by trip with local (Exim 4.34) id 1CVCQ1-0000Q1-8G
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 18:19:33 +0100
Date: Fri, 19 Nov 2004 18:19:33 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] relocate on write for snapshot
Message-ID: <20041119171933.GA1417@trip.muon.local>
References: <1100882347.2984.32.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1100882347.2984.32.camel@localhost.localdomain>
Sender: Debian User <nils@muon.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, 19.11.04, Ming Zhang <mingz@ele.uri.edu> wrote:

> instead of copy old one to snapshot, overwrite old one with new one, 2
> writes and 1 reads. it is possible that write new data to a usused
> location directly.

Since you have to delete the snapshot (and I don't think they live very long
on most systems) you don't gain anything (because you have copy the changes
back from the snapshot), but you make the cases of more than one snapshot
and (possibly) read-write snapshots a lot harder, maybe not in CPU or IO,
but certainly in code complexity, which is a thing you never do to gain
a bit of performance.

> i know later remove a snaphot will be a little trouble, but there must
> be some way to get around it.

Yes, you have to do the work you saved a couple of minutes earlier :)

just my EUR 0.02,
Nils

-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.org).
