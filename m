Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0QHNlO19396
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2005 12:23:47 -0500
Received: from imf18aec.mail.bellsouth.net (imf18aec.mail.bellsouth.net
	[205.152.59.66])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0QHNfxH016912
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2005 12:23:41 -0500
Received: from mail.bellsouth.net ([205.152.59.159])
	by imf18aec.mail.bellsouth.net
	(InterMail vM.5.01.06.11 201-253-122-130-111-20040605) with SMTP id
	<20050126172328.PMUX2060.imf18aec.mail.bellsouth.net@mail.bellsouth.net>
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2005 12:23:28 -0500
From: <pvwrght@bellsouth.net>
Date: Wed, 26 Jan 2005 12:23:28 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20050126172328.PMUX2060.imf18aec.mail.bellsouth.net@mail.bellsouth.net>
Subject: [linux-lvm] JFS on LVM volumes?
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
To: linux-lvm@redhat.com

I am trying to install Fedora Core 3 on a server with two IDE drives.
I have set up the IDE drives as an LVM volume and selected JFS as
the file system. Everything goes fine through the partitioning, but
craps out when the installation starts. Is the JFS file system supported
on LVM volumes under Fedora?

Thanks,
Philip Wright
