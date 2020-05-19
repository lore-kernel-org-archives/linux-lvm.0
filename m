Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80F212166BA3
	for <linux-lvm@redhat.com>; Tue, 19 May 2020 13:31:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D1AE833B4B
	for <linux-lvm@redhat.com>; Tue, 19 May 2020 13:31:52 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g9so11551299edw.10
	for <linux-lvm@redhat.com>; Tue, 19 May 2020 06:31:49 -0700 (PDT)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Tue, 19 May 2020 21:31:16 +0800
Message-ID: <CABZYMH53DVpN0mPrrEacDedyyX-fdi4+QH7-hHc6Fvtjm8akUg@mail.gmail.com>
Subject: [linux-lvm] [lvmlockd] sanlock stuck while getting VGLK
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>, sanlock-devel@lists.fedorahosted.org

Hi,

I got a wired case recently with a 24-nodes sanlock cluster recently.
One sanlock process stuck with getting VGLK since it thinks there are
two live host using VGLK shared lock, here is sanlock log from this
host(host_id 19): https://pastebin.com/zJubYLRv

I find important messages:


    "2020-05-14 21:28:51 2018540 [14765]: r857 clear_dead_shared
host_id 61 gen 1 alive"
    "2020-05-14 21:28:51 2018540 [14765]: r857 clear_dead_shared
host_id 94 gen 1 alive"
    "2020-05-14 21:28:52 2018541 [14764]: r858 clear_dead_shared
host_id 61 gen 1 alive"
    "2020-05-14 21:28:52 2018541 [14764]: r858 clear_dead_shared
host_id 94 gen 1 alive"
    "2020-05-14 21:28:53 2018542 [14765]: r859 clear_dead_shared
host_id 61 gen 1 alive"
    "2020-05-14 21:28:53 2018542 [14765]: r859 clear_dead_shared
host_id 94 gen 1 alive"
    "2020-05-14 21:28:54 2018543 [14764]: r860 clear_dead_shared
host_id 61 gen 1 alive"
    "2020-05-14 21:28:54 2018543 [14764]: r860 clear_dead_shared
host_id 94 gen 1 alive"
    "2020-05-14 21:28:55 2018544 [14765]: r861 clear_dead_shared
host_id 61 gen 1 alive"
    "2020-05-14 21:28:55 2018544 [14765]: r861 clear_dead_shared
host_id 94 gen 1 alive"


and this last hours till I init VGLK manually: sanlock direct init -r xxx

So I try to find out what happend to host_id 61 and host_id 94, it
seems both two hosts tried to acquire VGLK and then released, though
with long time.

full log of host_id 61: https://pastebin.com/zDWQAtHE

useful log:


    2020-05-14 20:23:03 2545197 [33739]: cmd_acquire 6,16,33743 ci_in
6 fd 16 count 1 flags 9
    2020-05-14 20:23:03 2545197 [33739]: s5:r1044 resource
lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:69206016:SH
for 6,16,33743
    2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire begin e 0 0
    2020-05-14 20:23:03 2545197 [33739]: r1044 leader 6067 owner 36 2
0 dblocks 35:12132036:12132036:36:2:2099201:6067:1,
    2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire leader
6067 owner 36 2 0 max mbal[35] 12132036 our_dblock 12096061 12096061
61 1 2537794 6049
    2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire leader 6067 free
    2020-05-14 20:23:03 2545197 [33739]: r1044 ballot 6068 phase1
write mbal 12134061
    2020-05-14 20:23:03 2545198 [33739]: r1044 ballot 6068 mode[93]
shared 1 gen 1
    2020-05-14 20:23:03 2545198 [33739]: r1044 ballot 6068 phase1 read
60:12134061:0:0:0:0:6068:0,
    2020-05-14 20:23:03 2545198 [33739]: r1044 ballot 6068 phase2
write bal 12134061 inp 61 1 2545198 q_max -1
    2020-05-14 20:23:03 2545198 [33739]: r1044 ballot 6068 phase2 read
