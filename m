Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j449oUO07901
	for <linux-lvm@redhat.com>; Wed, 4 May 2005 05:50:30 -0400
Received: from corpeumxic2.corp.emc.com (corpeumxic2.corp.emc.com
	[152.62.121.26])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j449oT9g016768
	for <linux-lvm@redhat.com>; Wed, 4 May 2005 05:50:29 -0400
Message-ID: <50C05B7AA7D6924FB5E384EF14BC647B676981@inba1mx2.corp.emc.com>
From: Sreedharan_Vinod@emc.com
Date: Wed, 4 May 2005 10:49:00 +0100 
MIME-Version: 1.0
Subject: [linux-lvm] "Close failed: Bad file descriptor" messages on pvcreate
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com



> Hi,
> 
> When I do pvcreate, I get deluged with "pvcreate  /dev/sdf: close failed:
> Bad file descriptor" messages.
> 
> I need to explicity open another session to kill the previous pvcreate
> instance to get out of this situation.
> 
> On the same system, pvcreate another device succeeds.
> 
> Distro:  RHEL 4.0 GA version
> version  LVM version:     2.00.31 (2004-12-12)
> version  Library version: 1.00.19-ioctl (2004-07-03)
> version  Driver version:  4.3.0
> 
> :~ # dd if=/dev/sdf of=/dev/null bs=1k count=2
> 2+0 records in
> 2+0 records out
> :~ # dd if=/dev/sde of=/dev/null bs=1k count=2
> 2+0 records in
> 2+0 records out
> 
> # pvcreate /dev/sde
> pvcreate  Physical volume "/dev/sde" successfully created
> 
> # pvcreate /dev/sdf
> pvcreate  /dev/sdf: close failed: Bad file descriptor
> pvcreate  /dev/sdf: close failed: Bad file descriptor
> pvcreate  /dev/sdf: close failed: Bad file descriptor
> pvcreate  /dev/sdf: close failed: Bad file descriptor
> 
> 
> Same messages till I kill pvcreate explicitly.
> 
> I see that lvmdiskscan does NOT list /dev/sdf but does list /dev/sde
> 
> Note: I did a vgscan/pvscan explicitly after doing a "make install" of the
> built 2.00.31 sources.
> 
> When I downgrade the lvm version (say: 2.00.15), make and make install --
> everything seems to work find
> and I am able to do a PV on both sde and sdf.  And I am able to see both
> devices in lvmdiskscan output.
> 
> Any idea on what's happening here?
> 
> Thanks,
> Vinod
> 
> 
> 
> 
