Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i965mPr11782
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2004 01:48:25 -0400
Received: from itnts96.freudenberg.de (mailhost2.freudenberg.de [153.95.95.71])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i965mHaG022649
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2004 01:48:18 -0400
Received: from itnts2013.mail.fxdir.net (itnts2013.mail.fxdir.net) by
	itnts96.freudenberg.de
	(Content Technologies SMTPRS 4.3.14) with ESMTP id
	<T6c79a0a042995f5f474b8@itnts96.freudenberg.de> for
	<linux-lvm@redhat.com>; Wed, 6 Oct 2004 07:50:37 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 6 Oct 2004 07:48:06 +0200
Message-ID: <F9802015C36F5247825929BF9A41D557154F9C@itnts98.fitads01.fxdir.net>
From: "Riedel, Sven" <Sven.Riedel@f-it.de>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvextend returncode on error conditions / LVM1
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
To: linux-lvm@redhat.com

Hi,

A collegue is using scripts to automatically extend LVs when place gets scarce. Yesterday,
in one instance, there wasn't enough space left on the device for lvextend to create a backup
of the VG description. This resulted in lvextend issueing an error, continuing on, issueing a
warning and then returning the error code 0. Unfortunately, lvextend did not, in fact, extend the
LV by as much as it was supposed to. The scary part is that the filesystem extender that is
used afterwards has no problems extending beyond the end of the device... 

The lvextend version is 1.0.5 (I've checked the ChangeLog file and haven't found anything relevant
in later releases).

Regards,
Sven Riedel
