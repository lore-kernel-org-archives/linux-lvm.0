Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFE605D963
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 14:33:11 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26]) by mx1.redhat.com (Postfix) with ESMTP id EC2EB356DC
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 14:33:08 +0000 (UTC)
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Received: from osl1cloudm2.nextgentel.net ([80.202.10.59])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OY600L8ZGDPVC80@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Sat, 21 Oct 2017 16:33:08 +0200 (CEST)
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
	<23018.20452.919839.109594@quad.stoffel.home>
From: Oleg Cherkasov <o1e9@member.fsf.org>
Message-id: <88f3c8a9-8c55-a74f-c9cb-4b8aa18a28fc@member.fsf.org>
Date: Sat, 21 Oct 2017 16:33:07 +0200
In-reply-to: <23018.20452.919839.109594@quad.stoffel.home>
Content-language: en-US
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>

On 20. okt. 2017 21:35, John Stoffel wrote:
>>>>>> "Oleg" == Oleg Cherkasov <o1e9@member.fsf.org> writes:
> 
> Oleg> On 19. okt. 2017 21:09, John Stoffel wrote:
>>>
> 
> Oleg> RAM 12Gb, swap around 12Gb as well.  /dev/sda is a hardware RAID1, the
> Oleg> rest are RAID5.
> 
> Interesting, it's all hardware RAID devices from what I can see.

It is exactly what I wrote initially in my first message!

> 
> Can you should the *exact* commands you used to make the cache?  Are
> you using lvcache, or bcache?  they're two totally different beasts.
> I looked into bcache in the past, but since you can't remove it from
> an LV, I decided not to use it.  I use lvcache like this:

I have used lvcache of course and here are commands from bash history:

lvcreate -L 1G -n primary_backup_lv_cache_meta primary_backup_vg /dev/sda5

### Allocate ~247G ib /dev/sda5 what has left of VG
lvcreate -l 100%FREE -n primary_backup_lv_cache primary_backup_vg /dev/sda5

lvconvert --type cache-pool --cachemode writethrough --poolmetadata 
primary_backup_vg/primary_backup_lv_cache_meta 
primary_backup_vg/primary_backup_lv_cache

lvconvert --type cache --cachepool 
primary_backup_vg/primary_backup_lv_cache 
primary_backup_vg/primary_backup_lv

### lvconvert failed because required some extra extends in VG so I had 
to reduce cache LV and try again:

lvreduce -L 200M primary_backup_vg/primary_backup_lv_cache

### so this time it worked ok:

lvconvert --type cache-pool --cachemode writethrough --poolmetadata 
primary_backup_vg/primary_backup_lv_cache_meta 
primary_backup_vg/primary_backup_lv_cache
lvconvert --type cache --cachepool 
primary_backup_vg/primary_backup_lv_cache 
primary_backup_vg/primary_backup_lv

### The exact output of `lvs -a -o +devices` is gone of course because I 
had uncached of course however it looks as in docs so did not bring any 
suspicions to me.

> How was the performance before your caching tests?  Are you looking
> for better compression of your backups?  I've used bacula (which
> Bareos is based on) for years, but recently gave up because the
> restores sucked to do.  Sorry for the side note.  :-)

The performance was good, no complains to aging hardware however having 
spare SSD disk I wanted to test if it would improve anything and did not 
expect that trivial DD puts whole system on its knees.

> Any messages from the console?

Unfortunately no in logs.  As I wrote before I saw a lot of OOM messages 
on a killing spree.

> Oleg> User stat:
> Oleg> 02:00:01 PM     CPU     %user     %nice   %system   %iowait    %steal
> Oleg>   %idle
> Oleg> 02:10:01 PM     all      0.22      0.00      0.08      0.05      0.00
> Oleg>   99.64
> Oleg> 02:20:35 PM     all      0.21      0.00      5.23     20.58      0.00
> Oleg>   73.98
> Oleg> 02:30:51 PM     all      0.23      0.00      0.43     31.06      0.00
> Oleg>   68.27
> Oleg> 02:40:02 PM     all      0.06      0.00      0.15     18.55      0.00
> Oleg>   81.24
> Oleg> Average:        all      0.19      0.00      1.54     17.67      0.00
> Oleg>   80.61
> 
> That looks ok to me... nothing obvious there at all.

Same is here ...

> Are you writing to a spool disk, before you then write the data into
> bacula's backup system?

Well, Bareos SD was down that time for testing, so it was:

dd if=sime_250G_file of=/dev/null status=process

Basically the first command after allocating LV cache.

> 
> I think you're running into a RedHat bug at this point.  I'd probably
> move to Debian and run my own kernel with the latest patches for MD, etc.

Would have to stay with CentOS and moving to Debian is not necessarily 
solves the problem.

> 
> You might even be running into problems with your HW RAID controllers
> and how Linux talks to them.
> 
> Any chance you could post more details?

HW RAID controller are PERC H710 and H810.  Posting extremely verbose 
MegaCli output would not help I guess.  Firmware is up to date according 
to BIOS Maintenance monitor.
