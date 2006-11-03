Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA3IkIYL027435
	for <linux-lvm@redhat.com>; Fri, 3 Nov 2006 13:46:18 -0500
Received: from vtmail3.earthcars.net (smtp.dealer.com [64.243.19.169])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kA3IkARe022015
	for <linux-lvm@redhat.com>; Fri, 3 Nov 2006 13:46:11 -0500
Message-ID: <454B8DBE.4070706@dealer.com>
Date: Fri, 03 Nov 2006 13:43:10 -0500
From: Rob Ostrander <rob@dealer.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] kernel oops when creating snapshots with names >= 17
	characters
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Running RHEL4 U4 EM64T, kernel 2.6.9-5.ELsmp, on a Dell PowerEdge 2950.
lvm2-2.02.06-6.0.RHEL4
device-mapper-1.02.07-4.0.RHEL4

When I attempt to run lvcreate with a name containing 17 or more 
characters (resulting in 35 characters for volume name) I get the 
following error:
Nov  3 11:34:50 localhost kernel:  <1>Unable to handle kernel NULL 
pointer dereference at 0000000000000050 RIP:
Nov  3 11:34:50 localhost kernel: <ffffffff801dcabd>{rb_first+10}
Nov  3 11:34:50 localhost kernel: PML4 c0572067 PGD 10b474067 PMD 0
Nov  3 11:34:50 localhost kernel: Oops: 0000 [12] SMP
Nov  3 11:34:50 localhost kernel: CPU 2
Nov  3 11:34:50 localhost kernel: Modules linked in: parport_pc lp 
parport autofs4 i2c_dev i2c_core sunrpc ds yenta_socket pcmcia_core 
button battery ac sr_mod(U) usb_storage joydev uhci_hcd ehci_hcd 
hw_random shpchp bnx2(U) dm_snapshot dm_zero dm_mirror ext3 jbd(U) 
dm_mod megaraid_sas(U) sd_mod scsi_mod
Nov  3 11:34:50 localhost kernel: Pid: 27398, comm: lvcreate Not tainted 
2.6.9-5.ELsmp
Nov  3 11:34:50 localhost kernel: RIP: 0010:[<ffffffff801dcabd>] 
<ffffffff801dcabd>{rb_first+10}
Nov  3 11:34:50 localhost kernel: RSP: 0018:00000100c7ea7ea0  EFLAGS: 
00010202
Nov  3 11:34:50 localhost kernel: RAX: 0000000000000038 RBX: 
0000010169d12ce8 RCX: 00000100cff47c00
Nov  3 11:34:50 localhost kernel: RDX: 0000000000000000 RSI: 
000000000000006c RDI: 0000010169d12ce0
Nov  3 11:34:50 localhost kernel: RBP: 000001021924e000 R08: 
0000000000000022 R09: 0000000000000000
Nov  3 11:34:50 localhost kernel: R10: 0000000000000000 R11: 
ffffffff801700f4 R12: 0000010169d12ce0
Nov  3 11:34:50 localhost kernel: R13: 000000000069d824 R14: 
0000010169d12da0 R15: 0000007fbfffb480
Nov  3 11:34:50 localhost kernel: FS:  0000002a9557a540(0000) 
GS:ffffffff804bf400(0000) knlGS:0000000000000000
Nov  3 11:34:50 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
000000008005003b
Nov  3 11:34:50 localhost kernel: CR2: 0000000000000050 CR3: 
000000000e3ce000 CR4: 00000000000006e0
Nov  3 11:34:50 localhost kernel: Process lvcreate (pid: 27398, 
threadinfo 00000100c7ea6000, task 0000010203d557f0)
Nov  3 11:34:50 localhost kernel: Stack: ffffffff8016d534 
0000010169d12cb8 000001021924e000 000001011a2a5cb8
Nov  3 11:34:50 localhost kernel:        ffffffff80170105 
0000000000000000 ffffffff8018105f 000001022fb53b88
Nov  3 11:34:50 localhost kernel:        0000010037e58200 00000012f04487fc
Nov  3 11:34:50 localhost kernel: Call 
Trace:<ffffffff8016d534>{mpol_free_shared_policy+53} 
<ffffffff80170105>{shmem_destroy_inode+17}
Nov  3 11:34:50 localhost kernel:        
<ffffffff8018105f>{sys_unlink+261} <ffffffff8010ffd2>{system_call+126}
Nov  3 11:34:50 localhost kernel:
Nov  3 11:34:50 localhost kernel:
Nov  3 11:34:50 localhost kernel: Code: 48 83 78 18 00 74 06 48 8b 40 18 
eb f3 48 89 c2 48 89 d0 c3
Nov  3 11:34:50 localhost kernel: RIP <ffffffff801dcabd>{rb_first+10} 
RSP <00000100c7ea7ea0>
Nov  3 11:34:50 localhost kernel: CR2: 0000000000000050

