Message-ID: <52020FD1.2000004@redhat.com>
Date: Wed, 07 Aug 2013 11:13:53 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130806173719.GB15184@mail.waldi.eu.org>
In-Reply-To: <20130806173719.GB15184@mail.waldi.eu.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com, waldi@debian.org

Dne 6.8.2013 19:37, Bastian Blank napsal(a):
> Hi
>
> I tried to tackle a particular bug that shows up in Debian for some time
> now. Some blamed the udev rules and I still can't completely rule them
> out. But this triggers a much worse bug in the error cleanup of the
> snapshot remove. I reproduced this with Debian/Linux 3.2.46/LVM 2.02.99
> without udevd running and Fedora 19/LVM 2.02.98-10.fc19.
>
> On snapshot removal, LVM first converts the device into a regular LV
> (lv_remove_snapshot) and in a second step removes this LV
> (lv_remove_single). Is there a reason for this two step removal? An
> error during removal leaves a non-snapshot LV behind.
>
> I hold the cow device open so it will run into the error condition:
> | $ sleep 100 < /dev/mapper/vg-test_snap-cow&


You are breaking the lvm2 logic thus pushing the code to go through unexpected 
error code path - user is never supposed to open so called 'private' 
/dev/mapper/ devices.

>
> Then try to remove the LV:
> | $ lvremove vg/test_snap

With upstream lvm2 code - there is embedded 'retry' loop - so the removal
should be retried for couple times (controllable by lvm.conf).

That's because udev WATCH rule might be fired basically anytime after close of 
device opened in write mode - so it may happen lvm2 checks device is not 
opened and could be removed, but the udev WATCH rules opens temporarily device 
and lvm2 then fails to remove device, which has been previously detected as 
unused.

So to fight with this issue - for unmounted device lvm2 retries remove 
operation couple times, with the hope WATCH rule scan finishes quickly.

In the future kernel target driver may support something like device 
auto-remove, but it's not yet there in upstream kernel....


>
> lv_remove_snapshot first suspends all devices:
>
> | #metadata/lv_manip.c:4429     Removing snapshot test_snap
> | #libdm-deptree.c:1314     Suspending vg-test_base (253:8) with device flush
> | #ioctl/libdm-iface.c:1724         dm suspend   (253:8) NFS    [16384] (*1)
> | #libdm-common.c:210         Suspended device counter increased to 1
> | #ioctl/libdm-iface.c:1724         dm info   (253:9) NF   [16384] (*1)
> | #libdm-deptree.c:1314     Suspending vg-test_snap (253:9) with device flush
> | #ioctl/libdm-iface.c:1724         dm suspend   (253:9) NFS    [16384] (*1)
> | #libdm-common.c:210         Suspended device counter increased to 2
> | #ioctl/libdm-iface.c:1724         dm info   (253:10) NF   [16384] (*1)
> | #libdm-deptree.c:1314     Suspending vg-test_base-real (253:10) with device flush
> | #ioctl/libdm-iface.c:1724         dm suspend   (253:10) NFS    [16384] (*1)
> | #libdm-common.c:210         Suspended device counter increased to 3
> | #ioctl/libdm-iface.c:1724         dm info   (253:11) NF   [16384] (*1)
> | #libdm-deptree.c:1314     Suspending vg-test_snap-cow (253:11) with device flush
> | #ioctl/libdm-iface.c:1724         dm suspend   (253:11) NFS    [16384] (*1)
> | #libdm-common.c:210         Suspended device counter increased to 4
>
> Commits the VG:
>
> | #format_text/format-text.c:735         Committing vg metadata (1276) to /dev/xvdb header at 4096
>
> Resumes three of the devices, but not vg-test_base:
>
> | #libdm-deptree.c:1263     Resuming vg-test_snap-cow (253:11)
> | #ioctl/libdm-iface.c:1724         dm resume   (253:11) NF   [16384] (*1)
> | #libdm-common.c:1338         vg-test_snap-cow: Stacking NODE_ADD (253,11) 0:6 0660 [trust_udev]
> | #libdm-common.c:1348         vg-test_snap-cow: Stacking NODE_READ_AHEAD 0 (flags=0)
> | #libdm-common.c:221         Suspended device counter reduced to 3
> | #libdm-deptree.c:1263     Resuming vg-test_base-real (253:10)
> | #ioctl/libdm-iface.c:1724         dm resume   (253:10) NF   [16384] (*1)
> | #libdm-common.c:1338         vg-test_base-real: Stacking NODE_ADD (253,10) 0:6 0660 [trust_udev]
> | #libdm-common.c:1348         vg-test_base-real: Stacking NODE_READ_AHEAD 0 (flags=0)
> | #libdm-common.c:221         Suspended device counter reduced to 2
> | #libdm-deptree.c:1263     Resuming vg-test_snap (253:9)
> | #ioctl/libdm-iface.c:1724         dm resume   (253:9) NF   [16384] (*1)
> | #libdm-common.c:1338         vg-test_snap: Stacking NODE_ADD (253,9) 0:6 0660 [trust_udev]
> | #libdm-common.c:1348         vg-test_snap: Stacking NODE_READ_AHEAD 256 (flags=1)
> | #libdm-common.c:221         Suspended device counter reduced to 1
>
> Now it fails to do lv_activate on the cow device, because it is still
> open:
>
> | #libdm-deptree.c:1562   Unable to deactivate open vg-test_snap-cow (253:11)
> | #metadata/snapshot_manip.c:291   Failed to activate test_snap.
>
> And exits without further error handling and with one suspended device:
>
> |  libdevmapper exiting with 1 device(s) still suspended.
>

There has been bug affecting cluster usage of exclusive snapshots in pre .99 
version - the order of taking locks for devices was not correct, and if there
has  been clvmd restart during snapshot - it has caused some problems.

But for current (.99) code - in normal case the operation should work 
properly. For any unpredictable errors -  lvm2 command should print error 
message and it's up-to admin to fix dangling device and table entries.

So in the case you are trying - lvm2 is expected to fail - since lvm2 doesn't 
support the use of  /dev/mapper/ entries  (which is where the -cow is only 
visible).

User of lvm2 is expected to open only 'public' /dev/vgname/lvname  entries. 
If anyone tries to 'lock' on /dev/mapper/names, lvm2 cannot be blamed for 
reporting errors - simply because this is unsupported. So lvm2 shows message, 
exits, and expects admin to fix problem in the system.

Of course some error paths are really tricky and there is too many of them and 
there is BIG room for improvement, so patches are welcomed -  the rule here 
is, that no devices should be left in suspend state - since this is causing 
real problems.

You could probably join #irc channel to discuss possible improvements here.

Zdenek
