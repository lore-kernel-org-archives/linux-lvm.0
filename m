From: Chris Harwell <charwell@digitalpulp.com>
Subject: Re: [linux-lvm] Removing PV with disk errors from VG
In-Reply-To: <Pine.LNX.4.44.0203131217580.31623-100000@clapper.digitalpulp.com>
Message-Id: <Pine.LNX.4.44.0203131434210.31623-100000@clapper.digitalpulp.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Mar 13 13:37:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

well, simply applying the cast patch to the usertools did not work. i 
don't need to repatch the kernel, do i? 

i'm left with the same problem. when attempting a pvmove:

a --test works, but the real thing fails:

[root@totally80s /root]# pvmove --verbose /dev/hda14 
pvmove -- checking name of source physical volume "/dev/hda14"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/hda14"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "vg0" from lvmtab
pvmove -- checking volume group consistency of "vg0"
pvmove -- searching for source physical volume "/dev/hda14" in volume 
group "vg0"
pvmove -- building list of possible destination physical volumes
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "vg0"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/hda14"
pvmove -- checking for enough free physical extents in "vg0"
pvmove -- /dev/hda14 [PE 0 [lvol1 [LE 310]] -> /dev/hdd9 [PE 16182] 
[1/1202]
pvmove -- ERROR "Invalid argument" remapping
pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents

unless i need to rescan something?

i'd like to try the 1.0.4.-pre1.tar.bz2 version mentioned in this email
1652 Mar  8 Denie Andriessen             (4572) Re: [linux-lvm] PV-Move fails, now at 127 Pe's...

but, i can't find it....

could some one kindly point me in that direction?

thanks :>

-- 
chris
charwell@digitalpulp.com


On Wed, 13 Mar 2002, Chris Harwell wrote:
> 
> i have not, but i will try it. 
> 
> i should try the patch mentioned here, right?
>  
> 1478 Feb 20 Heinz J . Mauelshagen        (4355) [linux-lvm] pvmove bug with large PE numbers
> 
> thanks,
> 
> 
