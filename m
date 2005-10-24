Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9OIa5V29499
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2005 14:36:05 -0400
Received: from webd.globtel.pl (webd.globtel.pl [193.110.231.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9OIa3Fv023981
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2005 14:36:04 -0400
From: szym@globtel.pl
Message-Id: <20051024183547.963F63AD1D@webd.globtel.pl>
Date: Mon, 24 Oct 2005 20:35:47 +0200 (CEST)
Subject: [linux-lvm] CLVMD and 2 or more gndb servers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

ccHi

Is it possible to export disk from two different severs 
using gnbd_server and clvmd ?
If i do it in this way on gfs node i see problem with lvm
it says 'internet lvm error check syslog'
On gndb node i see that PV from other gnbd server not found
What should i do ?


Szym
