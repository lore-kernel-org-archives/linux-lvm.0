Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8C2YQV24168
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2005 22:34:26 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.205])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8C2YKLc003579
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2005 22:34:20 -0400
Received: by wproxy.gmail.com with SMTP id i30so1792466wra
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2005 19:34:15 -0700 (PDT)
Message-ID: <95bbd190509111934b306235@mail.gmail.com>
Date: Mon, 12 Sep 2005 10:34:15 +0800
From: Bear Wolf <sportbear@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] new process dead after create multiple snapshot volumes
Reply-To: sportbear@gmail.com,
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
To: linux-lvm@redhat.com

Dear all 

I test snapshot function on my system.
when I create the first snapshot, everything works fine.
then I create more snapshot, everything works fine too.
but when I access the source volume and do sync
the sync command will be dead.

and I test with a script file

I=0
for I in 1 2 3 4 5 6 7 8 9
do
cp -af /etc /mnt/volume1
lvcreate -s -L 64 -n snaplv${I} /dev/VG01/volume1
sleep 1
done

after create the 4th sn apshot volume, the system process hang without
any error message.

result of ps
------------------------------------------------------------
 2259 pts/1    S+     0:00 bash test.sh
 2267 ?        S      0:00 [xfssyncd]
 2278 ?        S<     0:00 [kcopyd]
 2318 pts/1    D+     0:00 cp -af /etc /mnt/volume1/etc5


log of create the 4th snapstot volume
----------------------------------------------------
    Setting chunksize to 16 sectors.
    Finding volume group "VG01"
    Creating logical volume snaplv4
    Creating volume group backup "/etc/lvm/backup/VG01" (seqno 9).
    Found volume group "VG01"
    Loading VG01-snaplv4
    Zeroing start of logical volume "snaplv4"
    Found volume group "VG01"
    Removing VG01-snaplv4
    Found volume group "VG01"
    Found volume group "VG01"
    Found volume group "VG01"
    Loading VG01-snaplv1-cow
    Loading VG01-volume1-real
    Loading VG01-snaplv1
    Loading VG01-snaplv3-cow
    Loading VG01-snaplv3
    Loading VG01-snaplv4-cow
    Loading VG01-snaplv4
    Loading VG01-snaplv2-cow
    Loading VG01-snaplv2
    Loading VG01-volume1
    Creating volume group backup "/etc/lvm/backup/VG01" (seqno 10).
  Logical volume "snaplv4" created

resultof lvscan
-----------------------
  ACTIVE   Original '/dev/VG01/volume1' [128.00 MB] inherit
  ACTIVE   Snapshot '/dev/VG01/snaplv1' [64.00 MB] inherit
  ACTIVE   Snapshot '/dev/VG01/snaplv2' [64.00 MB] inherit
  ACTIVE   Snapshot '/dev/VG01/snaplv3' [64.00 MB] inherit
  ACTIVE   Snapshot '/dev/VG01/snaplv4' [64.00 MB] inherit

dmesg and messages has no error.

is this a known issue of snapshot?

Kernel 2.6.13
LVM version:     2.01.14 (2005-08-04)
Library version: 1.01.04 (2005-08-02)
Driver version:  4.4.0

Thanks.
SportBear
