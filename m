Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11Ghv123288
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 11:43:57 -0500
Received: from mail7.amherst.edu (mail7.amherst.edu [148.85.136.41])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k11GhtsF028875
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 11:43:56 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(
Date: Wed, 1 Feb 2006 11:43:55 -0500
Message-ID: <0456A130F613AD459887FF012652963F33ED09@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

With FC4 for example I cannot remove a snapshot while the underlying
logical volume is under heavy I/O.  Once all I/O stops I can remove the
snapshot. Doing a lvremove will hang.

Steffen 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Kevin P. Fleming
Sent: Wednesday, February 01, 2006 11:38 AM
To: LVM general discussion and development
Subject: [linux-lvm] 'snapshot' target still experimental :-(

I noticed that this is still the case... but I want to use it :-)

I need to set up simple snapshot/rsync backups of XFS filesystems, so
I'm wondering what the current thinking in the community is. Is it
reliable enough to trust not to crash my server or do other nasty
things?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
