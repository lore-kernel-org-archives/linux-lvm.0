Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4OIW9O04664
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 14:32:09 -0400
Received: from SMTPAVM1.corp.isib.net (maila.rbcdain.com [199.250.8.151])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j4OIW3VA016799
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 14:32:03 -0400
Received: from SMTPM1.corp.isib.net (unverified) by MSMP1.corp.isib.net 
	(Content Technologies SMTPRS 4.3.17) with ESMTP id 
	<T711b4fc845aaaf03acd08@MSMP1.corp.isib.net> for <linux-lvm@redhat.com>;
	Tue, 24 May 2005 13:31:57 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: RE: [linux-lvm] No volume groups found at boot
Date: Tue, 24 May 2005 13:31:56 -0500
Message-ID: <2711988D405D2247BC9B82786F99E8E5066308@MAIL4.corp.isib.net>
From: "Page, Jennifer \(RBC Dain\)" <Jennifer.Page@rbcdain.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

UNSUBSCRIBE Jennifer.Page@rbcdain

Please remove  Jennifer.Page@rbcdain from the distribution list.

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Jozsef Bakosi
Sent: Tuesday, May 24, 2005 8:08 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] No volume groups found at boot

Hello,

I have

LVM version:     2.01.04 (2005-02-09)
Library version: 1.01.00-ioctl (2005-01-17) Driver version:  4.1.0

with two working volume groups on an AMD64 Athlon running kernel version
2.6.8 (root@backup) (gcc version 3.3.5 (Debian 1:3.3.5-12)) #1 Fri May
13
08:54:18 EDT 2005 with Debian sarge.

The problem is that /etc/init.d/lvm doesn't find the volume groups at
boot, thus /etc/init.d/checkfs.sh (the next script) stops for
maintenance because it can't find the volumes.

The disks are SATA and all nicely recongized before the init-lvm script
starts (by enforcing the loading of their drivers in /etc/modules).

After boot, I can do "vgscan" and "vgchange -a y", finding the volumes
no problem and can mount them as well.

The strangest thing is when I insert a "/sbin/sulogin $CONSOLE" right
before

/sbin/vgscan $IGNORELOCKINGFAILURES $MKNODES || true /sbin/vgchange -a y
$IGNORELOCKINGFAILURES

in /etc/init.d/lvm and do vgscan and vgchange manually, it works fine.

So what is the difference in between running a command from a script in
/etc/rcS.d/ and mannually from command line?

Jozsef



RBC Dain Rauscher does not accept buy, sell or cancel orders by e-mail, or any instructions by e-mail that would require your signature.  Information contained in this communication is not considered an official record of your account and does not supersede normal trade confirmations or statements.  Any information provided has been prepared from sources believed to be reliable but is not guaranteed, does not represent all available data necessary for making investment decisions and is for informational purposes only.

This e-mail may be privileged and/or confidential, and the sender does not waive any related rights and obligations.  Any distribution, use or copying of this e-mail or the information it contains by other than an intended recipient is unauthorized.  If you receive this e-mail in error, please advise me (by return e-mail or otherwise) immediately.

Information received by or sent from this system is subject to review by supervisory personnel, is retained and may be produced to regulatory authorities or others with a legal right to the information.
