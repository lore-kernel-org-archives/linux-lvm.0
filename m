Message-ID: <521C814E.1050908@redhat.com>
Date: Tue, 27 Aug 2013 12:37:02 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <trinity-3825ffd4-bc3f-4b3d-b3b8-b0feb9436f1f-1377430137079@3capp-webde-bs10>
In-Reply-To: <trinity-3825ffd4-bc3f-4b3d-b3b8-b0feb9436f1f-1377430137079@3capp-webde-bs10>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Duplicate physical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: oliver_block2@web.de

Dne 25.8.2013 13:28, oliver_block2@web.de napsal(a):
> Dear LVM list,
> this is my first posting to this list and actually I am making my first
> experiences with LVM. The following is my situation:
> I had a RAID 1 consisting of /dev/sdb1 and /dev/sdc1 making /dev/md2 and used
> this device as a physical volume for LVM. I used this inside the volume group
> vg_data.
> Now I decided to convert this RAID 1 into a RAID 5 by "adding a third and
> identical partition /dev/sdd1". It follows how I am going to realize this:
> First I removed /dev/sdc1 from /dev/md2 (the old RAID 1) leaving it in
> degraded state.
> Then I created a new RAID 5, having device name /dev/md0 with a total of three
> disks, but running only with two disks for the moment, namely /dev/sdc1 and
> /dev/sdd1.
> The plan is now to initialize /dev/md0 as a physical volume and add a volume
> group and logical volume on top of this. Then I would copy the data from the
> old RAID 1 to the new RAID 5. Finally I will remove the old RAID 1 and add the
> remaining device /dev/sdb1 to the new RAID 5. Then the conversion would be
> complete.
> Now the actual problem related to LVM:

You need to make sure you have proper filter rules set in lvm.conf.

> While trying to initialize the new /dev/md0 as a pysical volume for LVM, I get
> the following message:
> # pvcreate /dev/md0
>    Incorrect metadata area header checksum on /dev/md0 at offset 3000456183808
>    Found duplicate PV LNqPKpqdtqcLkmiqHYOeeVddNYx7FDOq: using /dev/md2 not
> /dev/md0
>    Can't initialize physical volume "/dev/md0" of volume group "vg_data"
> without -ff


When you are destroying previous raids - you should properly wipe disk 
headers. Otherwise you need to use  force options to overwrite existing one, 
with the risk you could do more damage if you are not 100% what you are doing.

Zdenek