60:12134061:12134061:61:1:2545198:6068:0,
    2020-05-14 20:23:03 2545198 [33739]: r1044 ballot 6068 commit self
owner 61 1 2545198
    2020-05-14 20:23:03 2545198 [33739]: r1044 acquire_disk rv 1 lver
6068 at 2545198
    2020-05-14 20:23:03 2545198 [33739]: r1044 write_host_block
host_id 61 flags 1 gen 1 dblock
12134061:12134061:61:1:2545198:6068:RELEASED.
    2020-05-14 20:23:03 2545198 [33739]: r1044 paxos_release leader
6068 owner 61 1 2545198
    2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 result
0 pid_dead 0
    2020-05-14 20:23:03 2545198 [33740]: cmd_get_lvb ci 8 fd 20 result
0 res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK
    2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 ci_in
6 fd 16 count 1 flags 8
    2020-05-14 20:23:03 2545198 [33739]: s5:r1045 resource
lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600
for 6,16,33743
    2020-05-14 20:23:03 2545198 [33739]: r1045 paxos_acquire begin a 0 0
    2020-05-14 20:23:03 2545198 [33739]: r1045 leader 9 owner 94 1 0
dblocks 93:16094:16094:94:1:8414771:9:1,
    2020-05-14 20:23:03 2545198 [33739]: r1045 paxos_acquire leader 9
owner 94 1 0 max mbal[93] 16094 our_dblock 0 0 0 0 0 0
    2020-05-14 20:23:03 2545198 [33739]: r1045 paxos_acquire leader 9 free
    2020-05-14 20:23:03 2545198 [33739]: r1045 ballot 10 phase1 write mbal 18061
    2020-05-14 20:23:03 2545198 [33739]: r1045 ballot 10 phase1 read
60:18061:0:0:0:0:10:0,
    2020-05-14 20:23:03 2545198 [33739]: r1045 ballot 10 phase2 write
bal 18061 inp 61 1 2545198 q_max -1
    2020-05-14 20:23:03 2545198 [33739]: r1045 ballot 10 phase2 read
60:18061:18061:61:1:2545198:10:0,
    2020-05-14 20:23:03 2545198 [33739]: r1045 ballot 10 commit self
owner 61 1 2545198
    2020-05-14 20:23:03 2545198 [33739]: r1045 acquire_disk rv 1 lver
10 at 2545198
    2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 result
0 pid_dead 0
    ...
    2020-05-14 20:55:05 2547119 [33740]: cmd_release 6,16,33743 ci_in
6 fd 16 count 1 flags 0
    2020-05-14 20:55:05 2547119 [33740]: r1045 release_token r_flags 8 lver 10
    2020-05-14 20:55:05 2547119 [33740]: r1045 write_host_block
host_id 61 flags 0 gen 0 dblock 18061:18061:61:1:2545198:10:RELEASED.
    2020-05-14 20:55:05 2547119 [33740]: r1045 paxos_release leader 10
owner 61 1 2545198
    2020-05-14 20:55:05 2547119 [33740]: r1045 release_token done r_flags 8
    2020-05-14 20:55:05 2547119 [33740]: cmd_release 6,16,33743 result
0 pid_dead 0 count 1


full log of host_id 94: https://pastebin.com/H18vAHZq

useful log, it's similar to host_id 60, but shorter time to release:


    2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 ci_in
6 fd 16 count 1 flags 9
    2020-05-14 20:01:20 8414771 [11203]: s5:r3021 resource
lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:69206016:SH
for 6,16,11206
    2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire begin e 0 0
    2020-05-14 20:01:20 8414771 [11203]: r3021 leader 6063 owner 36 2
0 dblocks 35:12124036:12124036:36:2:2097966:6063:1,
    2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire leader
6063 owner 36 2 0 max mbal[35] 12124036 our_dblock 11840094 11840094
94 1 8325309 5921
    2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire leader 6063 free
    2020-05-14 20:01:20 8414771 [11203]: r3021 ballot 6064 phase1
