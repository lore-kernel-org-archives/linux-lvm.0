Message-ID: <4F5A08DA.80402@redhat.com>
Date: Fri, 09 Mar 2012 14:42:50 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAKxJzGeWwVGOOH8VX08Rk_icG3uBEAvbPjRMSw=41Vt9gY_L1g@mail.gmail.com>
In-Reply-To: <CAKxJzGeWwVGOOH8VX08Rk_icG3uBEAvbPjRMSw=41Vt9gY_L1g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot removal fails first time under RAID
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Philip Boulain <philip.boulain@smoothwall.net>

Dne 7.3.2012 17:22, Philip Boulain napsal(a):
> We have a Debian Wheezy server using mirrored RAID running kernel
> 3.2.0-1-amd64 and LVM version 2.02.88-2. There seems to be an issue
> where snapshot removal fails due to being "in use" the first time, but
> repeating the operation will succeed:
> 
> # lvcreate --size 128M --name testvolume buildturbo64
>   Logical volume "testvolume" created
> # lvcreate --size 128M --snapshot --name testsnap buildturbo64/testvolume
>   Logical volume "testsnap" created
> # lvremove buildturbo64/testsnap
> Do you really want to remove active logical volume testsnap? [y/n]: y
>   LV buildturbo64/testsnap in use: not deactivating
>   Unable to deactivate logical volume "testsnap"
> # lvremove buildturbo64/testsnap
> Do you really want to remove active logical volume testsnap? [y/n]: y
>   Logical volume "testsnap" successfully removed
> # lvremove buildturbo64/testvolume
> Do you really want to remove active logical volume testvolume? [y/n]: y
>   Logical volume "testvolume" successfully removed
> 
> Note that no filesystem is even created here, so it's not mounted or
> anything. That volume group has plenty of free extents (vgdisplay
> excerpt):
> 
>   Alloc PE / Size       52353 / 204.50 GiB
>   Free  PE / Size       66794 / 260.91 GiB
> 
> This is repeatable every time and waiting arbitrary delays between the
> operations makes no difference. There is no difference if the logical
> volume is specified by its device node (/dev/buildturbo64/testsnap).
> 
> Under a *non-RAID* Debian Wheezy VM with an otherwise identical
> configuration, lvremove works first time, as I'd expect.
> 
> Is this a bug, or some form of user error?
> 

Looks like 'famous' watch rule problem with and udev.

Newer version of lvm are trying to a be bit smarted.
But for now easiest would be to remove  'watch' rule being executed on dm
devices if you need urgent solution.
i.e.:

https://bugzilla.redhat.com/show_bug.cgi?id=753105


Zdenek
