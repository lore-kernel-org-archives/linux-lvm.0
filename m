References: <CAHEKYV68yfVGbTCeC4=4J6mde=WBkgwtuQX+GY8otPm6fW9Sfw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4715c78e-b9da-d057-115c-6de0c1d2f1e8@redhat.com>
Date: Fri, 22 Sep 2017 10:11:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAHEKYV68yfVGbTCeC4=4J6mde=WBkgwtuQX+GY8otPm6fW9Sfw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Restoring snapshot gone bad
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Mauricio Tavares <raubvogel@gmail.com>

Dne 22.9.2017 v 08:03 Mauricio Tavares napsal(a):
> I have a lv, vmzone/desktop that I use as drive for a kvm guest;
> nothing special here. I wanted to restore its snapshot so like I have
> done many times before I shut guest down and then
> 
> lvconvert --merge vmzone/desktop_snap_20170921
>    Logical volume vmzone/desktop is used by another device.
>    Can't merge over open origin volume.
>    Merging of snapshot vmzone/desktop_snap_20170921 will occur on next activation
>   of vmzone/desktop.
> 
> What is it really trying to tell me? How to find out which other
> device is using it?


Hi


When you want merge a snapshot - origin must be an unused volume (so not 
opened/mounted anywhere).

Merging process 'copies/restores' modified blocks in your origin volume - thus 
i.e. filesystem would not be able to handle 'changes' happening underneath its 
hands..

So if there are not condition which let you start snapshot merge, the 
operation is delayed - likely your 'next' activation of your origin volume in 
which case it's pretty sure there is no user  so the merge can be started
(or you can 'lvchange --refresh')

> 
> lvdisplay tells me that
> 
> lvdisplay /dev/vmzone/desktop
>    --- Logical volume ---
>    LV Path                /dev/vmzone/desktop
>    LV Name                desktop
>    VG Name                vmzone
>    LV UUID                3hcB1L-rIRf-PHZQ-I55F-ZXhT-SnSZ-vThO8U
>    LV Write Access        read/write
>    LV Creation host, time duocismj01e9se, 2017-06-29 15:07:12 -0400
>    LV snapshot status     source of
>                           desktop_snap_20170921 [active]
>    LV Status              available
>    # open                 2

^^^^
here you can see 'non-zero' open count

>    LV Size                100.00 GiB
>    Current LE             25600
>    Segments               1
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           252:6
> 
> When I do plain old lvs (or lvs -a -o +devices), the attribute entry
> for the desktop looks like
> 
>    desktop    vmzone    Owi-aos--- 100.00g
> 
> According to https://linux.die.net/man/8/lvs the "O" in Owi-aos--- means it
> is merging a snapshot. But, what is its status? Based on how long it
> has been that way, I think it is hung but I do not know what is
> causing this hangup.

Nothing is hanging - it's just postponed for next opportunity...
Progress of merging can be checked easily with command  'lvs'.
Note: while the merging is in progress - you can already use 'merged origin'
so i.e.  if you merge snapshot of you 'root'  volume - on reboot and next 
activation you can already use 'merged' result while actually copying is 
processed in the background and you can check its progress percentage.

Regards

Zdenek
