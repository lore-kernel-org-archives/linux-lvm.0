Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1RIC2129894
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 13:12:02 -0500
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1RIC0R6001356
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 13:12:00 -0500
Received: from zidane.cc.vt.edu (IDENT:mirapoint@evil-zidane.cc.vt.edu
	[10.1.1.13])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id k1RIBsUV002655
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 13:11:54 -0500
From: Bill Ranck <ranck@vt.edu>
Date: Mon, 27 Feb 2006 13:05:42 -0500
Message-Id: <1141063543.4364.32.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvcreate exit code 5?
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
To: LVM discussion list <linux-lvm@redhat.com>

Hello folks,
   I have a script which issues an lvcreate to create a snapshot.  The
command returns with an exit code 5.  The snapshot works, and seems to
be fine otherwise, but what is the exitcode trying to tell me?  I found
documentation saying, "error getting status of logical volume" is the
cause, but what does the really mean in this context?
Here is the actual command being issued by the script:

/usr/sbin/lvcreate -L 5G --snapshot -n /dev/USRAPPS/snap03
 /dev/USRAPPS/db03

   Any suggestions?  I don't like to ignore non-zero exit codes.
Yes, the source volume is mounted and active.  

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
