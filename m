Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HIGqj15506
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 13:16:52 -0500
Received: from m1.horizonlive.com (slim-eth0.horizonlive.net [208.185.78.2])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HIGp4b023788
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 13:16:51 -0500
Message-ID: <40589612.50907@stevek.com>
Date: Wed, 17 Mar 2004 13:16:50 -0500
From: Steve Kann <stevek@stevek.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] EXT3 snapshot not quiesced by LVM2?
References: <20040315182356.35f5ca40.donald.murray@pason.com>
	<20040317105725.15a71d21.donald.murray@pason.com>
In-Reply-To: <20040317105725.15a71d21.donald.murray@pason.com>
Content-Type: multipart/alternative;
	boundary="------------090302070008080801010403"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------090302070008080801010403
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


I figured someone would chime in here with a better explanation.

The orphaned inodes do not indicate that the filesystem is in an 
inconsistent state.  It is "in use", yes, but not inconsistent.

Unix semantics allow processes to keep open a handle to a file which is 
no longer referenced by any directories.  The file must still exist on 
the filesystem, although there's no way to access it other than the file 
descriptor held by the process.

This is a common practice for scratch files;   open a new file 
(O_CREAT), unlink the file, use the file.

When the last process referencing the file goes away, the kernel 
normally will remove the file from the filesystem.  In this way, a 
process doesn't need to worry about clean-up, and clean-up works 
properly in the case that the process dies unexpectedly.

So, anyway, the issue you're seeing doesn't seem to be an error of any kind.



Donald Murray P.Eng. wrote:

>Does anyone have any theories why our LVM2 snapshots have orphaned inodes?
>
>
>On Mon, 15 Mar 2004 18:23:56 -0700
>"Donald Murray P.Eng." <donald.murray@pason.com> wrote:
>
>  
>
>>Problem:
>>LVM2 snapshots of an EXT3 partition do not appear to be taken
>>from a quiesced lv. In /var/log/messages, we see messages about
>>an orphaned inode.
>>
>>Details:
>>We're using LVM2 on a RedHat 7.2 box with a 2.4.22 kernel from kernel.org.
>>The kernel has been patched with the following patches:
>>    linux-2.4.22-VFS-lock.patch
>>    linux-2.4.22-devmapper-ioctl.patch
>>
>>Once per hour, we use an LVM snapshot to backup a MySQL database. The
>>procedure is:
>>1. mysql server: flush tables with read lock; hold this lock until step 5
>>2. sync
>>3. lvcreate --extents N --snapshot --name dbsnapshotlv /dev/datavg/datalv
>>4. mount -o ro /dev/datavg/dbsnapshotlv /mnt/snapshot
>>5. mysql server: unlock tables
>>6. create backup of /mnt/snapshot
>>7. umount /mnt/snapshot && lvremove /dev/datavg/dbsnapshotlv
>>
>>This appears to be working, but there is a message in /var/log/messages
>>which is a little disturbing. Whenever we create a snapshot and mount
>>the resulting lv, we see the following:
>>
>>Mar 15 05:00:05 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
>>Mar 15 05:00:05 PC kernel: EXT3-fs: write access will be enabled during recovery.
>>Mar 15 05:00:05 PC kernel: kjournald starting.  Commit interval 5 seconds
>>Mar 15 05:00:05 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
>>Mar 15 05:00:05 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
>>Mar 15 05:00:05 PC kernel: EXT3-fs: recovery complete.
>>Mar 15 05:00:05 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
>>...
>>Mar 15 06:00:05 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
>>Mar 15 06:00:05 PC kernel: EXT3-fs: write access will be enabled during recovery.
>>Mar 15 06:00:07 PC kernel: kjournald starting.  Commit interval 5 seconds
>>Mar 15 06:00:07 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
>>Mar 15 06:00:07 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
>>Mar 15 06:00:07 PC kernel: EXT3-fs: recovery complete.
>>Mar 15 06:00:07 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
>>...
>>Mar 16 01:00:06 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
>>Mar 16 01:00:06 PC kernel: EXT3-fs: write access will be enabled during recovery.
>>Mar 16 01:00:08 PC kernel: kjournald starting.  Commit interval 5 seconds
>>Mar 16 01:00:08 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
>>Mar 16 01:00:08 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
>>Mar 16 01:00:08 PC kernel: EXT3-fs: recovery complete.
>>Mar 16 01:00:08 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
>>
>>
>>When we mount the snapshot read-write, we instead see the following:
>>
>>Mar 16 01:09:17 PC kernel: kjournald starting.  Commit interval 5 seconds
>>Mar 16 01:09:17 PC kernel: EXT3 FS 2.4-0.9.19, 19 August 2002 on device-mapper(254,4), internal journal
>>Mar 16 01:09:17 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
>>Mar 16 01:09:17 PC kernel: EXT3-fs: recovery complete.
>>Mar 16 01:09:17 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
>>
>>
>>All we expected to see in /var/log/messages was something more like:
>>
>>Mar 17 01:09:03 PC kernel: kjournald starting.  Commit interval 5 seconds
>>Mar 17 01:09:03 PC kernel: EXT3 FS 2.4-0.9.19, 19 August 2002 on device-mapper(254,4), internal journal
>>Mar 17 01:09:03 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
>>
>>
>>Why would the snapshot volume have an orphaned inode? Doesn't the VFS patch
>>allow us to snapshot EXT3? Do we need to quiesce the origin lv some other
>>way?
>>
>>
>>
>> ------------------------------------------ 
>> Donald Murray, P.Eng.
>> Senior Software Engineer
>> Pason Systems Corp.
>> Direct: (403) 301-3473
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>
>
> ------------------------------------------ 
> Donald Murray, P.Eng.
> Senior Software Engineer
> Pason Systems Corp.
> Direct: (403) 301-3473
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>


