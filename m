Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB8FVmr20900
	for <linux-lvm@redhat.com>; Wed, 8 Dec 2004 10:31:48 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB8FVgH4023327
	for <linux-lvm@redhat.com>; Wed, 8 Dec 2004 10:31:42 -0500
Received: from pcemmanuel (defense-3-81-57-219-151.fbx.proxad.net
	[81.57.219.151])
	by postfix3-1.free.fr (Postfix) with ESMTP id DD448173531
	for <linux-lvm@redhat.com>; Wed,  8 Dec 2004 16:31:41 +0100 (CET)
From: "EC" <wingman@waika9.com>
Date: Wed, 8 Dec 2004 16:32:12 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20041208153141.DD448173531@postfix3-1.free.fr>
Subject: [linux-lvm] EXT3-fs: INFO: recovery required on readonly filesystem
	?
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

I'm trying to use the snapshots as indicated in the LVM HOWTO. I use LVM2.
But I seem to get EXT to claim recovery each time I lvcreate the backup..
Please understand I'm newbie to LVM..

My syslog gives something like : 

EXT3-fs: INFO: recovery required on readonly filesystem

... kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
... kernel: EXT3-fs: write access will be enabled during recovery.
... kernel: kjournald starting.  Commit interval 5 seconds
... kernel: EXT3-fs: recovery complete.
... kernel: EXT3-fs: mounted filesystem with ordered data mode.

I'm using : 
2.4.28 kernel , linux-2.4.26-rc1-devmapper-ioctl.patch, 1.00.18 device
mapper , 2.00.25 LVM2. 

I saw some messages about this in may 2004 but cannot understand if I'm
supposed to apply other patches or so.. Please note this is to be used in
production environment, so unstable patches cannot be applied...

Please help if possible..

EC.
