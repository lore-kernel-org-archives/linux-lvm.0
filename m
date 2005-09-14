Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8ECclV20020
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 08:38:47 -0400
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8ECciJd032460
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 08:38:44 -0400
Received: from zidane.cc.vt.edu (IDENT:mirapoint@evil-zidane.cc.vt.edu
	[10.1.1.13])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id j8ECcYQo029025
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 08:38:34 -0400
From: Bill Ranck <ranck@vt.edu>
Date: Wed, 14 Sep 2005 08:37:04 -0400
Message-Id: <1126701424.30358.93.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 growing striped volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM discussion list <linux-lvm@redhat.com>

Hello folks,
   I have a Redhat AS4 system to which is attached some SAN storage and
I'm using LVM2 to manage the LUNs.  So, for example, I have a volume
group consisting of 3 separate LUNs and then defined on that I have
logical volumes striped across all 3.  Does LVM2 have any mechanism to
add a new LUN to this VG and then restripe the LVs?  I am used to using
Veritas on Sun systems which can do this, but I don't see anything
obvious in LVM.  Is there any hope, or do I just have to rebuild from
scratch?

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
