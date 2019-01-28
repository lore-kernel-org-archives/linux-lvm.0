References: <ba63b761-d169-a290-3cd9-c6d61f4d5514@gmail.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <e27ad157-702b-0cbd-55fa-8779a044c016@redhat.com>
Date: Mon, 28 Jan 2019 11:29:54 +0100
MIME-Version: 1.0
In-Reply-To: <ba63b761-d169-a290-3cd9-c6d61f4d5514@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option devices/dir different from /dev does not work
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Andrei Borzenkov <arvidjaar@gmail.com>

On 1/26/19 10:14 PM, Andrei Borzenkov wrote:
> I attempt to put device nodes for volumes in sub-directory of /dev to
> avoid accidental conflict between device name and volume group and
> general /dev pollution. VxVM always did it, using /dev/vx as base
> directory, so I would use something like /dev/lvm.
> 
> Option devices/dir sounds like exactly the right one based on description:
> 
> # Directory in which to create volume group device nodes.
> 
> Unfortunately it appears to have no effect, LVM devices are still
> created directly under /dev. The only device under /dev/lvm is
> /dev/lvm/mapper/control ...
> 
> I suspect the reason is, device nodes are created by udev and it does
> not know anything about LVM settings:
> 
> # Create symlinks for top-level devices only.
> ENV{DM_VG_NAME}=="?*", ENV{DM_LV_NAME}=="?*",
> SYMLINK+="$env{DM_VG_NAME}/$env{DM_LV_NAME}", GOTO="lvm_end"
> 
> Is it intentional? In this case at the very least comment in lvm.conf
> should explicitly say that this setting has no effect if udev
> integration is enabled.
> 

Yes, this works as expected. Now, we rely fully on udev to create the
/dev content for us.

However, there are still options like:
  activation/verify_udev_operations
  activation/udev_sync
  activation/udev_rules
  devices/obtain_device_list_from_udev

These can change the way how LVM relies on udev and so we can still make
LVM to work by creating the /dev content itself somehow, bypassing
udev... (kernel will still create the /dev/<kernel_name> thouhg, in our
case the "/dev/dm-N")

But don't change defaults for these settings here, please! Consider
those settings as advanced or meant to be used only for testing and debug.

The /dev content should be always created by udev these days otherwise
we can run into problems - anyone reading udev database (there are
various system components doing it today) won't see any content that was
created in /dev without udev! And LVM itself reads the udev database to
get the list of block devices even! That's the
"obtain_device_list_from_udev" setting.

I can try to update the comments in the config so this is a bit clearer...


> openSUSE Tumbleweed just updated.
> 
> 10:~ # lvm2
> lvm2-2.02.180-3.1.x86_64
> 10:~ # lvmconfig --type full devices/dir
> dir="/dev/lvm"
> 10:~ # ls -l /dev/lvm
> total 0
> drwxr-xr-x 2 root root 60 Jan 27 00:05 mapper
> 10:~ # pvs
>   PV         VG     Fmt  Attr PSize  PFree
>   /dev/sdb   vgTEST lvm2 a--  10.00g 9.90g
> 10:~ # vgs
>   VG     #PV #LV #SN Attr   VSize  VFree
>   vgTEST   1   1   0 wz--n- 10.00g 9.90g
> 10:~ # lvs
>   LV      VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>   lvTEST vgTEST -wi-a----- 100.00m
> 
> 10:~ # ls -l /dev/vgTEST
> total 0
> lrwxrwxrwx 1 root root 7 Jan 27 00:05 lvTEST -> ../dm-0
> 10:~ # ls -l /dev/lvm/mapper
> total 0
> crw------- 1 root root 10, 236 Jan 27 00:05 control
> 10:~ # ls -l /dev/mapper
> total 0
> crw------- 1 root root 10, 236 Jan 27 00:05 control
> lrwxrwxrwx 1 root root       7 Jan 27 00:05 vgTEST-lvTEST -> ../dm-0
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Peter
