References: <CAD=NvSb8TsprJPuOTwCPALPiv9+LRCECy0WUNPx-iobCK5EJUg@mail.gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <56A25434.6030002@redhat.com>
Date: Fri, 22 Jan 2016 17:09:24 +0100
MIME-Version: 1.0
In-Reply-To: <CAD=NvSb8TsprJPuOTwCPALPiv9+LRCECy0WUNPx-iobCK5EJUg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Accessing LVM cache origin
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
To: linux-lvm@redhat.com, daniel.leong@gmail.com

On 01/20/2016 12:23 AM, Daniel Leong wrote:
> Hello,
>
> I'm struggling to find information about lvmcache recovery after the cache
> fails. Is it possible to access an LVcache origin if the PV for the cache
> has failed?
>
> If I try partial mode :
>    lvchange -a y -P fedora/home
>
> Then it just hangs.
>
> If I try the home_corig directly :
>    lvchange -a y -P fedora/home_corig
>
>    "Unable to change internal LV home_corig directly"
>
> I can see the LVs with :
>     lvs -a -o +devices fedora
>
> The home_corig is still on /dev/sdb3 so I can probably find the blocks if
> needed ... but that seems like hard work!
>
> At the moment [cache_cdata] and [cache_cmeta] are on "unknown device"
> because it failed. Can I just extend to a new PV for the cache?

Hi, this is a known limitation. There is a Bug 1131777 - "LVM cache: If 
writethrough, allow abandoning cachepool if it has failed".

https://bugzilla.redhat.com/show_bug.cgi?id=1131777

In any case if you were using cache in writeback mode be ready for havoc 
in the filesystem as it is likely many "hot" filesystem metadata blocks 
were kept in cache and not written to HDD.

THIS IS A DANGEROUS OPERATION!
Any readers here, check the BZ above first if LVM already has a better 
solution.

Proceed with extreme care! And better double check steps on #lvm IRC 
channel on freenode.

First rule is:
*Backup first.*

Second rule is:
Do not try to use --force/-f with lvm commands - many of them cause 
irrevocable damage.
You want to check the man pages, and better ask before using the force.

Now the steps:

At the moment the only way is to edit metadata manually by using 
vgcfgbackup (or file from /etc/lvm/backup/) and vgcfgrestore.

Ideally you will work on a copy of the disk. (You do have the backup, 
right?)

If you have a system to test the steps "dry" run it there!
Simulate device failure using:

   echo 1 > /sys/block/DEV/device/delete

Run the below steps on the test system and check the results.
If in doubt ask. If everything went well, and you still have the backup, 
then you are safe to proceed.

Run

     vgcfgbackup -f FILE VG

If the LV is active, I had to deactivate LVs before proceeding. I used

     vgchange -an VG

This hangs as it is trying to check the cache-pool. ^C will stop the check.

Then I had to run:

     vgreduce --removemissing VG

Now editing the file FILE:

1. Replace segments in home by those from home_corig. If necessary 
adjust segment_count.

2. Remove home_corig, CACHE_cdata, CACHE_cmeta and CACHE.

2.1 You may want to remove lvol0_pmspare if there are no thin-pools and 
no more cache pools in the system.

3. Remove the missing PV - the one where device is unknown device:

                         device = "unknown device"       # Hint only

                         status = ["ALLOCATABLE"]
                         flags = ["MISSING"]

Then run:

     vgcfgrestore -f FILE VG

After the backup try proceeding with fsck.

If anything went wrong, return to backup.

-- Martian

>
> Thanks for any tips, and apologies if I'm being stupid.
>
> Dan
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
