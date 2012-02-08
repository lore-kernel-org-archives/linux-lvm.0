Date: Wed, 8 Feb 2012 14:52:48 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120208195248.GA6993@redhat.com>
References: <CAFfJ-R7foimYyQ-NKKUmNuTfpH0hCMjZ_qkTf7Wbs43gk33UWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFfJ-R7foimYyQ-NKKUmNuTfpH0hCMjZ_qkTf7Wbs43gk33UWw@mail.gmail.com>
Subject: Re: [linux-lvm] lvmconvert --merge fails to remove devices on rebbot
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
Cc: Dusty Mabe <dustymabe@gmail.com>

On Wed, Feb 08 2012 at  2:10pm -0500,
Dusty Mabe <dustymabe@gmail.com> wrote:

> Hi,
> 
> I am on CentOS 6.2  (kernel-2.6.32-220.el6.x86_64.rpm,
> lvm2-2.02.87-6.el6.x86_64.rpm). I am seeing an issue similar to
> https://bugzilla.redhat.com/show_bug.cgi?id=651007 where I still have
> snapshot lvs present after I merge them back into the origin devices.
> 
> The steps are :
> 
> - create snapshot
> - lvconvert --merge (on open lv so that the merge will happen on next reboot)
> - reboot
> - after reboot the lvs have been restored to original, but 'lvs -a'
> still shows snapshot lvs
> 
> I was seeing many I/O errors during bootup like are shown in comment
> 13 of https://bugzilla.redhat.com/show_bug.cgi?id=651402 . I disabled
> dmraid on bootup and I no longer get these errors but the snapshot lvs
> are still present after the merge has taken place.

Odd considering dracut's modules.d/90dmraid/61-dmraid-imsm.rules was
patched to be DM_UDEV_DISABLE_OTHER_RULES_FLAG aware in RHEL 6.1 (via RH
bug# 650959).
 
> lvchange --refresh will clear up the snapshot lvs.

Implies the lvm2 polldaemon code isn't cleaning up the merged snapshot
lvs after the merge completes: I'm not sure what is going on there
because the issue was fixed in RHEL 6.1 (via RH bug# 645488).

> I do notice that dracut is touching the lvs (the ones to be merged)
> early in the boot process:
> 
> dracut: Scanning devices vda2  for LVM logical volumes vgroot/plat_root
> dracut: inactive Original '/dev/vgroot/plat_root' [1.00 GiB] inherit
> dracut: inactive Original '/dev/vgroot/plat_var' [1.00 GiB] inherit
> dracut: inactive Original '/dev/vgroot/plat_usr' [4.00 GiB] inherit
> dracut: inactive '/dev/vgroot/plat_tmp' [1.00 GiB] inherit
> EXT4-fs (dm-2): orphan cleanup on readonly fs
> EXT4-fs (dm-2): 1 orphan inode deleted
> EXT4-fs (dm-2): recovery complete
> EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts:
> dracut: Mounted root filesystem /dev/mapper/vgroot-plat_root
> SELinux:  Disabled at runtime.
> type=1404 audit(1328721625.889:2): selinux=0 auid=4294967295 ses=4294967295
> dracut:
> dracut: Switching root
>                 Welcome to CentOS
> 
> 
> Is there an issue with dracut accessing and mounting the root lv
> (which was set to be merged on next activation) ?

Activating the root LV will initiate the merge.  The fact that you only
need to 'lvchange --refresh' to clean up the dangling snapshot lvs means
that the merge did complete.

Once the system pivots ("dracut: Switching root") the normal lvm-monitor
service should initiate both monitoring and polling of all active lvs.
Do you have the lvm2-monitor service enabled?  And do you see messages
like the following at startup?:
Background polling started for 1 logical volume(s) in volume group "vgroot"
