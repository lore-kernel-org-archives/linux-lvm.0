From: "DJ TweeQ" <djtweeq@hotmail.com>
Mime-Version: 1.0
Message-ID: <F42fiyTqv4jvQUMRlap0003beef@hotmail.com>
Subject: [linux-lvm] Sharing Logical Volumes via NFS on Redhat 8.0
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
Date: Mon Feb 17 21:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

(repost):

Regarding Sharing LVM LV's via NFS on Redhat 8.0...ie. mounting an LV from 
another machine while already having a LV on the same machine. Is it ok or 
not ok? I was talking to a buddy and he doesn't think it's a problem or an 
issue but...

the current documentation on Sistina's site states that sharing LV's is 
dangerous unless it's a SCSI or Fibre Storage Device?...and not only that 
...adminisitration can only be done on one node? (is it really possible to 
create/resize lv's from one node/machine to another (that has an LV or was 
it meant to mean that it's only possible on cluster aware network storage 
devices)??? ....

http://tldp.org/HOWTO/LVM-HOWTO/x1232.html
under "Dangerous Operations - Sharing Logical LVM Volumes"

ie.

>If you need to do any changes to the LVM metadata (regardless of >whether 
>it affects volumes mounted on other nodes) you must go through >the 
>following sequence. In the steps below ``admin node'' is any >arbirarily 
>chosen node in the cluster. Admin node                   >Other nodes
>----------                   -----------
>                             Close all Logical volumes (umount)
>                             vgchange -an
><make changes, eg lvextend>
>                             vgscan
>                             vgchange -ay

I'm thinking that it might not be a good idea to try to do maintenance on a 
LV that is mounted on another system...but i think it makes a whole heck of 
alot of sense to create/resize/mount an LV on a system before trying to 
mount it via an NFS share. :)

Any comments? I personally don't think it would be an issue either (to mount 
an LV on another box/system via an NFS mount) but i'd rather not take the 
chance of messing up any of the data on those LV's cuz their stuffed :)

Oh one other thing...if it has been proven that a Redhat 8.0 2.4-24?.x 
kernel can be patched to LVM 1.0.6+ ....will the data on those LV's be 
affected in any way or will it all be ok? :)







_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE*  
http://join.msn.com/?page=features/virus
