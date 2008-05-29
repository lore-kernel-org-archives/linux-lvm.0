Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4TGEWPh014320
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 12:14:32 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.234])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4TGDbxa031357
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 12:13:38 -0400
Received: by rv-out-0506.google.com with SMTP id f6so4032620rvb.51
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 09:13:37 -0700 (PDT)
Message-ID: <7a65a83a0805290913v51e3f230s1f2f0aa80de9ad30@mail.gmail.com>
Date: Thu, 29 May 2008 12:13:37 -0400
From: "Richard Edward Horner" <rich@richhorner.com>
Sender: mechanyx@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Veritas/Symantec Backup Exec Remote Agent prevents
	removal of LVM snapshot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi,

I had an issue come up over the weekend on a production machine that I
was able to resolve with the help of Red Hat support but I thought I
should post the info here as it seems like it might be a bug.

The machine in question is a dual core Opteron 2218 running x86_64
RHEL 5.1 with kernel 2.6.18-92.el5 #1 SMP Tue Apr 29 13:16:15 EDT 2008
x86_64 x86_64 x86_64 GNU/Linux. It has a RAID 5 and a RAID 10 on an HP
Smart Array controller (one of the cciss ones).

The backup procedure on this machine is basically, stop the database,
create LVM snapshots of the volumes on the RAIDs, start the database,
mount the snapshots, tar, unmount the snapshots, remove the snapshots.
The next day, the tape backup server pulls the tar balls from mounted
eSATA. Pretty simple.

Watch what happens when we're done. u02 is the RAID 10. u03 is the RAID 5.

[root@www6 backup]# umount /mnt/u02snap/
[root@www6 backup]# lvremove -f /dev/msa1-r10/u02snap
  Logical volume "u02snap" successfully removed
[root@www6 backup]# lvremove -f /dev/msa1-r5/u03snap
  Can't remove open logical volume "u03snap"
[root@www6 backup]# lvremove /dev/msa1-r5/u03snap
  Can't remove open logical volume "u03snap"

OK, so we can remove the one but not the other ??? Why not?

[root@www6 backup]# dmsetup status /dev/mapper/msa1--r5-u03snap
0 4194304000 snapshot 216048/4194304

[root@www6 backup]# dmsetup info -c /dev/mapper/msa1--r5-u03snap
Name             Maj Min Stat Open Targ Event  UUID
msa1--r5-u03snap 253   4 L--w    1    1      0
LVM-YCyBjQE0Ffm10Fv82uZsRUvRH9oSvdBjYXzas7drqorLjkV4BUPklzXxAgvVpzKq

So, something is open apparently even though the filesystem is unmounted. Well:

[root@www6 backup]# lsof | grep u03snap

OK, it shows nothing as we expect.

Well, it turns out that the solution is to stop the Veritas/Symantec
Backup Exec Remote Agent client with:

/etc/init.d/VRTSralus.init stop

Why? I have no idea. Veritas never touches any of the LVM volumes and
it wasn't even communicating with the backup server. It's basically
just listening for connections.

RALUS is version 11.00.7170.

I have an strace of the failing lvremove call, an lvmdump and an sos
report. If any of these would be useful, let me know. I didn't want to
just post them to the list.

I'll probably file this with Symantec as well.

Thanks, Rich(ard)
-- 
Richard Edward Horner
Engineer / Composer / Electric Guitar Virtuoso
http://richhorner.com - updated June 28th
