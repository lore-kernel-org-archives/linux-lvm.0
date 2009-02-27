Message-ID: <49A81CA2.7080907@redhat.com>
Date: Fri, 27 Feb 2009 17:02:26 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>	
	<49A814EA.3090902@redhat.com>
	<1235752705.1193.32.camel@pc.interlinx.bc.ca>
In-Reply-To: <1235752705.1193.32.camel@pc.interlinx.bc.ca>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Brian J. Murrell wrote:
> /dev/ram14: Not using O_DIRECT Opened /dev/ram14 RO /dev/ram14:
> block size is 4096 bytes /dev/ram14: No label detected Closed
> /dev/ram14 /dev/ram15: Not using O_DIRECT Opened /dev/ram15 RO 
> /dev/ram15: block size is 4096 bytes /dev/ram15: No label detected 
> Closed /dev/ram15 No volume groups found

So it's not scanning /dev/sda at all (only ramdisks?). Do you have any
filter settings in lvm.conf and are you sure that the SD device nodes
will have been created at this point in the boot process?

You don't mention the distribution you're using but most 2.6 based
setups will use udev to manage driver loading and device node creation
during boot. It's possible for these to get out of sync in some cases.

Is there any way you can grab a listing of /dev at the moment the
vgchange runs during boot?

> 
> When I specify the volume group, I see this:
> 
> Processing: vgchange -v -v -v -a n lustre O_DIRECT will be used 
> Setting global/locking_type to 1 File-based locking selected. 
> Setting global/locking_dir to /var/lock/lvm Using volume group(s)
> on command line Locking /var/lock/lvm/V_lustre RB Finding volume
> group "lustre" ...

Did it scan /dev/sda this time?

> Wiping cache of LVM-capable devices /dev/console: Not a block
> device /dev/core: Not a block device /dev/evtchn: Not a block
> device /dev/fd: Symbolic link to directory ...
> 
> and it considers a whole boatload more devices, including /dev/sda,
>  where my volume groups is.  Now the one thing that just occurred
> to me as relevant is that my root filesystem (/) is read-only.

Shouldn't matter.

Just to be clear, are you only seeing this problem during boot or are
you able to reproduce once the system has completed booting (i.e.
vgchange -ay fails but vgchange -ay <vg name> succeeds)?

Your earlier messages didn't make that clear.

Regards,
Bryn.
