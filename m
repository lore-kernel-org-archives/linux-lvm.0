Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3EF4PaF004944
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 11:04:25 -0400
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3EF4AZh022236
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 11:04:10 -0400
Received: from fela.liber4e.com (fela.liber4e.com [127.0.0.1])
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id o3EF40lh009906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 16:04:10 +0100
Message-ID: <a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
In-Reply-To: <230efd8b7a2864c37b18fb4c0617b4b5.squirrel@fela.liber4e.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
	<cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
	<20100225161112.GA14691@us.ibm.com>
	<230efd8b7a2864c37b18fb4c0617b4b5.squirrel@fela.liber4e.com>
Date: Wed, 14 Apr 2010 15:03:59 -0000 (GMT)
From: "jose nuno neto" <jose.neto@liber4e.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lvm hangs on San fail
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi2all

I'm on RHEL 5.4 with
lvm2-2.02.46-8.el5_4.1
2.6.18-164.2.1.el5

I have a multipathed SAN connection with what Im builing LVs
Its a Cluster system, and I want LVs to switch on failure

If I simulate a fail through the OS via /sys/bus/scsi/devices/$DEVICE/delete
I get a LV fail and the service switch to other node

But if I do it "real" portdown on the SAN Switch, multipath reports path
down, but LVM commands hang forever and nothing gets switched

from the logs i see multipath failing paths, and lvm Failed to remove faulty
"devices"

Any ideas how I should  "fix" it?

Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Log device, 253:53, has failed.
Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Device failure in
vg_ora_scapa-lv_ora_scapa_redo
Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Another thread is handling an
event.  Waiting...

Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
paths: 0
Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
paths: 0
Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
paths: 0
Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
paths: 0

Apr 14 16:03:05 dc1-x6250-a lvm[15622]: Device failure in
vg_syb_roger-lv_syb_roger_admin
Apr 14 16:03:14 dc1-x6250-a lvm[15622]: Failed to remove faulty devices in
vg_syb_roger-lv_syb_roger_admin

Much Thanks
Jose
