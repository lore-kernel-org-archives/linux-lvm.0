Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9MB773I010058
	for <linux-lvm@redhat.com>; Sun, 22 Oct 2006 07:07:07 -0400
Received: from web52911.mail.yahoo.com (web52911.mail.yahoo.com
	[206.190.49.21])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k9MB75Al019980
	for <linux-lvm@redhat.com>; Sun, 22 Oct 2006 07:07:05 -0400
Message-ID: <20061022110659.82422.qmail@web52911.mail.yahoo.com>
Date: Sun, 22 Oct 2006 04:06:59 -0700 (PDT)
From: Rik Herrin <rikherrin@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2 Snapshots Question
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

Hi,
  I had a question regarding LVM2 snapshots.  I read the following about snapshots (taken from 
http://www.tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html):

"This facility does require that the snapshot be made at a time when the data on the logical volume is in a consistent state - the VFS-lock patch for LVM1 makes sure that some filesystems do this automatically when a snapshot is created, and many of the filesystems in the 2.6 kernel do this automatically when a snapshot is created without patching."

Does this mean that I don't have to unmount (or remount ro) a partition if I'm using a 2.6 kernel to take a snapshot and I can rest assured that the logical volume will be in a consistent state?  Thanks for your help.
