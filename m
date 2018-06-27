Date: Wed, 27 Jun 2018 09:23:57 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180627142357.GB5690@redhat.com>
References: <CABZYMH6HdrtYOb-eu1VOfUAMv+OqzzuP3VBviZLX=2M5WJTX-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH6HdrtYOb-eu1VOfUAMv+OqzzuP3VBviZLX=2M5WJTX-g@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] "Duplicate sanlock global locks" warned
 but not found in "lvmlockctl -i"
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
To: Damon Wang <damon.devops@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jun 27, 2018 at 10:03:00PM +0800, Damon Wang wrote:
> Hi all,
> 
>   I found duplicate sanlock locks in lvm operation:
> 
>     [root@172-20-11-108 ~]# vgs
>       Duplicate sanlock global locks should be corrected
>       Duplicate sanlock global lock in VG 9e9e5a689750430daff18da75c9718cc
>       Couldn't find device with uuid 7oDKl3-TvVY-Q24z-Q2BC-psUZ-SFCX-j1fhQE.
>       Duplicate sanlock global lock in VG 8c32e39f49024e64832c1bc3fd15f948
>       VG                               #PV #LV #SN Attr   VSize    VFree
>       8c32e39f49024e64832c1bc3fd15f948   4  80   0 wz--ns <291.88g <263.32g
>       9e9e5a689750430daff18da75c9718cc   3  55   0 wz-pns  739.93g <702.65g
>       zstack                             1   2   0 wz--n-  <59.00g       0

> It seems not harmful, but I don't know why it happen.

It can be harmful if different hosts use different global locks.
There's a section in lvmlockd man page about how this happens and
how to correct it.  In short, it happens when you create a new sanlock VG
while the other one is not visible.  To correct it, you disable the global
lock in one of the VGs with 'lvmlockctl --gl-disable <vgname>'.

Dave