--------------090302070008080801010403
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body>
<br>
I figured someone would chime in here with a better explanation.<br>
<br>
The orphaned inodes do not indicate that the filesystem is in an
inconsistent state.&nbsp; It is "in use", yes, but not inconsistent.<br>
<br>
Unix semantics allow processes to keep open a handle to a file which is
no longer referenced by any directories.&nbsp; The file must still exist on
the filesystem, although there's no way to access it other than the
file descriptor held by the process.<br>
<br>
This is a common practice for scratch files;&nbsp;&nbsp; open a new file
(O_CREAT), unlink the file, use the file.<br>
<br>
When the last process referencing the file goes away, the kernel
normally will remove the file from the filesystem.&nbsp; In this way, a
process doesn't need to worry about clean-up, and clean-up works
properly in the case that the process dies unexpectedly.<br>
<br>
So, anyway, the issue you're seeing doesn't seem to be an error of any
kind.<br>
<br>
<br>
<br>
Donald Murray P.Eng. wrote:
<blockquote cite="mid20040317105725.15a71d21.donald.murray@pason.com"
 type="cite">
  <pre wrap="">Does anyone have any theories why our LVM2 snapshots have orphaned inodes?


On Mon, 15 Mar 2004 18:23:56 -0700
"Donald Murray P.Eng." <a class="moz-txt-link-rfc2396E" href="mailto:donald.murray@pason.com">&lt;donald.murray@pason.com&gt;</a> wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">Problem:
LVM2 snapshots of an EXT3 partition do not appear to be taken
from a quiesced lv. In /var/log/messages, we see messages about
an orphaned inode.

Details:
We're using LVM2 on a RedHat 7.2 box with a 2.4.22 kernel from kernel.org.
The kernel has been patched with the following patches:
    linux-2.4.22-VFS-lock.patch
    linux-2.4.22-devmapper-ioctl.patch

Once per hour, we use an LVM snapshot to backup a MySQL database. The
procedure is:
1. mysql server: flush tables with read lock; hold this lock until step 5
2. sync
3. lvcreate --extents N --snapshot --name dbsnapshotlv /dev/datavg/datalv
4. mount -o ro /dev/datavg/dbsnapshotlv /mnt/snapshot
5. mysql server: unlock tables
6. create backup of /mnt/snapshot
7. umount /mnt/snapshot &amp;&amp; lvremove /dev/datavg/dbsnapshotlv

This appears to be working, but there is a message in /var/log/messages
which is a little disturbing. Whenever we create a snapshot and mount
the resulting lv, we see the following:

Mar 15 05:00:05 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
Mar 15 05:00:05 PC kernel: EXT3-fs: write access will be enabled during recovery.
Mar 15 05:00:05 PC kernel: kjournald starting.  Commit interval 5 seconds
Mar 15 05:00:05 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
Mar 15 05:00:05 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
Mar 15 05:00:05 PC kernel: EXT3-fs: recovery complete.
Mar 15 05:00:05 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
...
Mar 15 06:00:05 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
Mar 15 06:00:05 PC kernel: EXT3-fs: write access will be enabled during recovery.
Mar 15 06:00:07 PC kernel: kjournald starting.  Commit interval 5 seconds
Mar 15 06:00:07 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
Mar 15 06:00:07 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
Mar 15 06:00:07 PC kernel: EXT3-fs: recovery complete.
Mar 15 06:00:07 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
...
Mar 16 01:00:06 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
Mar 16 01:00:06 PC kernel: EXT3-fs: write access will be enabled during recovery.
Mar 16 01:00:08 PC kernel: kjournald starting.  Commit interval 5 seconds
Mar 16 01:00:08 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
Mar 16 01:00:08 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
Mar 16 01:00:08 PC kernel: EXT3-fs: recovery complete.
Mar 16 01:00:08 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.


When we mount the snapshot read-write, we instead see the following:

Mar 16 01:09:17 PC kernel: kjournald starting.  Commit interval 5 seconds
Mar 16 01:09:17 PC kernel: EXT3 FS 2.4-0.9.19, 19 August 2002 on device-mapper(254,4), internal journal
Mar 16 01:09:17 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
Mar 16 01:09:17 PC kernel: EXT3-fs: recovery complete.
Mar 16 01:09:17 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.


All we expected to see in /var/log/messages was something more like:

Mar 17 01:09:03 PC kernel: kjournald starting.  Commit interval 5 seconds
Mar 17 01:09:03 PC kernel: EXT3 FS 2.4-0.9.19, 19 August 2002 on device-mapper(254,4), internal journal
Mar 17 01:09:03 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.


Why would the snapshot volume have an orphaned inode? Doesn't the VFS patch
allow us to snapshot EXT3? Do we need to quiesce the origin lv some other
way?



 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
    </pre>
  </blockquote>
  <pre wrap=""><!---->

 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

  </pre>
</blockquote>
<br>
</body>
</html>

--------------090302070008080801010403--
