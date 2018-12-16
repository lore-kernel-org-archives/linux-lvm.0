Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064CB5D737
	for <linux-lvm@redhat.com>; Sun, 16 Dec 2018 02:12:49 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42C3A83F3E
	for <linux-lvm@redhat.com>; Sun, 16 Dec 2018 02:12:48 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23573.45766.916661.546759@quad.stoffel.home>
Date: Sat, 15 Dec 2018 21:04:54 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
References: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
Subject: Re: [linux-lvm] PV not found
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: giuseppe@vacanti.org, LVM general discussion and development <linux-lvm@redhat.com>


Giuseppe> after a reboot after a maintenance power interruption of a
Giuseppe> few hours, one of my LVs is not coming back (Ubuntu
Giuseppe> 18.04). The situation I am at is the following:

Ouch, this isn't fun.  

Giuseppe> - the physical disk is an iSCSI and it is seen by the kernel as /dev/sdc

Does it have any partitions on it?  Is this the only iSCSI volume on
the system?  

Giuseppe> - lvmdiskscan -v sees the PV on /dev/sdc
Giuseppe>   /dev/sdc              [      72.76 TiB] LVM physical volume

Can you show the full details of all your LVMs please?  Do any of the
others have a conflict with this device?

Giuseppe> - blkid returns the UUID that I can also find in the LVM configuration
Giuseppe>  /dev/sdc: UUID="fvUXXf-pVOF-EPnn-c8eg-tZ5S-iMVW-wsSFDy" TYPE="LVM2_member"

That's good.  What about if you do:

       pvchange -v /dev/sdc

what happens then?  

Giuseppe> - this entry lacks a PARTUUID entry that other LVs on the
Giuseppe> system have. Is this a clue? I could not quite connect this
Giuseppe> piece of info with anything.

Can you show the full output and the differences?

Giuseppe> - pvscan does not report /dev/sdc

Not good.

Giuseppe> - pvdisplay does not seem to know about this PV
Giuseppe>   pvdisplay /dev/sdc
Giuseppe>   Failed to find physical volume "/dev/sdc"

Not good either. How about the 'pvchange' and/or 'vgchange -ay' as
well?  Maybe the iSCSI LUN is getting mapped after all the rest of the
LVM setup happens...

Giuseppe> Reading man pages and searching the web does not really
Giuseppe> bring me closer to understanding what is happening. This
Giuseppe> machine has its OS on LVs and those have all come back, and
Giuseppe> of course it is not the first time that I reboot. Probably I
Giuseppe> lack the correct terms to describe the problem so that I can
Giuseppe> find a solution. Anybody here on this list who can point me
Giuseppe> in the right direction?

By any chance did you put a partition table on there?  What system is
the iSCSI LUN being exported from?  Can you run the following iscsiadm
command and share the details?

 iscsiadm --mode discoverydb --type sendtargets --portal <IP> --discover

where <IP> is the address of the iSCSI server you're mounting from.
Did that server go down as well?

Good luck!
John
