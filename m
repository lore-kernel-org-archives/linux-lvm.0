Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2F5I2Y00432
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2005 00:18:02 -0500
Received: from Datafx-Server.DFX (gc-eth-px.datafx.com.au [203.149.69.5])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2F5I0S4021036
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2005 00:18:01 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 15 Mar 2005 15:17:44 +1000
Message-ID: <8175FD8FB0D7F74181463AB38418109C29728E@Datafx-Server.DFX>
From: "Michael Bellears" <mbellears@staff.datafx.com.au>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM partitions not being mounted?
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

Debian 3.0 server - Been working flawlessly for ~12months, Reboot now
produces the following:

vgchange -- ERROR: can't get name(s) of physical volumes
vgchange -- ERROR: Please check, if /proc is mounted

All lvm partitions are not mounted, and subsequently fsck.reiserfs fails
on each one of these mounts (So I get dumped in single user mode)

I read in the archives that it may be caused by devfs compiled into the
kernel, but not mounted?

Regards, 

Michael Bellears B.Sc (Computer Science) 
ISP / Data Centre Manager 
Data FX Online Pty. Ltd. 
Tel: 1800 111 611
Fax: +61 7 5592 3320
Computing Services and Broadband Internet Access 
http://www.datafx.com.au 
  