write mbal 12126094
    2020-05-14 20:01:20 8414771 [11203]: r3021 ballot 6064 phase1 read
93:12126094:0:0:0:0:6064:0,
    2020-05-14 20:01:20 8414771 [11203]: r3021 ballot 6064 phase2
write bal 12126094 inp 94 1 8414771 q_max -1
    2020-05-14 20:01:20 8414771 [11203]: r3021 ballot 6064 phase2 read
93:12126094:12126094:94:1:8414771:6064:0,
    2020-05-14 20:01:20 8414771 [11203]: r3021 ballot 6064 commit self
owner 94 1 8414771
    2020-05-14 20:01:20 8414771 [11203]: r3021 acquire_disk rv 1 lver
6064 at 8414771
    2020-05-14 20:01:20 8414771 [11203]: r3021 write_host_block
host_id 94 flags 1 gen 1 dblock
12126094:12126094:94:1:8414771:6064:RELEASED.
    2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_release leader
6064 owner 94 1 8414771
    2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 result
0 pid_dead 0
    2020-05-14 20:01:20 8414771 [11202]: cmd_get_lvb ci 8 fd 20 result
0 res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK
    2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 ci_in
6 fd 16 count 1 flags 8
    2020-05-14 20:01:20 8414771 [11203]: s5:r3022 resource
lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600:SH
for 6,16,11206
    2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire begin e 0 0
    2020-05-14 20:01:20 8414771 [11203]: r3022 leader 8 owner 36 2 0
dblocks 35:14036:14036:36:2:1566014:8:1,
    2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire leader 8
owner 36 2 0 max mbal[35] 14036 our_dblock 0 0 0 0 0 0
    2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire leader 8 free
    2020-05-14 20:01:20 8414771 [11203]: r3022 ballot 9 phase1 write mbal 16094
    2020-05-14 20:01:20 8414771 [11203]: r3022 ballot 9 mode[35] shared 1 gen 2
    2020-05-14 20:01:20 8414771 [11203]: r3022 ballot 9 phase1 read
93:16094:0:0:0:0:9:0,
    2020-05-14 20:01:20 8414771 [11203]: r3022 ballot 9 phase2 write
bal 16094 inp 94 1 8414771 q_max -1
    2020-05-14 20:01:20 8414771 [11203]: r3022 ballot 9 phase2 read
93:16094:16094:94:1:8414771:9:0,
    2020-05-14 20:01:20 8414771 [11203]: r3022 ballot 9 commit self
owner 94 1 8414771
    2020-05-14 20:01:20 8414771 [11203]: r3022 acquire_disk rv 1 lver
9 at 8414771
    2020-05-14 20:01:20 8414771 [11203]: r3022 write_host_block
host_id 94 flags 1 gen 1 dblock 16094:16094:94:1:8414771:9:RELEASED.
    2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_release leader 9
owner 94 1 8414771
    2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 result
0 pid_dead 0
    ... ...
    2020-05-14 20:11:20 8415371 [11202]: cmd_release 6,16,11206 ci_in
6 fd 16 count 1 flags 0
    2020-05-14 20:11:20 8415371 [11202]: r3022 release_token r_flags 1 lver 9
    2020-05-14 20:11:20 8415371 [11202]: r3022 write_host_block
host_id 94 flags 0 gen 0 dblock 16094:16094:94:1:8414771:9:RELEASED.
    2020-05-14 20:11:20 8415371 [11202]: r3022 release_token done r_flags 1
    2020-05-14 20:11:20 8415371 [11202]: cmd_release 6,16,11206 result
0 pid_dead 0 count 1


So, I got several questions:

1. Why it takes so long to release lock, does it should blame to storage I/O ?
2. Why other host(host_id 19) can read pervious shared lock(host_id 60
& 94) after hour?
3. What's the "right" way to solve this problem?

Thanks a lot !

Damon Wang
