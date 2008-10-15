Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9FG79aB020314
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 12:07:09 -0400
Received: from cdc-exfep1.ciber.cbr.inc (fw.ciber.com [12.10.248.50])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9FG6wQp027527
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 12:06:59 -0400
Subject: Re: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
From: Peter Larsen <plarsen@CIBER.com>
In-Reply-To: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
References: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
Date: Wed, 15 Oct 2008 12:06:54 -0400
Message-Id: <1224086814.7418.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2008-10-15 at 18:50 +0530, himanshu padmanabhi wrote:
> 
> I am using "iscsi-initiator-utils-6.2.0.865-0.2.fc7" as initiator and 
> "iscsitarget-0.4.15-1" as target. 
> 
> 
> Following is the scenario 
> 
> 
> PV  =  local_disk1       remote_disk1  (i.e PV is formed using 2
> disks 
> 1 local and 1 from iscsitarget) 

Strange construction?
Why not simply format each target as a separate PV and then join them in
a single VG? Much easier to manage. 

That aside - I wouldn't mix and match that way. You're getting very
different response times and security issues on each device. I would
treat them very different.

> VG  =  Vgname 

You need to assign the PV's to your VG.

> LV =  lv_localdisk_1       lv_localremotedisk1 
> lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote 
> iscsitarget and one from combination of both) 

That makes no sense. You don't use physical volumes when you create
logical ones. You use groups. You don't assign physical devices like
that when you do LVs.

> I performed "logout" operation on "remote_disk1" after deactivating 
> "lv_localremotedisk1 and           lv_remotedisk1" on it using 
> "lvchange" command. 
> 
> 
> Then result I should at least get, 
> 
> 
> PV  =  local_disk1    (remote_disk1 is removed now) 
> 
> 
> VG = Vgname 
> 
> 
> LV = lv_localdisk1     (So LVs containing PVs as "remote_disk1" are 
> deactivated.It can be in combination with local disk also)

No - things don't work that way. If you damage/remove a PV from a VG -
everything in that VG gets disabled until the whole VG is operational.
It doesn't matter if your LV is in the area damaged or not.

> i.e They all were lost temporarily. 

Not temporarily. As long as the VG is bad, nothing is there. You should
see all available PVs but the way you set it up, you didn't do a PV on
each disk so when the disk-group sees one disk missing the whole disk
group is offline, you loose your PV, your VG gets deactivated = the
result you see.

> When I logged in to the same target and activated the LVs on 
> "remote_disk1",I got my original configuration.i.e. 

Because your PV is now present, the VG can activate etc.


--- 
Regards
    Peter Larsen

We have met the enemy, and he is us.
		-- Walt Kelly