I can reliably reproduce the issue with the following:
[root@wcmc10 ~]# cat lvtest.sh
x="1";
while [ 1 ]; do
 snap_name=${snap_name}$x;
 length=`echo /dev/VolGroup01/$snap_name |wc -c`;
 echo "creating /dev/VolGroup01/$snap_name with $length characters";
 lvcreate -L2g -s -n ${snap_name}  /dev/VolGroup01/db;
 sleep 1;
 echo "removing /dev/VolGroup01/$snap_name";
 lvremove -f /dev/VolGroup01/${snap_name};
 sleep 1;
 inc=`expr $x + 1`;
 x=`expr $inc % 10`;
done

Running the above I get the following results:
[root@wcmc10 ~]# ./lvtest.sh
creating /dev/VolGroup01/1 with 18 characters
  Logical volume "1" created
removing /dev/VolGroup01/1
  Logical volume "1" successfully removed
creating /dev/VolGroup01/12 with 19 characters
  Logical volume "12" created
removing /dev/VolGroup01/12
  Logical volume "12" successfully removed
creating /dev/VolGroup01/123 with 20 characters
  Logical volume "123" created
removing /dev/VolGroup01/123
  Logical volume "123" successfully removed
creating /dev/VolGroup01/1234 with 21 characters
  Logical volume "1234" created
removing /dev/VolGroup01/1234
  Logical volume "1234" successfully removed
creating /dev/VolGroup01/12345 with 22 characters
  Logical volume "12345" created
removing /dev/VolGroup01/12345
  Logical volume "12345" successfully removed
creating /dev/VolGroup01/123456 with 23 characters
  Logical volume "123456" created
removing /dev/VolGroup01/123456
  Logical volume "123456" successfully removed
creating /dev/VolGroup01/1234567 with 24 characters
  Logical volume "1234567" created
removing /dev/VolGroup01/1234567
  Logical volume "1234567" successfully removed
creating /dev/VolGroup01/12345678 with 25 characters
  Logical volume "12345678" created
removing /dev/VolGroup01/12345678
  Logical volume "12345678" successfully removed
creating /dev/VolGroup01/123456789 with 26 characters
  Logical volume "123456789" created
removing /dev/VolGroup01/123456789
  Logical volume "123456789" successfully removed
creating /dev/VolGroup01/1234567890 with 27 characters
  Logical volume "1234567890" created
removing /dev/VolGroup01/1234567890
  Logical volume "1234567890" successfully removed
creating /dev/VolGroup01/12345678901 with 28 characters
  Logical volume "12345678901" created
removing /dev/VolGroup01/12345678901
  Logical volume "12345678901" successfully removed
creating /dev/VolGroup01/123456789012 with 29 characters
  Logical volume "123456789012" created
removing /dev/VolGroup01/123456789012
  Logical volume "123456789012" successfully removed
creating /dev/VolGroup01/1234567890123 with 30 characters
  Logical volume "1234567890123" created
removing /dev/VolGroup01/1234567890123
  Logical volume "1234567890123" successfully removed
creating /dev/VolGroup01/12345678901234 with 31 characters
  Logical volume "12345678901234" created
removing /dev/VolGroup01/12345678901234
  Logical volume "12345678901234" successfully removed
creating /dev/VolGroup01/123456789012345 with 32 characters
  Logical volume "123456789012345" created
removing /dev/VolGroup01/123456789012345
  Logical volume "123456789012345" successfully removed
creating /dev/VolGroup01/1234567890123456 with 33 characters
  Logical volume "1234567890123456" created
removing /dev/VolGroup01/1234567890123456
  Logical volume "1234567890123456" successfully removed
creating /dev/VolGroup01/12345678901234567 with 34 characters
  Logical volume "12345678901234567" created
removing /dev/VolGroup01/12345678901234567
  Logical volume "12345678901234567" successfully removed
creating /dev/VolGroup01/123456789012345678 with 35 characters
./lvtest.sh: line 13: 29111 Killed                  lvcreate -L2g -s -n 
${snap_name} /dev/VolGroup01/db

Message from syslogd@localhost at Fri Nov  3 11:53:27 2006 ...
localhost kernel: Oops: 0000 [13] SMP

Message from syslogd@localhost at Fri Nov  3 11:53:27 2006 ...
localhost kernel: CR2: 0000000000000050
removing /dev/VolGroup01/123456789012345678
  Logical volume "123456789012345678" successfully removed
