Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7OG8OMO007354
	for <linux-lvm@redhat.com>; Sun, 24 Aug 2014 12:08:24 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7OG8Lrb005436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 24 Aug 2014 12:08:22 -0400
Received: from mfilter26-d.gandi.net (mfilter26-d.gandi.net [217.70.178.154])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id 97953172094
	for <linux-lvm@redhat.com>; Sun, 24 Aug 2014 18:08:20 +0200 (CEST)
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by mfilter26-d.gandi.net (mfilter26-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id MUgJuwjYq7ZN for <linux-lvm@redhat.com>;
	Sun, 24 Aug 2014 18:08:18 +0200 (CEST)
Received: from [10.21.12.10] (meiling.tontut.fi [94.237.68.51])
	(Authenticated sender: oranenj@gensoukyou.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4999F17208B
	for <linux-lvm@redhat.com>; Sun, 24 Aug 2014 18:08:17 +0200 (CEST)
Message-ID: <1408896497.27190.12.camel@kurenai.local>
From: Jarkko Oranen <oranenj@iki.fi>
Date: Sun, 24 Aug 2014 19:08:17 +0300
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Does LVM RAID1 have TRIM support?
Reply-To: oranenj+lvm@iki.fi,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hello

Yesterday I experimented a bit with my RAID configuration on a pair of
SSDs, and it seems that LVM's native RAID does not have TRIM support...
At least, when I try to run fstrim manually, it complains even though
issue_discards is enabled. Plain LVs on top of an MD RAID PV do work, of
course.

Am I perhaps missing some configuration, or do RAID1 logical volumes
simply not have support for TRIM yet? I'm running a fairly recent kernel
(3.15.8) and lvm version says this:

  LVM version:     2.02.106(2) (2014-04-10)
  Library version: 1.02.85 (2014-04-10)
  Driver version:  4.27.0

As an aside, can anyone point me to documentation or other resources
about the pros and cons of LVM native RAID1 setup (which I understand
uses MD RAID internally?) vs. MD RAID PV + LVM. It seems I might be able
to save some SSD space and only mirror the LVs I actually need to keep
safe from crashes.

--
Jarkko Oranen
