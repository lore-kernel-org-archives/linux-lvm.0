Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0JHb2O09668
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 12:37:02 -0500
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.250])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0JHat35010820
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 12:36:55 -0500
Received: by mproxy.gmail.com with SMTP id q44so618465cwc
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 09:36:55 -0800 (PST)
Message-ID: <dff37527050119093675705723@mail.gmail.com>
Date: Wed, 19 Jan 2005 12:36:54 -0500
From: Kristina Clair <kclair@gmail.com>
Subject: Re: [linux-lvm] lvcreate snapshot problems
In-Reply-To: <20050118200128.GS26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <dff37527050118093648e504e@mail.gmail.com>
	<20050118194449.GQ26670@agk.surrey.redhat.com>
	<dff3752705011811541b040c4e@mail.gmail.com>
	<20050118200128.GS26670@agk.surrey.redhat.com>
Reply-To: Kristina Clair <kclair@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 18 Jan 2005 20:01:28 +0000, Alasdair G Kergon <agk@redhat.com> wrote:
> On Tue, Jan 18, 2005 at 02:54:41PM -0500, Kristina Clair wrote:
> > Now, if I run lvcreate shortly after the machine is booted, it runs
> > successfully.  However, if I try to run the same command the next day,
> > after it's been online and the webservers have had the filesystem
> > mounted, it hangs when trying to suspend the volume.
>  
> How does it hang?  Do you get kernel error messages?
> Try watching kernel memory usage just before the failures:
> It could be one of the out-of-memory problems with snapshots
> that we're working on fixing.

The total memory usage goes up slightly when lvcreate starts running,
and then it gradually goes down as the process is hanging.  But the
difference is only about 10M.   Is there something else I can look at
to determine if this is a kernel problem or not?  We are using the
2.6.10 kernel, with DM_SNAPSHOT enabled as a module.

I think when I sent the output of lvcreate last time, it wasn't the
full output.  Here is the full output:

% lvcreate -vvv -L100G -s -n 20050119 /dev/nfsvg/lvol0
        Processing: lvcreate -vvv -L100G -s -n 20050119 /dev/nfsvg/lvol0
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Setting chunksize to 16 sectors.
      Getting target version for snapshot
        dm version    
        dm versions    
      Getting target version for snapshot-origin
        dm versions    
      Locking /var/lock/lvm/V_nfsvg WB
    Finding volume group "nfsvg"
        Opened /dev/sda1 RW
        /dev/sda1: block size is 1024 bytes
      /dev/sda1: No label detected
        Opened /dev/sda2 RW
        /dev/sda2: block size is 4096 bytes
      /dev/sda2: No label detected
        Opened /dev/sda3 RW
        /dev/sda3: block size is 4096 bytes
      /dev/sda3: No label detected
        Opened /dev/sda4 RW
        /dev/sda4: block size is 4096 bytes
      /dev/sda4: No label detected
        Opened /dev/sdb RW
        /dev/sdb: block size is 4096 bytes
      /dev/sdb: lvm2 label detected
        Opened /dev/sdc RW
        /dev/sdc: block size is 4096 bytes
      /dev/sdc: lvm2 label detected
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (123) from /dev/sdb at 110080 size 2439
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (123) from /dev/sdc at 110080 size 2439
    Creating logical volume 20050119
        Allowing allocation on /dev/sdb start PE 182272 length 25600
        Allowing allocation on /dev/sdb start PE 233472 length 124139
        Allowing allocation on /dev/sdc start PE 131072 length 226539
    Archiving volume group "nfsvg" metadata.
        Writing nfsvg metadata to /dev/sdb at 112640 len 2680
        Writing nfsvg metadata to /dev/sdc at 112640 len 2680
    Creating volume group backup "/etc/lvm/backup/nfsvg"
        Writing nfsvg metadata to /etc/lvm/backup
