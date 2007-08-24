Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7OEBbuD002017
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 10:11:38 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7OEBNit017443
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 10:11:24 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 756BE48670
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 16:11:15 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id B82BB9339
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 16:11:15 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id gGlWoHzQY5sG for <linux-lvm@redhat.com>;
	Fri, 24 Aug 2007 16:11:13 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-224-108.netcologne.de
	[87.78.224.108]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 16:11:12 +0200 (CEST)
Message-ID: <46CEE6FF.1090000@wpkg.org>
Date: Fri, 24 Aug 2007 16:11:11 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] "cannot allocate memory" when trying to do a snapshot?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I have a server with ~1.5T PV, on which I have several logial volumes (LVs).

I decided to do a snapshot for five of these LVs, and it succeeded, but 
only few times.

   dom-dc1           san1 owi-ao   8.00G
   dom-oss1          san1 owi-ao  16.00G
   dom-sql1          san1 owi-ao   8.00G
   dom-sql1-2        san1 owi-ao  50.00G
   dom-ts1           san1 owi-ao  16.00G

For each of the LVs, I made 5G snapshots.
I could make three snapshots for all of them, but the fourth snapshot 
failed for some LVs (in all, I could only make 18 * 5GB snapshots).

Why?

I'm using Debian Etch, with its 2.6.18 64 bit kernel.
The machine has 512 MB RAM, and 3 GB swap:

# free
              total       used       free     shared    buffers     cached
Mem:        512204     492212      19992          0     297784      17864
-/+ buffers/cache:     176564     335640
Swap:      3145720          0    3145720



I've searched the list, and a similar cases appeared on the list in 
2002/2003, most without any reply - but it was LVM1 / 2.4.x times.


-- 
Tomasz Chmielewski
