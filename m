Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6IJIS9v002023
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2010 15:18:31 -0400
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6IJIFIO010351
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2010 15:18:16 -0400
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by mps1.wohnheimg.uni-frankfurt.de with esmtp (Exim 4.72)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1OaZNN-0000Cw-NI
	for linux-lvm@redhat.com; Sun, 18 Jul 2010 21:18:13 +0200
Message-ID: <8d484f4cdfc15abe7047be252b5396d4.squirrel@ssl.verfeiert.org>
Date: Sun, 18 Jul 2010 21:18:13 +0200
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM/Devicemapper kernel level breakage?
Reply-To: sven@whgl.uni-frankfurt.de,
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

Hi list, I am having difficulties with one of my boxes.

Mainly this:

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 2262 root      20   0     0    0    0 R   25  0.0 836:51.10 flush-253:2
 2363 root      20   0     0    0    0 R   25  0.0 838:28.16 flush-253:6
 2364 root      20   0     0    0    0 R   25  0.0 916:14.92 flush-253:4
 2365 root      20   0     0    0    0 R   25  0.0 855:02.50 flush-253:1
 2362 root      20   0     0    0    0 R   23  0.0 916:14.92 flush-253:5
 3090 root      20   0     0    0    0 R   23  0.0 853:27.24 flush-253:3

I was wondering what these flush processes are, I could determine they are
kernel based threads (as far as I can see).
Since they are called  flush, I'd asume they have to do with flushing
buffers or whatsoever, so I came to the conclusion, that the numbers might
be major:minor pairs.

Using lvs, I get:

  LV          KMaj KMin
  Root        253  1
  home        253  3
  var         253  2
  usr         253  5
  usr.portage 253  4
  www         253  6

And I certainly do not believe that there should be flush proceses hogging
the CPU 24/7, and al those threads belong to logical volumes, or devie
mapper devices (there are more, with a little les cpu time created by
kpartx).

Is this a known bug? Any recommendation what to do?

Regards

-Sven
