Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3EL2Eka007729
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:02:15 -0400
Received: from mail-pv0-f174.google.com (mail-pv0-f174.google.com
	[74.125.83.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3EL24Z2031226
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:02:04 -0400
Received: by pva18 with SMTP id 18so418502pva.33
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 14:02:04 -0700 (PDT)
From: brem belguebli <brem.belguebli@gmail.com>
In-Reply-To: <a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
	<cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
	<20100225161112.GA14691@us.ibm.com>
	<230efd8b7a2864c37b18fb4c0617b4b5.squirrel@fela.liber4e.com>
	<a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
Date: Thu, 15 Apr 2010 01:02:09 +0200
Message-ID: <1271286129.2462.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Lvm hangs on San fail
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
To: LVM general discussion and development <linux-lvm@redhat.com>

post your multipath.conf file, you may be queuing forever ?



On Wed, 2010-04-14 at 15:03 +0000, jose nuno neto wrote:
> Hi2all
> 
> I'm on RHEL 5.4 with
> lvm2-2.02.46-8.el5_4.1
> 2.6.18-164.2.1.el5
> 
> I have a multipathed SAN connection with what Im builing LVs
> Its a Cluster system, and I want LVs to switch on failure
> 
> If I simulate a fail through the OS via /sys/bus/scsi/devices/$DEVICE/delete
> I get a LV fail and the service switch to other node
> 
> But if I do it "real" portdown on the SAN Switch, multipath reports path
> down, but LVM commands hang forever and nothing gets switched
> 
> from the logs i see multipath failing paths, and lvm Failed to remove faulty
> "devices"
> 
> Any ideas how I should  "fix" it?
> 
> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Log device, 253:53, has failed.
> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Device failure in
> vg_ora_scapa-lv_ora_scapa_redo
> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Another thread is handling an
> event.  Waiting...
> 
> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
> paths: 0
> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
> paths: 0
> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
> paths: 0
> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
> paths: 0
> 
> Apr 14 16:03:05 dc1-x6250-a lvm[15622]: Device failure in
> vg_syb_roger-lv_syb_roger_admin
> Apr 14 16:03:14 dc1-x6250-a lvm[15622]: Failed to remove faulty devices in
> vg_syb_roger-lv_syb_roger_admin
> 
> Much Thanks
> Jose
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
