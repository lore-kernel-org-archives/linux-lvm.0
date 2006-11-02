Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA2Dcl7R029987
	for <linux-lvm@redhat.com>; Thu, 2 Nov 2006 08:38:47 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.169])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kA2DchkC021411
	for <linux-lvm@redhat.com>; Thu, 2 Nov 2006 08:38:44 -0500
Received: by ug-out-1314.google.com with SMTP id m3so128593uge
	for <linux-lvm@redhat.com>; Thu, 02 Nov 2006 05:38:42 -0800 (PST)
Message-ID: <5485940d0611020538r41620b3cr3356ac214f0ba2e2@mail.gmail.com>
Date: Thu, 2 Nov 2006 13:38:22 +0000
From: "C'est Pierre" <cestpierre@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Incorrect metadata area header checksum
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

Hello,

I am running through this error in CentOS 4.3, has anyone gone through
this situation?

I added a disk to the VG, initialized it with pvcreate and vgextended
our VG. However, it's constantly showing these messages:

# vgdisplay
  Incorrect metadata area header checksum
  /var/lock/lvm/V_VG00: open failed: No space left on device
  Can't lock VG00: skipping

which don't seem to be true at all:

Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VG00-LogVol00
                      9.0G  7.0G  1.6G  83% /
/dev/sda1              99M  9.0M   85M  10% /boot
/dev/mapper/VG00-LogVol01
                       14G  510M   13G   4% /opt/lampp/var
/dev/mapper/VG00-LogVol02
                      977M   18M  910M   2% /tmp


Not of the disks is fully used, yet I can't even write to /root

# >foobar
-bash: foobar: No space left on device

Any idea?

Thanks
Pierre
