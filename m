Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3EHcSoZ030255
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 13:38:28 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3EHcJ8c023199
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 13:38:19 -0400
Received: by wwb22 with SMTP id 22so80268wwb.33
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 10:38:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
	<cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
	<20100225161112.GA14691@us.ibm.com>
	<230efd8b7a2864c37b18fb4c0617b4b5.squirrel@fela.liber4e.com>
	<a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
Date: Wed, 14 Apr 2010 12:38:15 -0500
Message-ID: <o2pf4f537b51004141038j6a061307k28a5f830881ee280@mail.gmail.com>
From: Eugene Vilensky <evilensky@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

What is your multipath.conf  setting of "queue_if_no_path?

On 4/14/10, jose nuno neto <jose.neto@liber4e.com> wrote:
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
>

-- 
Sent from my mobile device

Regards,
Eugene Vilensky
evilensky@gmail.com
