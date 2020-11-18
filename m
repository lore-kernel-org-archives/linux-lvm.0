Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91EED1003207
	for <linux-lvm@redhat.com>; Wed, 18 Nov 2020 15:38:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63E32811E97
	for <linux-lvm@redhat.com>; Wed, 18 Nov 2020 15:38:48 +0000 (UTC)
References: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
	<20201117161725.GB18257@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <5b696518-0cfc-1d2b-c093-eb210c7a44a0@suse.com>
Date: Wed, 18 Nov 2020 23:38:30 +0800
In-Reply-To: <20201117161725.GB18257@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] discussion about
	activation/auto_activation_volume_list
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, agk@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On 11/18/20 12:17 AM, David Teigland wrote:
> On Tue, Nov 17, 2020 at 04:00:10PM +0800, heming.zhao@suse.com wrote:
>> Hello LVM-maintainers,
>>
>> Currently activation/auto_activation_volume_list is not enable and it does the default behavior:
>>    pvscan will activate all the devices on booting.
>>
>> This rule will trigger a clumsy process in HA (corosync+pacemaker stack) env.
>>
>> ## let me show the scenario:
>>
>> 2 nodes (A & B) share a disk, and using systemid to manage vg/lv on this shared disk.
>> (keep the activation/auto_activation_volume_list default style: comment out this cfg item)
>>
>> (below steps come from resource-agent LVM-active script)
>> 1. Node A own & active shared vg/lv, node B standby status.
>> 2. A reboot, B detect & wait for A rejoined cluster.
>> 3. because systemid doesn't be changed, lvm2-pvscan@.service will active the vg/lv on A during booting.
>> 4. A finishes reboot, B starts to switch systemid & active shared vg/lv.
>> 5. on B, pacemaker detects lvm resource is running on both nodes.
>> 6. on B, pacemaker restarts lvm resource and enable it on single node.
>>
>> ## rootcause:
>>
>> we can see step 3,4,5 is useless if step 3 is non-existent.
>> So the rootcause is step <3>: node A auto activate shared vg/lv.
> 
> I believe there's an assumption that the system or a user will not
> activate LVs that are managed by the cluster, i.e. only LVM-activate will
> activate LVs managed by the cluster.  Perhaps we could make some attempt
> to enforce that, or at least make sure the instructions for LVM-activate
> make it clear what to do.
> 
I agree this assumption.

>> ## discussion (how to fix):
>>
>> Could activation/auto_activation_volume_list support a new symbol/function like "!".
>> e.g.
>> auto_activation_volume_list = [ "!vg1", "!vg2/lvol1" ]
>> the '!' means lvm absolutely doesn't active this vg1 & vg2/lvol1 automatically.
>>
>> my question:
>> Does it acceptable for LVM2 adding this new function?
> 
> auto_activation_volume_list is difficult to use IMO, and I don't think
> many people use it.  Your suggestion sounds reasonable, but I've wondered
> if autoactivation should be a property set on the VG or LV itself (i.e.
> in the metadata)?  The "activationskip" flag is a possible way to handle
> the unwanted autoactivation, and also seems to justify the idea of making
> autoactivation a similar flag.
> 

the idea of new flag is very good. and we should have a complete solution.
now I am thinking is:
 when/how to clean this flag. how to manage it without ha stack

the normal logic of doing remove action is to be done in RA stop cmd.
If the customer doesn't want to follow the rule to stop resource in crmsh.
and only use "systemctl stop" & "rm -rf pacemaker & corosync" to stop, the flag
won't be remove anymore. (or pacemaker is abnormal, customer must use force method)
We should add some new parameters of exist cmds to show & manage this new flag.

Thanks
