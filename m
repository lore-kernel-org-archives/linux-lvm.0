Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLGmJr30350
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 11:48:19 -0500
Received: from ny-bas07.csfb.com (ny-bas07.csfb.com [198.240.130.80])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBLGmDli008510
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 11:48:13 -0500
Received: from snyc11p30741.csfb.cs-group.com (snyc11p30741.csfb.mail
	[169.37.102.72])
	by ny-bas07.csfb.com (Postfix) with ESMTP id 1C3ED3C16
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 11:48:08 -0500 (EST)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF01B6@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Subject: RE: [linux-lvm] lvm/fs issue
Date: Tue, 21 Dec 2004 11:47:58 -0500
MIME-Version: 1.0
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



> I'm not sure about your error, but I would merge sda[6789] 
> into a single
> partition.  Splitting a disk and then putting it back together in
> software just adds an unnecessary load to your system (only 
> one Physcial
> Volume per disk).  In other words, sda6 should go from 16845.016 to
> 38154.000.  Getting there may be a challenge, though ;-)


Well, splitting and putting back together is not what I'm doing, although it
might look like that.

Although I currently have only 1 logical volume, and all my PV's are currently
a part of it, that's not necessarily how things will always be.  I
intentionally partitioned most of my disk into ~2GB chunks like this, so that
I can have a pool of 2GB PV's which I can throw at whichever LV needs it, and
thereby rid myself of future space constraint issues I've run into in the past
with traditional partitioning.


> Taking a stab at your problem, I would first look to see if you've
> exclude sda3 from LVM.  I am guessing that you haven't, and 
> that LVM is
> trying to read a PV id off sda3.


Yeah, that seems to be the general consensus.  Looks like LVM was until
recently either ignoring extended partitions or not reporting error messages
on them, which is why I only started to see this recently.

Thanks,

DR

==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================
