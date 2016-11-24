Received: from alatyr.brq.redhat.com (ovpn-200-47.brq.redhat.com
	[10.40.200.47])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAODto0c016539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 08:55:52 -0500
References: <kcim.5836db3b.7323.0bc3159117d344ab@ucs.cubewerk.intern>
	<13f7d82e-0481-0508-cf5b-ec2a46736123@redhat.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <d217f423-3f3d-66f3-4e8f-40c22fe83a5a@redhat.com>
Date: Thu, 24 Nov 2016 14:55:50 +0100
MIME-Version: 1.0
In-Reply-To: <13f7d82e-0481-0508-cf5b-ec2a46736123@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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

On 11/24/2016 02:38 PM, Peter Rajnoha wrote:
> On 11/24/2016 01:21 PM, Stefan Bauer wrote:
>> hi folks, 
>>
>> howto avoid pvescan to initialize lvm volume groups on startup (it's for a cluster setup)? auto_activation_volume_list was filled with the remaining VGs we want to setup. Manually it does what it should 
>>
>> /sbin/lvm pvescan --config 'activation { auto_activation_volume_list = "vg2" }'  only activates vg2 but keeps vg1 "untouched".
>>
>> But on system startup, all VGs are activated. (ubuntu 14.04.5 LTS)
>>
>> We also updated the ramdisk and verified, the changes are also in the ramdisks lvm.conf
>>
>> However vg1 is also enabled.
>>
>> Any help is greatly appreciated.
> 
> It's important that all scripts which handle LVM activation at boot are
> executed with vgchange -aay that honours the auto_activation_volume_list
> (so not "vgchange -ay").
> 
> All init scripts and systemd units which upstream LVM2 provides are
> executed with "-aay" already.
> 
> You mentioned cluster setup - so are your VGs clustered and are you
> using clvmd? If that's the case, the clustered VGs are activated either
> by clvmd init script/systemd unit or external cluster resource agent
> (e.g. pacemaker and clvm ocf file) which calls the vgchange to activate
> the clustered VGs - that one needs to use "-aay" too.
> 

I looked at Ubuntu specific environment and I can see there's
/lib/udev/rules.d/85-lvm2.rules with:

SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}="lvm*|LVM*",
RUN+="watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'"

So that "watershed" should use vgchange -aay. Please report this for
Ubuntu directly for them to fix this (as the "watershed" helper binary
is specific to Debian/Ubuntu only).

-- 
Peter
