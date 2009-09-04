Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n84E8A56031288
	for <linux-lvm@redhat.com>; Fri, 4 Sep 2009 10:08:11 -0400
Received: from mail64.messagelabs.com (mail64.messagelabs.com [216.82.249.227])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n84E7qfX031494
	for <linux-lvm@redhat.com>; Fri, 4 Sep 2009 10:07:53 -0400
From: "Larsen, Peter" <PLarsen@CIBER.com>
Date: Fri, 4 Sep 2009 08:07:48 -0600
Subject: RE: [linux-lvm] vg availability during boot
Message-ID: <36341C0C45B7054AA3F17AB74ED869EB1248D3C9@CDC-EXMBP3.ciber.cbr.inc>
References: <f4f537b50909030627i9117a53lbef23eddeb3a87e6@mail.gmail.com>
In-Reply-To: <f4f537b50909030627i9117a53lbef23eddeb3a87e6@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Did you rebuild initrd? During boot, initrd uses staticly linked modules to load what otherwise would be kernel modules. It does, if LVM is enabled, do a vgchange -y a as part of that process. Since LVM is part of the default initrd, it may be the drivers for your SAN that you need to get in place - remember to include the high-end Ethernet drivers too that your NAS (I presume?) uses. 

--
  
   Peter H. Larsen
   Technical Architect
   Enterprise Security Services
   Phone: 703 610 6442 (direct)

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Eugene Vilensky
Sent: Thursday, September 03, 2009 9:27 AM
To: LVM general discussion and development
Subject: [linux-lvm] vg availability during boot

Greetings,

I have a host that refuses to recognize my san-attached logical
volumes during boot.  When mounting from /etc/fstab, it drops out of
boot complaining that the LVs in question have an invalid superblock
and need to be fsck-ed, however because the lv is "mounted" the fsck
cannot proceed.

I commented out the entries, rebooted, and noticed that the LVs in the
VG in question are "NOT AVAILABLE."  A vgchange -a y vgname later and
everything is working perfectly.

This is my first RHEL5 san-attached host; might I have missed some
sort of 'vg persistency' settings by doing the same things I've been
doing on RHEL4?

Thanks,

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
