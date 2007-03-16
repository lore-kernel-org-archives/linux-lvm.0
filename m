Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2GIQK9s005642
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2007 14:26:21 -0400
Received: from imo-m25.mx.aol.com (imo-m25.mx.aol.com [64.12.137.6])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2GIQDn7014413
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2007 14:26:14 -0400
Received: from P3tr0x@aol.com
	by imo-m25.mx.aol.com (mail_out_v38_r7.6.) id e.d42.48636c1 (60469)
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2007 14:25:59 -0400 (EDT)
Date: Fri, 16 Mar 2007 14:25:59 -0400
MIME-Version: 1.0
From: p3tr0x@aol.com
Content-Type: multipart/alternative; 
	boundary="--------MB_8C9360FAE02F3E0_EA0_6505_WEBMAIL-RC11.sysops.aol.com"
Message-Id: <8C9360FAE05563F-EA0-3661@WEBMAIL-RC11.sysops.aol.com>
Subject: [linux-lvm] Mounting part of a logical volume?
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
To: linux-lvm@redhat.com


----------MB_8C9360FAE02F3E0_EA0_6505_WEBMAIL-RC11.sysops.aol.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"

 Hi,
 
 I have a Fedora Core 6 system with a root volume group (VolGroup00) spanning 2 physical drives. Through my own negligence the first drive got overwritten when the system was rebooted with a bootable cd in the drive. This effectively reformated the primary drive but left the second drive intact. What I would like to do is mount the second drive to see if there is any data worth retrieving before rebuilding the system. 
 
 I can boot onto a rescue CD so I can access the drive through lvm. lvdisplay reports that it cannot find all of the physical volumes which makes sense as the other drive was reformatted. pvscan also reports a missing drive. 
 
 Can anyone give me a pointer on what might be my next step?
 
 Thanks!
 Pete  
________________________________________________________________________
AOL now offers free email to everyone.  Find out more about what's free from AOL at AOL.com.

----------MB_8C9360FAE02F3E0_EA0_6505_WEBMAIL-RC11.sysops.aol.com
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="us-ascii"

<HTML><BODY>
<div>Hi,<br>

<br>

I have a Fedora Core 6 system with a root volume group (VolGroup00)
spanning 2 physical drives. Through my own negligence the first drive
got overwritten when the system was rebooted with a bootable cd in the
drive. This effectively reformated the primary drive but left the
second drive intact. What I would like to do is mount the second drive
to see if there is any data worth retrieving before rebuilding the
system. <br>

<br>

I can boot onto a rescue CD so I can access the drive through lvm.
lvdisplay reports that it cannot find all of the physical volumes which
makes sense as the other drive was reformatted. pvscan also reports a
missing drive. <br>

<br>

Can anyone give me a pointer on what might be my next step?<br>

<br>

Thanks!<br>

Pete </div>

<div class="AOLPromoFooter">
<hr style="margin-top:10px;" />
AOL now offers free email to everyone.  Find out more about what's free from AOL at <a href="http://pr.atwola.com/promoclk/1615326657x4311227241x4298082137/aol?redir=http://www.aol.com" target="_blank"><b>AOL.com</b></a>.<br />
</div>

</BODY></HTML>

----------MB_8C9360FAE02F3E0_EA0_6505_WEBMAIL-RC11.sysops.aol.com--
