References: <kcim.5836db3b.7323.0bc3159117d344ab@ucs.cubewerk.intern>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <13f7d82e-0481-0508-cf5b-ec2a46736123@redhat.com>
Date: Thu, 24 Nov 2016 14:38:23 +0100
MIME-Version: 1.0
In-Reply-To: <kcim.5836db3b.7323.0bc3159117d344ab@ucs.cubewerk.intern>
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
Cc: sb@plzk.de

On 11/24/2016 01:21 PM, Stefan Bauer wrote:
> hi folks, 
> 
> howto avoid pvescan to initialize lvm volume groups on startup (it's for a cluster setup)? auto_activation_volume_list was filled with the remaining VGs we want to setup. Manually it does what it should 
> 
> /sbin/lvm pvescan --config 'activation { auto_activation_volume_list = "vg2" }'  only activates vg2 but keeps vg1 "untouched".
> 
> But on system startup, all VGs are activated. (ubuntu 14.04.5 LTS)
> 
> We also updated the ramdisk and verified, the changes are also in the ramdisks lvm.conf
> 
> However vg1 is also enabled.
> 
> Any help is greatly appreciated.

It's important that all scripts which handle LVM activation at boot are
executed with vgchange -aay that honours the auto_activation_volume_list
(so not "vgchange -ay").

All init scripts and systemd units which upstream LVM2 provides are
executed with "-aay" already.

You mentioned cluster setup - so are your VGs clustered and are you
using clvmd? If that's the case, the clustered VGs are activated either
by clvmd init script/systemd unit or external cluster resource agent
(e.g. pacemaker and clvm ocf file) which calls the vgchange to activate
the clustered VGs - that one needs to use "-aay" too.

-- 
Peter
