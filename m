Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3T6JY59031929
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 02:19:34 -0400
Received: from mail.idrift.no (mail.idrift.no [83.242.12.60])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3T6JFxc026309
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 02:19:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.idrift.no (Postfix) with ESMTP id 03406314077
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 08:19:14 +0200 (CEST)
Received: from mail.idrift.no ([127.0.0.1])
	by localhost (elros.idrift.no [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 09783-05 for <linux-lvm@redhat.com>;
	Wed, 29 Apr 2009 08:19:13 +0200 (CEST)
Received: from Inbox (unknown [89.8.59.156])
	by mail.idrift.no (Postfix) with ESMTP id 348CD31402A
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 08:19:08 +0200 (CEST)
MIME-Version: 1.0
content-class: 
From: Gaute Lund <gaute@idrift.no>
Subject: Re: [linux-lvm] Random file system errors
Date: Wed, 29 Apr 2009 08:19:09 +0200
Message-Id: <20090429061910.348CD31402A@mail.idrift.no>
Content-Transfer-Encoding: 8bit
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

Thanks, and also to others who gave feedback. The approach with md5summing devices came from another source too, and I'll try a systematic approach as soon as time allows.

-gaute

----- Opprinnelig melding -----
Fra: f-lvm@media.mit.edu
Sendt: 29. april 2009 05:52
Til: linux-lvm@redhat.com
Emne: [linux-lvm] Random file system errors

Btw, one way to proceed on the test-your-hardware angle without
yanking disks (or even opening the case) and possibly turning this
into a heisenbug if it really -is- something like cabling would be
to do something like this:

   dd if=/dev/hda bs=1M count=1000 | md5sum

for each of hdX and sdX or whatever describes the raw physical
devices.  Do this with the LVM -completely deactivated- so you
know that absolutely nothing can be writing to the disks; you
should probably boot from a LiveCD to ensure this.

Run each test at least twice for the same disk and record the results;
I'll bet that at least one of your disks will return inconsistent
data; perhaps all disks on one IDE channel or one SATA channel will,
or perhaps every single disk will if you've got RAM, PSU, or
bridge-chip troubles, etc.

If you're seeing a very low frequency of bit flips, raise the count on
the dd to something larger, like maybe 10000 instead or whatever;
that'll slow down the test but raise your confidence in it.

Either way, try it on a USB device as well.  Very different hardware
and software paths.  Might be illuminating.

Just make -damned- sure that your dd is using "if" and not "of"!

If you -can't- make it fail, you might get fancier and try something
that forces lots of head seeking (since that will consume more power
and maybe stress your PSU), or try running all the disk tests in
parallel (since that will chew up more CPU) or perhaps run something
that runs your CPU flat out in one process while doing the dd in
another.

If you still can't make it fail, try activating the LVM -from a LiveCD- 
(e.g., -not- booted from it) and then repeat the tests on the LV's.
If it fails on LV's that have no mounted filesystems and aren't being
touched, but works on the raw devices, -then- you're starting to point
a finger at LVM...  (And if you have to mount a FS to start getting
failures, only then might we start thinking about write barriers or
whatever...)

If everything you do doesn't make it fail, but it fails when you're
booted and running from that LVM, I'd start to suspect LVM and/or
kernel issues in the actual software you're running.  But I'll bet
that you'll see a failure before that point.

And report back; it'd be good to close the loop on this if it's proven
-not- to be an LVM issue.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
