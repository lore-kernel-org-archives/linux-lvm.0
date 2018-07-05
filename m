Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3FE5D9C6
	for <linux-lvm@redhat.com>; Thu,  5 Jul 2018 09:38:21 +0000 (UTC)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08D8F3001769
	for <linux-lvm@redhat.com>; Thu,  5 Jul 2018 09:38:10 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id c6-v6so15654271oiy.0
	for <linux-lvm@redhat.com>; Thu, 05 Jul 2018 02:38:10 -0700 (PDT)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Thu, 5 Jul 2018 17:37:57 +0800
Message-ID: <CABZYMH7=O418BQ+Xh0bo_6mmp1nNmK4r5w_=vJkS4YdYyWjEwQ@mail.gmail.com>
Subject: [linux-lvm] [lvmlockd] "VG xxx lock faied: error -221" while lv
	operation sucess
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Sometimes I got "VG f68643c145454594871f6f51b69bf8ba lock failed:
error -221" at vg operations, likes lvcreate, while lv operation and
i/o on disks is good.

I found from this log in sanlock, vglock won't work:

        2018-07-05 15:28:06 20386 [19408]: s2:r2154 resource
lvm_f68643c145454594871f6f51b69bf8ba:VGLK:/dev/mapper/f68643c145454594871f6f51b69bf8ba-lvmlock:69206016
for 3,10,19384
        2018-07-05 15:28:06 20386 [19408]: r2154 cmd_acquire
3,10,19384 acquire_token -17
        2018-07-05 15:28:06 20386 [19408]: cmd_acquire 3,10,19384
result -17 pid_dead 0
        2018-07-05 15:28:07 20387 [19407]: cmd_acquire 2,9,19384 ci_in
2 fd 9 count 1 flags 9
        2018-07-05 15:28:07 20387 [19407]: s1:r2155 resource
lvm_91c80a9e4923424a8c5526e7900b3f2e:VGLK:/dev/mapper/91c80a9e4923424a8c5526e7900b3f2e-lvmlock:69206016:SH
for 2,9,19384
        2018-07-05 15:28:07 20387 [19407]: r2155 paxos_acquire begin e 0 0
        2018-07-05 15:28:07 20387 [19407]: r2155 leader 2226 owner 31
2 0 dblocks 30:4456031:4456031:31:2:20386:2226:1,
        2018-07-05 15:28:07 20387 [19407]: r2155 paxos_acquire leader
2226 owner 31 2 0 max mbal[30] 4456031 our_dblock 4456031 4456031 31 2
20386 2226
        2018-07-05 15:28:07 20387 [19407]: r2155 paxos_acquire leader 2226 free
        2018-07-05 15:28:07 20387 [19407]: r2155 ballot 2227 phase1
write mbal 4458031
        2018-07-05 15:28:07 20387 [19407]: r2155 ballot 2227 phase1
read 30:4458031:0:0:0:0:2227:0,
        2018-07-05 15:28:07 20387 [19407]: r2155 ballot 2227 phase2
write bal 4458031 inp 31 2 20387 q_max -1
        2018-07-05 15:28:07 20387 [19407]: r2155 ballot 2227 phase2
read 30:4458031:4458031:31:2:20387:2227:0,
        2018-07-05 15:28:07 20387 [19407]: r2155 ballot 2227 commit
self owner 31 2 20387
        2018-07-05 15:28:07 20387 [19407]: r2155 acquire_disk rv 1
lver 2227 at 20387
        2018-07-05 15:28:07 20387 [19407]: r2155 write_host_block
host_id 31 flags 1 gen 2 dblock
4458031:4458031:31:2:20387:2227:RELEASED.
        2018-07-05 15:28:07 20387 [19407]: r2155 paxos_release leader
2227 owner 31 2 20387
        2018-07-05 15:28:07 20387 [19407]: cmd_acquire 2,9,19384
result 0 pid_dead 0
        2018-07-05 15:28:07 20387 [19408]: cmd_get_lvb ci 4 fd 14
result 0 res lvm_91c80a9e4923424a8c5526e7900b3f2e:VGLK
        2018-07-05 15:28:07 20387 [19407]: cmd_acquire 2,9,19384 ci_in
2 fd 9 count 1 flags 8
        2018-07-05 15:28:07 20387 [19407]: s1:r2156 resource
