Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1INuvi24049
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 18:56:57 -0500
Received: from web14705.mail.yahoo.com (web14705.mail.yahoo.com [216.136.224.122])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1INuvb13943
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 18:56:57 -0500
Message-ID: <20040218235656.60660.qmail@web14705.mail.yahoo.com>
From: Randy Rubins <lv_hockey@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] inactive PV associated to unknown VG
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 18:56:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm having a problem importing a VG after
re-installing the server (original OS version RH 7.3,
new RHEL 3 AS).  LVM is picking up the /dev/sdb, as
well as the new /dev/sdb1 PV.  Any way to tell LVM to
ignore /dev/sdb and force it to use /dev/sdb1?  
BTW, the LVM version used on RH 7.3 was 0.9.1_beta7,
the new LVM version - whatever comes with RHEL 3 AS
update 1.

Thanks,
Randy

pvscan -- reading all physical volumes (this may take
a while...)
pvscan -- ACTIVE   PV "/dev/sda2" of VG "rootvg" 
[16.45 GB / 4.69 GB free]
pvscan -- inactive PV "/dev/sdb"   is associated to
unknown VG "localvg" (run vgscan)
pvscan -- inactive PV "/dev/sdb1"  is associated to
unknown VG "localvg" (run vgscan)
pvscan -- total: 3 [45.42 GB] / in use: 3 [45.42 GB] /
in no VG: 0 [0]

=====
Randy Rubins (eBay ID: lv_hockey)
mailto://lv_hockey@yahoo.com

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools
