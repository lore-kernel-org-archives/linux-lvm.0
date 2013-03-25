Date: Mon, 25 Mar 2013 15:45:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20130325194511.GA27105@redhat.com>
References: <1374A7DD-6B0E-4F25-8D2D-4D0AEA62C82B@active.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1374A7DD-6B0E-4F25-8D2D-4D0AEA62C82B@active.ee>
Subject: Re: [linux-lvm] LVM thin LV filesystem superblock corruption
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
To: Andres Toomsalu <andres@active.ee>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 22 2013 at 11:12am -0400,
Andres Toomsalu <andres@active.ee> wrote:

> Update! Issue seems to be active only with PERC H800 and MD1200 disks - local raid with PERC H700 and lvm thin lv-s work fine without corrupting on reboot.
> 
> 
> We stumbled on strange lvm thinly provisioned LV filesystem corruption case - here are steps that reproduce the issue:
> 
> lvcreate --thinpool pool -L 8T --poolmetadatasize 16G VolGroupL1
> lvcreate -T VolGroupL1/pool -V 2T --name thin_storage
> mkfs.ext4 /dev/VolGroupL1/thin_storage
> mount /dev/VolGroupL1/thin_storage /storage/
> reboot

Couple things:
1) mkfs.ext4 does buffered IO so there is no gaurantee the superblock or
   any other block group destriptors, have actually been committed to
   non-volatile storage when mkfs.ext4 completes
2) reboot sequence is very distro specific; /storage may not have been
   unmounted before reboot -- if it was unmounted then all data
   should've been pushed out to non-volatile storage

So if you add this to command before "reboot" do you no longer have
missing data after the system reboots?:

echo 3 > /proc/sys/vm/drop_caches

> # NB! without host reboot unmount/mount succeeds!
> 
> [root@node3 ~]# mount /dev/VolGroupL1/thin_storage /storage/
> mount: you must specify the filesystem type
> 
> Tried also to set poolmetadatasize to 2G, 14G, 15G and pool size to 1T, 2T - no change - corruption still happens.
> 
> Hardware setup: 
> * Underlaying block device (sdb) is hosted by PERC H800 controller and disks are coming from SAS disk expansion box (DELL MD1200).
...
> What could be the issue here?

I assume by "reboot" you mean the host (with the PERC card) never loses
power?

What layers of hardware writeback caching are in place in the
H800+MD1200 case vs H700+localraid?