.lvm_nfs.phx.serve.com_13289_966521642
        Committing nfsvg metadata (124)
        Renaming /etc/lvm/backup/nfsvg.tmp to /etc/lvm/backup/nfsvg
        Committing nfsvg metadata (124) to /dev/sdb header at 2048
        Committing nfsvg metadata (124) to /dev/sdc header at 2048
        Locking LV
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX (R)
      Finding volume group for uuid
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdb at 112640 size 2680
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdc at 112640 size 2680
    Found volume group "nfsvg"
      Setting activation/missing_stripe_filler to /dev/ioerror
        Getting device info for nfsvg-20050119
        dm info 
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
        dm info nfsvg-20050119   
      Locking memory
        memlock_count inc to 1
        dm names    
        Found existing layer 'nfsvg-lvol0-real'
        Getting device info for nfsvg-lvol0-real
        dm info nfsvg-lvol0-real   
        Found existing layer 'nfsvg-20050111.weekly-cow'
        Getting device info for nfsvg-20050111.weekly-cow
        dm info nfsvg-20050111.weekly-cow   
        Found existing layer 'nfsvg-20050111.weekly'
        Getting device info for nfsvg-20050111.weekly
        dm info nfsvg-20050111.weekly   
        Found existing layer 'nfsvg-20050113-cow'
        Getting device info for nfsvg-20050113-cow
        dm info nfsvg-20050113-cow   
        Found existing layer 'nfsvg-lvol0'
        Getting device info for nfsvg-lvol0
        dm info nfsvg-lvol0   
        Found existing layer 'nfsvg-20050114'
        Getting device info for nfsvg-20050114
        dm info nfsvg-20050114   
        Found existing layer 'nfsvg-20050113'
        Getting device info for nfsvg-20050113
        dm info nfsvg-20050113   
        Found existing layer 'nfsvg-20050114-cow'
        Getting device info for nfsvg-20050114-cow
        dm info nfsvg-20050114-cow   
        Found active lv lvol0
        Found active lv 20050111.weekly
        Found active lv 20050113
        Found active lv 20050114
        Getting device info for nfsvg-20050119
        dm info 
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
        dm info nfsvg-20050119   
    Loading nfsvg-20050119
        Adding target: 0 209715200 linear /dev/sdb 1493172608
        dm create nfsvg-20050119
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
        dm reload nfsvg-20050119   
        dm resume nfsvg-20050119   
      Activated nfsvg-20050119
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX 253:0
08
      Unlocking memory
        memlock_count dec to 0
      Linking /dev/nfsvg/20050119 -> /dev/mapper/nfsvg-20050119
    Zeroing start of logical volume "20050119"
        /dev/nfsvg/20050119: Added to device cache
        Opened /dev/nfsvg/20050119 RW
        Wiping /dev/nfsvg/20050119 at sector 0 length 8 sectors
        /dev/nfsvg/20050119: block size is 4096 bytes
        Closed /dev/nfsvg/20050119
        Locking LV
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX (NL)
      Finding volume group for uuid
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdb at 112640 size 2680
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdc at 112640 size 2680
    Found volume group "nfsvg"
        Getting device info for nfsvg-20050119
        dm info 
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
      Locking memory
        memlock_count inc to 1
        dm names    
        Found existing layer 'nfsvg-lvol0-real'
        Getting device info for nfsvg-lvol0-real
        dm info nfsvg-lvol0-real   
        Found existing layer 'nfsvg-20050111.weekly-cow'
        Getting device info for nfsvg-20050111.weekly-cow
        dm info nfsvg-20050111.weekly-cow   
        Found existing layer 'nfsvg-20050119'
        Getting device info for nfsvg-20050119
        dm info nfsvg-20050119   
        Found existing layer 'nfsvg-20050111.weekly'
        Getting device info for nfsvg-20050111.weekly
        dm info nfsvg-20050111.weekly   
        Found existing layer 'nfsvg-20050113-cow'
        Getting device info for nfsvg-20050113-cow
        dm info nfsvg-20050113-cow   
        Found existing layer 'nfsvg-lvol0'
        Getting device info for nfsvg-lvol0
        dm info nfsvg-lvol0   
        Found existing layer 'nfsvg-20050114'
        Getting device info for nfsvg-20050114
        dm info nfsvg-20050114   
        Found existing layer 'nfsvg-20050113'
        Getting device info for nfsvg-20050113
        dm info nfsvg-20050113   
        Found existing layer 'nfsvg-20050114-cow'
        Getting device info for nfsvg-20050114-cow
        dm info nfsvg-20050114-cow   
        Found active lv lvol0
        Found active lv 20050111.weekly
        Found active lv 20050113
        Found active lv 20050114
        Found active lv 20050119
    Removing nfsvg-20050119
      Unlocking memory
        memlock_count dec to 0
      Removing link /dev/nfsvg/20050119
        Unlocking LV
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
      Finding volume group for uuid
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdb at 112640 size 2680
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdc at 112640 size 2680
    Found volume group "nfsvg"
        Getting device info for nfsvg-20050119
        dm info 
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
        dm info nfsvg-20050119   
        Locking LV
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBz048ZiCMdqNZhJV1ImaBs77WsnFRlsLD (W)
      Finding volume group for uuid
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBz048ZiCMdqNZhJV1ImaBs77WsnFRlsLD
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdb at 112640 size 2680
      /dev/sdb: lvm2 label detected
      /dev/sdc: lvm2 label detected
        Read nfsvg metadata (124) from /dev/sdc at 112640 size 2680
    Found volume group "nfsvg"
        Getting device info for nfsvg-lvol0
        dm info 
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBz048ZiCMdqNZhJV1ImaBs77WsnFRlsLD
      Locking memory
        memlock_count inc to 1
        dm names    
        Found existing layer 'nfsvg-lvol0-real'
        Getting device info for nfsvg-lvol0-real
        dm info nfsvg-lvol0-real   
        Found existing layer 'nfsvg-20050111.weekly-cow'
        Getting device info for nfsvg-20050111.weekly-cow
        dm info nfsvg-20050111.weekly-cow   
        Found existing layer 'nfsvg-20050111.weekly'
        Getting device info for nfsvg-20050111.weekly
        dm info nfsvg-20050111.weekly   
        Found existing layer 'nfsvg-20050113-cow'
        Getting device info for nfsvg-20050113-cow
        dm info nfsvg-20050113-cow   
        Found existing layer 'nfsvg-lvol0'
        Getting device info for nfsvg-lvol0
        dm info nfsvg-lvol0   
        Found existing layer 'nfsvg-20050114'
        Getting device info for nfsvg-20050114
        dm info nfsvg-20050114   
        Found existing layer 'nfsvg-20050113'
        Getting device info for nfsvg-20050113
        dm info nfsvg-20050113   
        Found existing layer 'nfsvg-20050114-cow'
        Getting device info for nfsvg-20050114-cow
        dm info nfsvg-20050114-cow   
        Found active lv lvol0
        Found active lv 20050111.weekly
        Found active lv 20050113
        Found active lv 20050114
        Getting device info for nfsvg-20050119
        dm info 
fo4GChqZZR0sMnwSN0BD0jqqQtROe4MBCmnoDgnlzi1fQbzciXC2S2GT9byJmFqX
        dm info nfsvg-20050119   
      Suspending nfsvg-lvol0
        dm suspend nfsvg-lvol0
