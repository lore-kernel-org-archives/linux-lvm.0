Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1SAcDK28719
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 05:38:13 -0500
Received: from kokytos.rz.informatik.uni-muenchen.de
	(kokytos.rz.informatik.uni-muenchen.de [141.84.214.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1SAcBNT012868
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 05:38:12 -0500
Received: from iod.cip.informatik.uni-muenchen.de
	(iod.cip.informatik.uni-muenchen.de [141.84.214.220])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by kokytos.rz.informatik.uni-muenchen.de (Postfix) with ESMTP id
	1B5C543564
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 11:38:01 +0100 (CET)
From: Michael =?iso-8859-15?q?St=FCbiger?= <stuebiger-lvm@cip.ifi.lmu.de>
Date: Mon, 28 Feb 2005 11:38:00 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200502281138.00112.stuebiger-lvm@cip.ifi.lmu.de>
Subject: [linux-lvm] Raid1 only with LVM
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello.

I'm rather new to LVM2 and DM.
After having read what I could find about it I got the impression that
one should be able to get LVM to Mirror a Volume Group to 2 Physical Volumes with
the mirror target just like it can do striping.

Alas I was unable to find any documentation on how to accomplish this.

Can anybody please help me with this?

Regards
Michael St�biger

-- 
| Dipl. Inf. Michael St�biger                   Michael.Stuebiger at rz.ifi.lmu.de |
| Ludwig-Maximilians-Universitaet Muenchen                                         	|
| Institut fuer Informatik                Zimmer Z 9      Tel: 2180-9137           	|
