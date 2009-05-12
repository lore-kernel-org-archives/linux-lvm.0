Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n4C8XR8N001061
	for <linux-lvm@redhat.com>; Tue, 12 May 2009 04:33:28 -0400
Subject: Re: [linux-lvm] removing a missing vg
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <f4f537b50905111222t46c9f2bdwa8239907af93a22e@mail.gmail.com>
References: <f4f537b50905111017p4edc87ccl1d0eb2d71c834a58@mail.gmail.com>
	<1242062874.13505.387.camel@breeves.fab.redhat.com>
	<f4f537b50905111222t46c9f2bdwa8239907af93a22e@mail.gmail.com>
Date: Tue, 12 May 2009 09:36:46 +0100
Message-Id: <1242117407.13505.398.camel@breeves.fab.redhat.com>
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

On Mon, 2009-05-11 at 14:22 -0500, Eugene Vilensky wrote:

>         dmsetup remove <device name>
> 
> on the LV device?
> 
> #dmsetup remove /dev/vgTEST/lvTEST 
> dm_task_set_name: Device /dev/vgTEST/lvTEST not found
> Command failed

No, that's just a symbolic link. You want the device in the /dev/mapper
directory named as VgName-LvName.

E.g. on a machine with a VG named system containing an LV named lv00:
# ls -l /dev/system/lv00 
lrwxrwxrwx  1 root root 23 Mar 30 10:04 /dev/system/lv00
-> /dev/mapper/system-lv00

# dmsetup remove /dev/system/lv00 
dm_task_set_name: Device /dev/system/lv00 not found
Command failed
# dmsetup remove system-lv00

The arguments to dmsetup are documented in its man page. When you remove
an LV like this you'll be left with a dangling symlink in
the /dev/VgName directory. You can clean this up with rm if you wish
although leaving it lying around won't cause any zblems.

> on the mpath device?
> 
> # dmsetup remove /dev/mpath/mpath1 
> device-mapper: remove ioctl failed: Device or resource busy
> Command failed

You need to remove the LV first.

Regards,
Bryn.

> 
