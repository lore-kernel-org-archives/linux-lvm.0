Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAQNShrw010420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2016 18:28:43 -0500
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 079F061B86
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2016 23:28:40 +0000 (UTC)
References: <582049AF.7010905@strike.wu.ac.at>
	<6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
	<5820A497.80501@strike.wu.ac.at>
	<3c20480f-45e2-5864-cebc-ddc43b563944@redhat.com>
	<5821EC1A.306@strike.wu.ac.at>
	<888348b3-6080-24fc-7dd0-6b37d59c35f1@redhat.com>
	<582EE127.8060909@strike.wu.ac.at>
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <a0e079fb-d45f-bfbb-a51f-70824ac45710@strike.wu.ac.at>
Date: Sun, 27 Nov 2016 00:21:56 +0100
MIME-Version: 1.0
In-Reply-To: <582EE127.8060909@strike.wu.ac.at>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] very slow sequential writes on lvm raid1 (bitmap?)
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
To: linux-lvm@redhat.com

On 2016-11-18 12:08, Alexander 'Leo' Bergolth wrote:
> I did my tests with two 5k-RPM SATA disks connected to a single USB 3.0
> port using a JMS562 USB 3.0 to SATA bridge in JBOD mode. According to
> lsusb -t, the uas module is in use and looking at
> /sys/block/sdX/queue/nr_requests, command queuing seems to be active.
> 
> I've discussed my problems with Heinz Mauelshagen yesterday, who was
> able to reproduce the issue using two SATA disks, connected to two USB
> 3.0 ports that share the same USB bus. However, he didn't notice any
> speed penalties if the same disks are connected to different USB buses.
> 
> So it looks like the problem is USB related...

I did some tests similar to Heinz Mauelshagens setup and connected my disks to two different USB 3.0 buses. Unfortunately I cannot confirm that some kind of USB congestion is the problem. I am getting the same results as when using just one USB bus: Smaller regionsizes dramatically slow down sequential write speed.

The reason why Heinz got different results was the different dd blocksize in our tests: I did my tests with bs=1M oflag=direct and Heinz used bs=1G oflag=direct. This leads to much less bitmap updates (>1000 vs 60 for 1G of data).

I'd expect that those bitmap updates cause two seeks each. This random IO is, of course, very expensive, especially if slow 5000 RPM disks are used...

I've recorded some tests with blktrace. The results can be downloaded from http://leo.kloburg.at/tmp/lvm-raid1-bitmap/


# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
    |__ Port 4: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
        |__ Port 1: Dev 9, If 0, Class=Mass Storage, Driver=uas, 5000M
        |__ Port 2: Dev 8, If 0, Class=Mass Storage, Driver=uas, 5000M

# readlink -f /sys/class/block/sd[bc]/device/
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4.2/2-4.2:1.0/host2/target2:0:0/2:0:0:0
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4.1/2-4.1:1.0/host3/target3:0:0/3:0:0:0

# echo noop > /sys/block/sdb/queue/scheduler
# echo noop > /sys/block/sdc/queue/scheduler
# pvcreate /dev/sdb3 
# pvcreate /dev/sdc3 
# vgcreate vg_t /dev/sd[bc]3

# lvcreate --type raid1 -m 1 -L30G --regionsize=512k --nosync -y -n lv_t vg_t


# ---------- regionsize 512k, dd bs=1M oflags=direct
# blktrace -d /dev/sdb3 -d /dev/sdc3 -d /dev/vg_t/lv_t -D raid1-512k-reg-direct-bs-1M/
# dd if=/dev/zero of=/dev/vg_t/lv_t bs=1M count=1000 oflag=direct
1048576000 bytes (1,0 GB) copied, 55,7425 s, 18,8 MB/s

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
sdb3              0,00     0,00    0,00   54,00     0,00 18504,00   685,33     0,14    2,52    0,00    2,52   1,70   9,20
sdc3              0,00     0,00    0,00   54,00     0,00 18504,00   685,33     0,14    2,52    0,00    2,52   1,67   9,00
dm-9              0,00     0,00    0,00   18,00     0,00 18432,00  2048,00     1,00   54,06    0,00   54,06  55,39  99,70

# ---------- regionsize 512k, dd bs=1G oflags=direct
# blktrace -d /dev/sdb3 -d /dev/sdc3 -d /dev/vg_t/lv_t -D raid1-512k-reg-direct-bs-1G/
# dd if=/dev/zero of=/dev/vg_t/lv_t bs=1G count=1 oflag=direct
1+0 records in
1+0 records out
1073741824 bytes (1,1 GB) copied, 7,3139 s, 147 MB/s

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
sdb3              0,00     0,00    0,00  306,00     0,00 156672,00  1024,00   135,47  441,34    0,00  441,34   3,27 100,00
sdc3              0,00     0,00    0,00  302,00     0,00 154624,00  1024,00   129,46  421,76    0,00  421,76   3,31 100,00
dm-9              0,00     0,00    0,00    0,00     0,00     0,00     0,00   648,81    0,00    0,00    0,00   0,00 100,00


# ---------- regionsize 512k, dd bs=1M conv=fsync
# blktrace -d /dev/sdb3 -d /dev/sdc3 -d /dev/vg_t/lv_t -D raid1-512k-reg-fsync-bs-1M/
# dd if=/dev/zero of=/dev/vg_t/lv_t bs=1M count=1000 conv=fsync
1048576000 bytes (1,0 GB) copied, 7,75605 s, 135 MB/s

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
sdb3              0,00 21971,00    0,00  285,00     0,00 145920,00  1024,00   141,99  540,75    0,00  540,75   3,51 100,00
sdc3              0,00 21971,00    0,00  310,00     0,00 158720,00  1024,00   106,86  429,35    0,00  429,35   3,23 100,00
dm-9              0,00     0,00    0,00    0,00     0,00     0,00     0,00 24561,60    0,00    0,00    0,00   0,00 100,00


Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at   
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
