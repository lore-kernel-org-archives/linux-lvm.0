Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36Et4j22993
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:55:04 -0400
Received: from gw-nl6.philips.com (gw-nl6.philips.com [161.85.127.52])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36Et25D032091
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:55:03 -0400
Received: from smtpscan-nl2.philips.com (smtpscan-nl2.philips.com
	[130.139.36.22])
	by gw-nl6.philips.com (Postfix) with ESMTP id 052D46AF36
	for <linux-lvm@redhat.com>; Tue,  6 Apr 2004 16:55:02 +0200 (MEST)
Received: from smtpscan-nl2.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id BF36319C4B
	for <linux-lvm@redhat.com>; Tue,  6 Apr 2004 16:55:00 +0200 (MEST)
Received: from smtprelay-nl2.philips.com (smtprelay-eur2.philips.com
	[130.139.36.35])
	by smtpscan-nl2.philips.com (Postfix) with ESMTP id 9AA4C19C5A
	for <linux-lvm@redhat.com>; Tue,  6 Apr 2004 16:54:48 +0200 (MEST)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125]) 
	by smtprelay-nl2.philips.com (8.9.3p3/8.8.5-1.2.2m-19990317) with ESMTP
	id QAA12795
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 16:54:48 +0200 (MEST)
From: darren.miller@philips.com
Subject: Re: [linux-lvm] snapshots and 2.6 kernel
Message-ID: <OFD0DD9F1A.93C5E59C-ON80256E6E.00517721-80256E6E.0051EB1C@philips.com>
Date: Tue, 6 Apr 2004 15:52:53 +0100
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>





Let me about it, presently I have an issue with the latest incarnation.

2.6.5rc1 with the present udm1 patches.  when you create a snapshot with
this sequence it doesn't error and is all great until try to remove it
which results in lvremove hanging and everything else with it.  Then can't
get the volume online again at all.. it simply won't mount and the mount
command hangs.  great init.

Still I haven't had a response on this little number yet

==============================================================================

Darren Miller
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681


|---------+----------------------------->
|         |                             |
|         |                             |
|         |                             |
|         |                             |
|         |                             |
|         |    Craig Ringer             |
|         |    <craig@postnewspapers.com|
|         |    .au>                     |
|         |                             |
|         |    Sent by:                 |
|         |    linux-lvm-bounces@redhat.|
|         |    com                      |
|         |                             |
|         |    06/04/2004 15:01         |
|         |    Please respond to LVM    |
|         |    general discussion and   |
|         |    development              |
|         |                             |
|---------+----------------------------->
  >------------------------------------------------------------------------------------------------------------------|
  |                                                                                                                  |
  |           To:   LVM general discussion and development <linux-lvm@redhat.com>                                    |
  |           cc:   (bcc: Darren Miller/SOU/SC/PHILIPS)                                                              |
  |           Subject:    Re: [linux-lvm] snapshots and 2.6 kernel                                                   |
  |                                                                                                                  |
  |           Classification:                                                                                        |
  |                                                                                                                  |
  >------------------------------------------------------------------------------------------------------------------|




On Thu, 2004-03-25 at 22:07, darren.miller@philips.com wrote:
> Getting the volume active is a pain I found that you have to reboot the
> system and when it comes back you need to create a link your volume group

> directory for the snapshot you create, atleast after the reboot the
> snapshot device showup in /dev/mapper which is a start right.

It would be _really_ good if LVM2 would fail gracefully when a snapshot
fails, or try to discover whether or not it can take the snapshot before
trying. At the very least a big **WARNING** in the _LVM2_ docs and in
lvcreate would help a lot.

I found LVM1 snapshots so perfect that I never thought about them
anymore; LVM2 on 2.6 was a nasty shock that I'd love to see others saved
from.

Craig Ringer

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
