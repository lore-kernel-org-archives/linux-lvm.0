Message-ID: <53D6085D.2030303@redhat.com>
Date: Mon, 28 Jul 2014 10:22:53 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
In-Reply-To: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How LVM root volumes gets mounted at boot time ?
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
To: vivekonline86@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 07/25/2014 10:50 PM, Vivek Satpute wrote:
> Hi, 
> 
> I am seeing that LVM2 is integrated with systemd framework and so
> accordingly there are many changes in the way how LVM rootfs volume get
> mounted at boot-up time.
> 
> For root LVM volume, LVM create virtual block device
> "/dev/rhel_host/root". And systemd shows following description of this
> device.
> 
> [root@host vivek]# systemctl show dev-rhel_host-root.device
> Id=dev-rhel_host-root.device
> Names=dev-rhel_host-root.device
> Following=sys-devices-virtual-block-dm\x2d0.device
> Description=/dev/rhel_host/root
> *LoadState=loaded*
> *ActiveState=active*
> *SubState=plugged*
> InactiveExitTimestamp=Thu 2014-07-24 15:13:50 IST
> InactiveExitTimestampMonotonic=17789280
> ActiveEnterTimestamp=Thu 2014-07-24 15:13:50 IST
> ActiveEnterTimestampMonotonic=17789280
> ActiveExitTimestampMonotonic=0
> InactiveEnterTimestampMonotonic=0
> CanStart=no
> CanStop=no
> CanReload=no
> CanIsolate=no
> StopWhenUnneeded=no
> RefuseManualStart=no
> RefuseManualStop=no
> AllowIsolate=no
> DefaultDependencies=yes
> OnFailureIsolate=no
> IgnoreOnIsolate=yes
> IgnoreOnSnapshot=yes
> NeedDaemonReload=no
> JobTimeoutUSec=1min 30s
> ConditionTimestampMonotonic=0
> ConditionResult=no
> Transient=no
> *SysFSPath=/sys/devices/virtual/block/dm-0*
> 
> 
> I want to know, 
> 1) How systemd and LVM create above dependency of "/dev/rhel_host/root"
> ? How "/dev/rhel_host/root" gets SysFsPath
> "*/sys/devices/virtual/block/dm-0" ? *

The dm-0 is the actual kernel name of the device and the sysfs item is
created automatically by block layer as for any other block device when
it's created/activated - the kernel name is always used for that sysfs
path.

The /dev/rhel_host/root is just a symlink created in addition to that
(either by udev and driven by udev rule or by LVM directly, but udev is
used by default now and it's the preferred way).

Systemd has access to the list of device kernel names and their associated
symlinks via udev database that systemd reads. The .device systemd units
are created automatically by systemd based on incoming events.

It's possible to set the description via udev rule, but we're not doing this.
So the description you see is in the "systemctl show" output is the default
one added by systemd itself.

> 
> 2) Which is the udev rule/systemd file creates above dependency (seen by
> command "systemctl show dev-rhel_host-root.device").

/lib/udev/rules.d/11-dm-lvm.rules and this line exactly:

# Create symlinks for top-level devices only.
ENV{DM_VG_NAME}=="?*", ENV{DM_LV_NAME}=="?*", SYMLINK+="$env{DM_VG_NAME}/$env{DM_LV_NAME}", GOTO="lvm_end"

That's for all LVs in general. The root LV is specific in a way that it's
activated in initramfs and hence it depends on how the initramfs is handled
in your distro. For example Fedora uses udev-driven dracut for the initramfs
which copies this rule into initramfs image and it activates the root LV directly,
not depending on lvmetad. But some distros may use lvmetad even in initramfs for
the root LV autoactivation (I think it's Arch Linux that does it this way at the
moment). All the /dev content is created by udev.

> 
> 3) How LVM root volume " /dev/rhel_host/root" gets mounted ? Does it
> handled by LVmetaD ?

Mount points are never handled by lvmetad. Lvmetad only handles LVM metadata
caching and LVM volume autoactivation (with the help of udev since lvmetad needs
to know when the underlying device - PV - appears.).

Systemd itself handles mounting - it either reads /etc/fstab and translates
it into .mount systemd units or it uses native .mount systemd unit if they
exist. Systemd then waits for the particular .device unit the .mount unit is
bound to and if the device is present, it mounts it...

> 
> Any suggestions/inputs would be welcome.
> 
> 
> Thanks and Regards,
> Vivek
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Peter