lvm_91c80a9e4923424a8c5526e7900b3f2e:Y2HZd7-ep4u-pead-Iuvv-B4c2-XbfR-bBjNUq:/dev/mapper/91c80a9e4923424a8c5526e7900b3f2e-lvmlock:127926272:SH
for 2,9,19384
        2018-07-05 15:28:07 20387 [19407]: r2156 paxos_acquire begin e 0 0
        2018-07-05 15:28:07 20387 [19407]: r2156 leader 4 owner 31 2 0
dblocks 30:6031:6031:31:2:10964:4:1,
        2018-07-05 15:28:07 20387 [19407]: r2156 paxos_acquire leader
4 owner 31 2 0 max mbal[30] 6031 our_dblock 6031 6031 31 2 10964 4
        2018-07-05 15:28:07 20387 [19407]: r2156 paxos_acquire leader 4 free
        2018-07-05 15:28:07 20387 [19407]: r2156 ballot 5 phase1 write mbal 8031
        2018-07-05 15:28:07 20387 [19407]: r2156 ballot 5 phase1 read
30:8031:0:0:0:0:5:0,
        2018-07-05 15:28:07 20387 [19407]: r2156 ballot 5 phase2 write
bal 8031 inp 31 2 20387 q_max -1
        2018-07-05 15:28:07 20387 [19407]: r2156 ballot 5 phase2 read
30:8031:8031:31:2:20387:5:0,
        2018-07-05 15:28:07 20387 [19407]: r2156 ballot 5 commit self
owner 31 2 20387
        2018-07-05 15:28:07 20387 [19407]: r2156 acquire_disk rv 1
lver 5 at 20387
        2018-07-05 15:28:07 20387 [19407]: r2156 write_host_block
host_id 31 flags 1 gen 2 dblock 8031:8031:31:2:20387:5:RELEASED.
        2018-07-05 15:28:07 20387 [19407]: r2156 paxos_release leader
5 owner 31 2 20387
        2018-07-05 15:28:07 20387 [19407]: cmd_acquire 2,9,19384
result 0 pid_dead 0
        2018-07-05 15:28:07 20387 [19408]: cmd_acquire 2,9,19384 ci_in
2 fd 9 count 1 flags 8
        2018-07-05 15:28:07 20387 [19408]: s1:r2157 resource
lvm_91c80a9e4923424a8c5526e7900b3f2e:JrNEDM-pDpV-2a8c-qwfX-sJZv-ZHps-ffHB3l:/dev/mapper/91c80a9e4923424a8c5526e7900b3f2e-lvmlock:168820736
for 2,9,19384
        2018-07-05 15:28:07 20387 [19408]: r2157 paxos_acquire begin a 0 0
        2018-07-05 15:28:07 20387 [19408]: r2157 leader 1 owner 31 2 0
dblocks 30:31:31:31:2:20385:1:1,
        2018-07-05 15:28:07 20387 [19408]: r2157 paxos_acquire leader
1 owner 31 2 0 max mbal[30] 31 our_dblock 31 31 31 2 20385 1
        2018-07-05 15:28:07 20387 [19408]: r2157 paxos_acquire leader 1 free
        2018-07-05 15:28:07 20387 [19408]: r2157 ballot 2 phase1 write mbal 2031
        2018-07-05 15:28:07 20387 [19408]: r2157 ballot 2 phase1 read
30:2031:0:0:0:0:2:0,
        2018-07-05 15:28:07 20387 [19408]: r2157 ballot 2 phase2 write
bal 2031 inp 31 2 20387 q_max -1
        2018-07-05 15:28:07 20387 [19408]: r2157 ballot 2 phase2 read
30:2031:2031:31:2:20387:2:0,
        2018-07-05 15:28:07 20387 [19408]: r2157 ballot 2 commit self
owner 31 2 20387
        2018-07-05 15:28:07 20387 [19408]: r2157 acquire_disk rv 1
lver 2 at 20387
        2018-07-05 15:28:07 20387 [19408]: cmd_acquire 2,9,19384
result 0 pid_dead 0
        2018-07-05 15:28:07 20387 [19407]: cmd_release 2,9,19384 ci_in
2 fd 9 count 1 flags 0
        2018-07-05 15:28:07 20387 [19407]: r2155 release_token r_flags
