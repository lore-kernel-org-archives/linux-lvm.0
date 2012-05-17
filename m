Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4HNDvI8026878
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 19:13:57 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4HNDuG1017727
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 19:13:56 -0400
Date: Thu, 17 May 2012 18:13:50 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120517181350.2922a70b@bettercgi.com>
In-Reply-To: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce nightmare
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
To: linux-lvm@redhat.com, ganaiwali@gmail.com

Stop. Don't do anything else until you are sure of what to do next. 
You will not lose data by studying. You can lose data by trying to fix
it.

> resize2fs /dev/vg0/data 100G
> lvreduce -L -100G -n /dev/vg0/data*

A 100 GB filesystem needs a block device of around 110 GB.  So this
cut off the end of your filesystem. (The device needs to hold the
journal as well as the FS, for example.)

> * I would greatly appreciate any help/insights .. i notice lvm has
> created a backup file in /etc/lvm/archive as
> vg0_00008-1147866134.vg , does restoring from that file actually
> work ? will it get the drive into original state ?

It will work to put the LVM configuration back. It won't fix this:

> *e2fsck -f /dev/vg0/data -n*
> *
> *
> after the fsck completed it would prompt to fix superblock/inodes
> which I replied with 'yes'

Not good. That "fixed" perfectly good superblocks, changing them to be
no longer correct. See the first three sentences. Do not proceed
to try any other fixes you don't fully understand. Unless of course
you've tested your backup from last night and know it's fine. Don't
forget to stop tonight's backup job, BTW.

Hopefully you can restore the super blocks after you expand the LV
back. I'm not an expert on that step, so I'll simply suggest you refer
to proper resources and make sure you understand it before acting (or
make an image of the device with dd first so you can recover if you do
someting that causes further damage).

> and how can i
> actually free some space from the volume group if i want to ?*

resize2fs to smaller size than you wish to end up with. 
see resize2fs -M 
Next, resize the LV, then use resize2fs again to expand the FS to fill
the LV.  Alternatively, you can calculate / estimate the space a
filesystem will need, which will depend on which filesystem, which
features are enabled, etc. 
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 16 May 2012 21:18:46 +0530
tariq wali <ganaiwali@gmail.com> wrote:

> Hi,
> 
>  I tried to reduce the VG and this is what it looked like before I
> tried to reduce it
> 
> Filesystem                       Size  Used Avail   Use% Mounted on
> /dev/mapper/vg0-data         2.2T  1.7T  433G  80%  /data
> 
> Out of the available *433G* I wanted to reduce *100G* in vg0 so that I
> could use it for a new partition and this is what I did ..
> 
> * e2fsck -f /dev/vg0/data
> resize2fs /dev/vg0/data 100G
> lvreduce -L -100G -n /dev/vg0/data*
> 
> lvs
>   LV   VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
>   data vg0  -wi-ao 2.08T
> 
> after the lvreduce it did what I intended to as you can see in
> 
> vgs
>   VG   #PV #LV #SN Attr   VSize VFree
>   vg0    1   1   0 wz--n- 2.18T *100.00G*   ( it did allocate the
> 100.00G as free space )
> 
> after I mounted /data back , I could even touch a file , however when
> we start the app (mysql) and when it tries to write into the existing
> data in /data , the drive goes into *read only mode repeatedly* ..
> 
> in order to fix it i unmounted /data and ran
> 
> *e2fsck -f /dev/vg0/data -n*
> *
> *
> after the fsck completed it would prompt to fix superblock/inodes
> which I replied with 'yes' however the problem still persists that if
> i mount /data it goes into read-only mode .
> 
> dmsetup table
> vg0-data: 0 4477255680 linear 104:17 384
> 
> Red Hat Enterprise Linux Server release 5.7
> 2.6.18-274.17.1.el5 #1 SMP  x86_64
> lvm2-2.02.84-6.el5_7.1
> 
> I have reduced lvm's with those  sequence of commands in the past but
> i just dont understand why it seems to have failed this time although
> i did get 100G free space in vg0 but the partition /data seems
> useless ..
> 
> * I would greatly appreciate any help/insights .. i notice lvm has
> created a backup file in /etc/lvm/archive as
> vg0_00008-1147866134.vg , does restoring from that file actually
> work ? will it get the drive into original state ? and how can i
> actually free some space from the volume group if i want to ?*
> 
> 
> ########
> some errors spewed in dmesg
> 
> attempt to access beyond end of device
> dm-0: rw=0, want=4654102632, limit=4477255680
> EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block
> bitmap - block_group = 17145, block_bitmap = 561807360
> Aborting journal on device dm-0.
> attempt to access beyond end of device
> dm-0: rw=0, want=4565762056, limit=4477255680
> EXT3-fs error (device dm-0): read_block_bitmap: <2>ext3_abort called.
> EXT3-fs error (device dm-0): ext3_journal_start_sb: Detected aborted
> journal
> 
> Cannot read block bitmap - block_group = 17417, block_bitmap =
> 570720256 EXT3-fs error (device dm-0): read_block_bitmap: Cannot read
> block bitmap - block_group = 17417, block_bitmap = 570720256
> dm-0: rw=0, want=4683202568, limit=4477255680
> EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block
> bitmap - block_group = 17865, block_bitmap = 585400320
> 
> EXT3-fs error (device dm-0) in ext3_free_blocks_sb: Journal has
> aborted EXT3-fs error (device dm-0) in ext3_orphan_del: Journal has
> aborted __journal_remove_journal_head: freeing b_committed_data
> 
> 
> ext3_abort called.
> EXT3-fs error (device dm-0): ext3_put_super: Couldn't clean up the
> journal kjournald starting.  Commit interval 5 seconds
> EXT3-fs warning (device dm-0): ext3_clear_journal_err: Filesystem
> error recorded from previous mount: IO failure
> EXT3-fs warning (device dm-0): ext3_clear_journal_err: Marking fs in
> need of filesystem check.
> EXT3-fs warning: mounting fs with errors, running e2fsck is
> recommended attempt to access beyond end of device
> dm-0: rw=0, want=4654102632, limit=4477255680
> 
> EXT3-fs error (device dm-0): read_block_bitmap: Cannot read block
> bitmap - block_group = 17145, block_bitmap = 561807360
> Aborting journal on device dm-0.
> 
> 
> 
> 
> 
> 
