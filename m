Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3F9WNWC016771
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2010 05:32:23 -0400
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3F9WDTY020657
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2010 05:32:14 -0400
Received: by vws5 with SMTP id 5so143901vws.33
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2010 02:32:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <dfcfa84ce3699e54c9fd46ec9513ec78.squirrel@fela.liber4e.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
	<cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
	<20100225161112.GA14691@us.ibm.com>
	<230efd8b7a2864c37b18fb4c0617b4b5.squirrel@fela.liber4e.com>
	<a6e6303b5e6ea7de1c0bf2618b82bd80.squirrel@fela.liber4e.com>
	<1271286129.2462.0.camel@localhost>
	<dfcfa84ce3699e54c9fd46ec9513ec78.squirrel@fela.liber4e.com>
Date: Thu, 15 Apr 2010 02:32:13 -0700
Message-ID: <n2oea5cdf451004150232t3868435cnc286099b2f6e146b@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Can you post the output of pvdisplay?

Also the output of multipath when the port is down?

If your multipath output is still showing all paths [active][ready]
when you shut a port down, you might need to change the path_checker
option. I don't have a Hitachi array but readsector0 (the default) did
not work for me, directio does. This could be LVM seeing IO is timing
out, but the multipath stuff isn't downing a dead path.


On Thu, Apr 15, 2010 at 1:29 AM, jose nuno neto <jose.neto@liber4e.com> wrote:
> GoodMornings
>
> This is what I have on multipath.conf
>
> blacklist {
> � � � �wwid SSun_VOL0_266DCF4A
> � � � �wwid SSun_VOL0_5875CF4A
> � � � �devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st)[0-9]*"
> � � � �devnode "^hd[a-z]"
> }
> defaults {
> � � � � � � � �user_friendly_names � � � � � � yes
> }
> devices {
> � � � device {
> � � � � � � � �vendor � � � � � � � � � � � � �"HITACHI"
> � � � � � � � �product � � � � � � � � � � � � "OPEN-V"
> � � � � � � � �path_grouping_policy � � � � � �group_by_node_name
> � � � � � � � �failback � � � � � � � � � � � �immediate
> � � � � � � � �no_path_retry � � � � � � � � � fail
> � � � }
> � � � device {
> � � � � � � � �vendor � � � � � � � � � � � � �"IET"
> � � � � � � � �product � � � � � � � � � � � � "VIRTUAL-DISK"
> � � � � � � � �path_checker � � � � � � � � � �tur
> � � � � � � � �path_grouping_policy � � � � � �failover
> � � � � � � � �failback � � � � � � � � � � � �immediate
> � � � � � � � �no_path_retry � � � � � � � � � fail
> � � � }
> }
>
> As an example this is one LUN. It shoes [features=0] so I'd say it should
> fail right way
>
> mpath-dc2-a (360060e8004f240000000f24000000502) dm-15 HITACHI,OPEN-V � � �-SU
> [size=26G][features=0][hwhandler=0][rw]
> \_ round-robin 0 [prio=4][active]
> �\_ 5:0:1:0 � � sdu �65:64 �[active][ready]
> �\_ 5:0:1:16384 sdac 65:192 [active][ready]
> �\_ 5:0:1:32768 sdas 66:192 [active][ready]
> �\_ 5:0:1:49152 sdba 67:64 �[active][ready]
> \_ round-robin 0 [prio=4][enabled]
> �\_ 3:0:1:0 � � sdaw 67:0 � [active][ready]
> �\_ 3:0:1:16384 sdbe 67:128 [active][ready]
> �\_ 3:0:1:32768 sdbi 67:192 [active][ready]
> �\_ 3:0:1:49152 sdbm 68:0 � [active][ready]
>
> It think they fail since I see this messages from LVM:
> Apr 14 16:03:05 dc1-x6250-a lvm[15622]: Device failure in
> vg_syb_roger-lv_syb_roger_admin
> Apr 14 16:03:14 dc1-x6250-a lvm[15622]: Failed to remove faulty devices in
> vg_syb_roger-lv_syb_roger_admin
>
> But from some reason LVM cant remove them, any option I should have on
> lvm.conf?
>
> BestRegards
> Jose
>> post your multipath.conf file, you may be queuing forever ?
>>
>>
>>
>> On Wed, 2010-04-14 at 15:03 +0000, jose nuno neto wrote:
>>> Hi2all
>>>
>>> I'm on RHEL 5.4 with
>>> lvm2-2.02.46-8.el5_4.1
>>> 2.6.18-164.2.1.el5
>>>
>>> I have a multipathed SAN connection with what Im builing LVs
>>> Its a Cluster system, and I want LVs to switch on failure
>>>
>>> If I simulate a fail through the OS via
>>> /sys/bus/scsi/devices/$DEVICE/delete
>>> I get a LV fail and the service switch to other node
>>>
>>> But if I do it "real" portdown on the SAN Switch, multipath reports path
>>> down, but LVM commands hang forever and nothing gets switched
>>>
>>> from the logs i see multipath failing paths, and lvm Failed to remove
>>> faulty
>>> "devices"
>>>
>>> Any ideas how I should �"fix" it?
>>>
>>> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Log device, 253:53, has failed.
>>> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Device failure in
>>> vg_ora_scapa-lv_ora_scapa_redo
>>> Apr 14 16:02:45 dc1-x6250-a lvm[15622]: Another thread is handling an
>>> event. �Waiting...
>>>
>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
>>> paths: 0
>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-a: remaining active
>>> paths: 0
>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
>>> paths: 0
>>> Apr 14 16:02:52 dc1-x6250-a multipathd: mpath-dc1-b: remaining active
>>> paths: 0
>>>
>>> Apr 14 16:03:05 dc1-x6250-a lvm[15622]: Device failure in
>>> vg_syb_roger-lv_syb_roger_admin
>>> Apr 14 16:03:14 dc1-x6250-a lvm[15622]: Failed to remove faulty devices
>>> in
>>> vg_syb_roger-lv_syb_roger_admin
>>>
>>> Much Thanks
>>> Jose
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