1 lver 2227
        2018-07-05 15:28:07 20387 [19407]: r2155 write_host_block
host_id 31 flags 0 gen 0 dblock
4458031:4458031:31:2:20387:2227:RELEASED.
        2018-07-05 15:28:07 20387 [19407]: r2155 release_token done r_flags 1
        2018-07-05 15:28:07 20387 [19407]: cmd_release 2,9,19384
result 0 pid_dead 0 count 1
        2018-07-05 15:28:08 20388 [19408]: cmd_acquire 3,10,19384
ci_in 3 fd 10 count 1 flags 9
        2018-07-05 15:28:08 20388 [19408]: s2:r2158 resource
lvm_f68643c145454594871f6f51b69bf8ba:VGLK:/dev/mapper/f68643c145454594871f6f51b69bf8ba-lvmlock:69206016
for 3,10,19384
        2018-07-05 15:28:08 20388 [19408]: r2158 cmd_acquire
3,10,19384 acquire_token -17
        2018-07-05 15:28:08 20388 [19408]: cmd_acquire 3,10,19384
result -17 pid_dead 0
        2018-07-05 15:28:08 20388 [19407]: cmd_acquire 2,9,19384 ci_in
2 fd 9 count 1 flags 9
        2018-07-05 15:28:08 20388 [19407]: s1:r2159 resource
lvm_91c80a9e4923424a8c5526e7900b3f2e:VGLK:/dev/mapper/91c80a9e4923424a8c5526e7900b3f2e-lvmlock:69206016:SH
for 2,9,19384


Meantime lvmlockctl -d:

        1530775686 recv lvcreate[5615] cl 1889 lock vg
"f68643c145454594871f6f51b69bf8ba" mode ex flags 0
        1530775686 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK action lock ex
        1530775686 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK
res_lock cl 1889 mode ex
        1530775686 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK
lock_san ex at /dev/mapper/f68643c145454594871f6f51b69bf8ba-lvmlock:69206016
        1530775686 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK
lock_san acquire error -17
        1530775686 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK
res_lock rv -221 read vb 0 0 0
        1530775686 send lvcreate[5615] cl 1889 lock vg rv -221
        1530775686 close lvcreate[5615] cl 1889 fd 9
        1530775686 new cl 1890 pi 2 fd 9
        1530775686 new cl 1891 pi 3 fd 12
        1530775687 recv lvchange[5624] cl 1890 lock vg
"91c80a9e4923424a8c5526e7900b3f2e" mode sh flags 0
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R VGLK action lock sh
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R VGLK
res_lock cl 1890 mode sh
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R VGLK
lock_san sh at /dev/mapper/91c80a9e4923424a8c5526e7900b3f2e-lvmlock:69206016
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R VGLK
res_lock rv 0 read vb 101 0 344
        1530775687 send lvchange[5624] cl 1890 lock vg rv 0
        1530775687 recv lvchange[5624] cl 1890 lock lv
"91c80a9e4923424a8c5526e7900b3f2e" mode sh flags 1
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R
Y2HZd7-ep4u-pead-Iuvv-B4c2-XbfR-bBjNUq action lock sh
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R
Y2HZd7-ep4u-pead-Iuvv-B4c2-XbfR-bBjNUq res_lock cl 1890 mode sh
(bd6553925764483b96781d0d11f4d385)
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R
Y2HZd7-ep4u-pead-Iuvv-B4c2-XbfR-bBjNUq lock_san sh at
/dev/mapper/91c80a9e4923424a8c5526e7900b3f2e-lvmlock:127926272
        1530775687 S lvm_91c80a9e4923424a8c5526e7900b3f2e R
Y2HZd7-ep4u-pead-Iuvv-B4c2-XbfR-bBjNUq res_lock rv 0
        1530775687 send lvchange[5624] cl 1890 lock lv rv 0

My environment:

    [root@iscsi ~]# rpm -qa | grep -E 'lvm|san'
    lvm2-libs-2.02.177-4.el7.x86_64
    lvm2-2.02.177-4.el7.x86_64
    sanlock-3.6.0-1.el7.x86_64
    lvm2-lockd-2.02.177-4.el7.x86_64
    sanlock-lib-3.6.0-1.el7.x86_64

I have tried stop lock and start again, but still error -221

Thanks,
Damon
