Message-ID: <53E46F5F.1090709@redhat.com>
Date: Fri, 08 Aug 2014 08:34:07 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
	<53D6085D.2030303@redhat.com>
	<CAK4r=d4wtwm+n=JyKrd7yrCqw-EjSoZagtDEMONUTz9acg2C3g@mail.gmail.com>
In-Reply-To: <CAK4r=d4wtwm+n=JyKrd7yrCqw-EjSoZagtDEMONUTz9acg2C3g@mail.gmail.com>
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
To: Vivek Satpute <vivekonline86@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 08/07/2014 08:20 PM, Vivek Satpute wrote:
> Thanks a lot Peter for replying.
> 
> I know that */sys/devices/virtual**/block/dm-0  *SysFsPath would get
> created by block-layer when corresponding block device gets created. 
> 
> Actually I am looking for how below dependencies is getting created for
> LVM volume by systemd:
> 
> [root@host]# systemctl show dev-rhel_host-root.device
> Id=dev-rhel_host-root.device
> Names=dev-rhel_host-root.device
> *Following=sys-devices-virtual-block-dm\x2d0.device
> *
> [...]
> *SysFSPath=/sys/devices/virtual/block/dm-0*
> *
> *
> /dev/rhel_host/root (path of LVM volume) is actually a symbolic link
> pointing to /dev/dm-0, then how systemd recognize that
> device dev-rhel_host-root.device
> follows *sys-devices-virtual-block-dm\x2d0.device ?*
> *

Systemd can read this information from udev events (or udev database records).
The information about all existing symlinks and their names, the dev node name
("kernel name") and related sysfs link is all recorded in udev database so systemd
just makes the .device unit out of this information.

-- 
Peter
