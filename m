Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECC6083873
	for <linux-lvm@redhat.com>; Wed, 10 Oct 2018 08:13:11 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8615C0256
	for <linux-lvm@redhat.com>; Wed, 10 Oct 2018 08:13:08 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id w81-v6so3380836oiw.9
	for <linux-lvm@redhat.com>; Wed, 10 Oct 2018 01:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <CABZYMH5DD8LFKNeFoWuk+8ZOAwyqWG5pVYAGYFtv4hjZ-Dyu5A@mail.gmail.com>
	<CABZYMH6jpnbF_RA-f_MR89DktgFnon6q0GXxmCkanvZjjG_AAw@mail.gmail.com>
In-Reply-To: <CABZYMH6jpnbF_RA-f_MR89DktgFnon6q0GXxmCkanvZjjG_AAw@mail.gmail.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 10 Oct 2018 16:12:56 +0800
Message-ID: <CABZYMH4Wza1VSe=OV=Ybb5Ajp_NaasD3MxtAz6FZ5hMXHfGdDQ@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] lvm command hung with sanlock log
 "ballot 3 abort1 larger lver in bk..."
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

seems mail server is not friendly with long text, so paste them in pastebin:

messages: https://pastebin.com/FUHLuWry
sanlock.log: https://pastebin.com/5JwmSCWP
sanlock client status: https://pastebin.com/9cGbav5f
ps aux: https://pastebin.com/6t6SQU6X


On Wed, Oct 10, 2018 at 3:58 PM Damon Wang <damon.devops@gmail.com> wrote:
>
> the log format of previous mail become horrible, so please this, thanks.
>
>
> Hi,
>
> I can not create lv in an environment and after some check I found a
> server has hold the VGLK and not released for long time.
>
> This is "sanlock client status" prints:
>
>         [root@HLD-1-4-S10 ~]# sanlock client status
>         daemon 091c17d0-822c6a4f-HLD-1-4-S10
>         p -1 helper
>         p -1 listener
>         p 27919 lvmlockd
>         p 27919 lvmlockd
>         p 27919 lvmlockd
>         p 27919 lvmlockd
>         p -1 status
>         s lvm_b075258f5b9547d7b4464fff246bbce1:49:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:0
>         s lvm_671bfaeb4e344014b041fc78115307bb:30:/dev/mapper/671bfaeb4e344014b041fc78115307bb-lvmlock:0
>         s lvm_4c149e7262a64c728997954257bece01:94:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:0
>         s lvm_091c17d096894a179313aad65cb4127a:87:/dev/mapper/091c17d096894a179313aad65cb4127a-lvmlock:0
>         r lvm_b075258f5b9547d7b4464fff246bbce1:VGLK:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:69206016:SH
> p 27919        <------
>         r lvm_4c149e7262a64c728997954257bece01:0fiorC-82Su-yVRq-dQPe-ed93-xYC5-Pou1i7:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:101711872:SH
> p 27919
>         r lvm_4c149e7262a64c728997954257bece01:TMG0ev-vvP0-kVWU-xRLE-G9y3-kMf0-bIgIrc:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:111149056:4
> p 27919
>         ... ...
>         r lvm_4c149e7262a64c728997954257bece01:yyjuZt-euSf-ZCG6-eJWF-a0f4-MtpA-KX2Jzr:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:119537664:4
> p 27919
>         r lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH
> p 27919 ADD        <------
>
> As it shows, it is adding lock for
> "lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD"
> and holding VGLK with shared mode, so there is an command hanging:
>
>         [root@HLD-1-4-S10 ~]# ps aux | grep lv
>         root      7755  0.0  0.0 160248  5724 ?        S    14:12
> 0:00 lvchange -asy
> /dev/b075258f5b9547d7b4464fff246bbce1/e36d96c2a29716b999b2a33aa16e94e0
>         root     11335  0.0  0.0 112660   972 pts/0    S+   14:40
> 0:00 grep --color=auto lv
>         root     27919  0.0  0.0 423860  5088 ?        Ssl  11:07
> 0:00 /usr/sbin/lvmlockd --daemon-debug --sanlock-timeout 40
>         root     27926  0.0  0.0 114476  1116 ?        Ssl  11:07
> 0:00 /usr/sbin/lvmetad -f
>
> As "ps" shows, I use lvmlockd with damon debug mode, so it will print
> log in messages:
>
>         Oct 10 14:07:13 HLD-1-4-S10 kernel: kvm [39758]: vcpu0
> disabled perfctr wrmsr: 0xc1 data 0xabcd
>         Oct 10 14:10:01 HLD-1-4-S10 systemd: Started Session 248 of user root.
>         Oct 10 14:10:01 HLD-1-4-S10 systemd: Starting Session 248 of user root.
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 new cl 849 pi 2 fd 9
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 recv
> lvchange[7755] cl 849 lock vg "b075258f5b9547d7b4464fff246bbce1" mode
> sh flags 0
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK action lock sh
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock cl 849 mode sh
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK lock_san sh at
> /dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:69206016
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock rv 0 read vb 101
> 0 3301
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock got version 3301
> our 3292
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock set lvmetad vg
> version 3301
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 send
> lvchange[7755] cl 849 lock vg rv 0
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 recv
> lvchange[7755] cl 849 lock lv "b075258f5b9547d7b4464fff246bbce1" mode
> sh flags 1
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R
> u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD action lock sh
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R
> u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD res_lock cl 849 mode sh
> (e36d96c2a29716b999b2a33aa16e94e0)
>         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> lvm_b075258f5b9547d7b4464fff246bbce1 R
> u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD lock_san sh at
> /dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056
>         Oct 10 14:15:23 HLD-1-4-S10 systemd-logind: New session 249 of
> user root.
>         Oct 10 14:15:23 HLD-1-4-S10 systemd: Started Session 249 of user root.
>         Oct 10 14:15:23 HLD-1-4-S10 systemd: Starting Session 249 of user root.
>         Oct 10 14:18:12 HLD-1-4-S10 sanlock[27912]: 2018-10-10
> 14:18:12 11831 [27917]: cmd_release 2,9,27919 no resource VGLK
>         Oct 10 14:20:01 HLD-1-4-S10 systemd: Started Session 250 of user root.
>         Oct 10 14:20:01 HLD-1-4-S10 systemd: Starting Session 250 of user root.
>         Oct 10 14:30:01 HLD-1-4-S10 systemd: Started Session 251 of user root.
>         Oct 10 14:30:01 HLD-1-4-S10 systemd: Starting Session 251 of user root.
>         Oct 10 14:32:22 HLD-1-4-S10 sanlock[27912]: 2018-10-10
> 14:32:22 12680 [27917]: cmd_release 2,9,27919 no resource VGLK
>         Oct 10 14:40:01 HLD-1-4-S10 systemd: Started Session 252 of user root.
>         Oct 10 14:40:01 HLD-1-4-S10 systemd: Starting Session 252 of user root.
>         Oct 10 14:40:28 HLD-1-4-S10 lvmlockd: 1539153628 new cl 850 pi
> 3 fd 14
>
> the timestamp matches, it holds VGLK at 14:12:36 and not release.
> So I keep digging log of sanlock and find this:
>
>         2018-10-10 14:12:33 11492 [27916]: cmd_examine 6,17
> lvm_091c17d096894a179313aad65cb4127a
>         2018-10-10 14:12:33 11492 [27916]: cmd_examine 6,17 done 2
>         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
>         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
>         2018-10-10 14:12:33 11492 [27917]: cmd_examine 6,17
> lvm_b075258f5b9547d7b4464fff246bbce1
>         2018-10-10 14:12:33 11492 [27917]: cmd_examine 6,17 done 2
>         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
>         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
>         2018-10-10 14:12:33 11492 [27916]: set_lockspace_event
> lvm_091c17d096894a179313aad65cb4127a
>         2018-10-10 14:12:33 11492 [27916]: cmd_set_event result 0
>         2018-10-10 14:12:33 11492 [27917]: set_lockspace_event
> lvm_b075258f5b9547d7b4464fff246bbce1
>         2018-10-10 14:12:33 11492 [27917]: cmd_set_event result 0
>         2018-10-10 14:12:34 11493 [9550]: s2 delta_renew begin read
>         2018-10-10 14:12:34 11493 [9550]: s2 delta_renew begin write
> for new ts 11493
>         2018-10-10 14:12:34 11493 [9550]: s2 renewed 11493
> delta_length 0 interval 81
>         2018-10-10 14:12:36 11494 [27916]: cmd_acquire 5,15,27919
> ci_in 5 fd 15 count 1 flags 9
>         2018-10-10 14:12:36 11494 [27916]: s4:r3097 resource
> lvm_b075258f5b9547d7b4464fff246bbce1:VGLK:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:69206016:SH
> for 5,15,27919
>         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_acquire begin e 0 0
>         2018-10-10 14:12:36 11494 [27916]: r3097 leader 42693 owner 66
> 2 0 dblocks 65:140695692504066:140695692504066:66:2:3805:42693:1,
>         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_acquire leader
> 42693 owner 66 2 0 max mbal[65] 140695692504066 our_dblock
> 140695692434049 140695692434049 49 2 4303 42658
>         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_acquire leader 42693 free
>         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase1
> write mbal 140695692506049
>         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase1
> read 48:140695692506049:0:0:0:0:42694:0,
>         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase2
> write bal 140695692506049 inp 49 2 11494 q_max -1
>         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase2
> read 48:140695692506049:140695692506049:49:2:11494:42694:0,
>         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 commit
> self owner 49 2 11494
>         2018-10-10 14:12:36 11494 [27916]: r3097 acquire_disk rv 1
> lver 42694 at 11494
>         2018-10-10 14:12:36 11494 [27916]: r3097 write_host_block
> host_id 49 flags 1 gen 2 dblock
> 140695692506049:140695692506049:49:2:11494:42694:RELEASED.
>         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_release leader
> 42694 owner 49 2 11494
>         2018-10-10 14:12:36 11494 [27916]: cmd_acquire 5,15,27919
> result 0 pid_dead 0
>         2018-10-10 14:12:36 11494 [27917]: cmd_get_lvb ci 6 fd 17
> result 0 res lvm_b075258f5b9547d7b4464fff246bbce1:VGLK
>         018-10-10 14:12:36 11494 [27916]: cmd_acquire 5,15,27919 ci_in
> 5 fd 15 count 1 flags 8
>         018-10-10 14:12:36 11494 [27916]: s4:r3098 resource
> lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH
> for 5,15,27919
>         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire begin e 0 0
>         018-10-10 14:12:36 11494 [27916]: r3098 leader 2 owner 19 1
> 4854717 dblocks
> 8:29802:510:140245418403952:140245440585933:140245418403840:4:1,48:202556049:0:0:0:0:3:0,65:218746066:0:0:0:0:3:0,79:202874080:0:0:0:0:3:0,
>         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717 max mbal[65] 218746066 our_dblock 202556049 0 0 0 0
> 3
>         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire owner 19
> 1 4854717 host_status 19 2 10914 wait_start 11494
>         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire owner 19
> 1 4854717 delta 19 2 10995 mismatch
>         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717
>         018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 phase1 write
> mbal 218748049
>         018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 abort1 larger
> lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> our dblock 218748049:0:0:0:0:3
>         018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 phase1 read
> 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
>         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire 3 retry
> delay 887122 us
>         018-10-10 14:12:37 11495 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717
>         018-10-10 14:12:37 11495 [27916]: r3098 ballot 3 phase1 write
> mbal 218750049
>         018-10-10 14:12:37 11495 [27916]: r3098 ballot 3 abort1 larger
> lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> our dblock 218750049:0:0:0:0:3
>         018-10-10 14:12:37 11495 [27916]: r3098 ballot 3 phase1 read
> 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
>         018-10-10 14:12:37 11495 [27916]: r3098 paxos_acquire 3 retry
> delay 455075 us
>         018-10-10 14:12:38 11496 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717
>         018-10-10 14:12:38 11496 [27916]: r3098 ballot 3 phase1 write
> mbal 218752049
>         018-10-10 14:12:38 11496 [27916]: r3098 ballot 3 abort1 larger
> lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> our dblock 218752049:0:0:0:0:3
>         018-10-10 14:12:38 11496 [27916]: r3098 ballot 3 phase1 read
> 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
>         018-10-10 14:12:38 11496 [27916]: r3098 paxos_acquire 3 retry
> delay 904853 us
>         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20
> lvm_671bfaeb4e344014b041fc78115307bb
>         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20 done 2
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20
> lvm_4c149e7262a64c728997954257bece01
>         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20 done 5
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11496 [27917]: set_lockspace_event
> lvm_671bfaeb4e344014b041fc78115307bb
>         018-10-10 14:12:38 11496 [27917]: cmd_set_event result 0
>         018-10-10 14:12:38 11496 [27917]: set_lockspace_event
> lvm_4c149e7262a64c728997954257bece01
>         018-10-10 14:12:38 11496 [27917]: cmd_set_event result 0
>         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20
> lvm_091c17d096894a179313aad65cb4127a
>         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20 done 2
>         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20
> lvm_b075258f5b9547d7b4464fff246bbce1
>         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20 done 3
>         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
>         018-10-10 14:12:38 11497 [27917]: set_lockspace_event
> lvm_091c17d096894a179313aad65cb4127a
>         018-10-10 14:12:38 11497 [27917]: cmd_set_event result 0
>         018-10-10 14:12:38 11497 [27917]: set_lockspace_event
> lvm_b075258f5b9547d7b4464fff246bbce1
>         018-10-10 14:12:38 11497 [27917]: cmd_set_event result 0
>         018-10-10 14:12:39 11497 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717
>         018-10-10 14:12:39 11497 [27916]: r3098 ballot 3 phase1 write
> mbal 218754049
>         018-10-10 14:12:39 11497 [27916]: r3098 ballot 3 abort1 larger
> lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> our dblock 218754049:0:0:0:0:3
>         018-10-10 14:12:39 11497 [27916]: r3098 ballot 3 phase1 read
> 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
>         018-10-10 14:12:39 11497 [27916]: r3098 paxos_acquire 3 retry
> delay 981162 us
>         018-10-10 14:12:40 11498 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717
>
>
> This is confusing to me, what means "ballot 3 abort1 larger lver inbk"
> and what causes this?
> Seems related to the bug I reported that io timeout when release
> vglock causes problems?
>
> Besides, I found there are some hosts has different sanlock io timeout
> than others, is this the root cause?
>
> Thanks,
> Damon
> On Wed, Oct 10, 2018 at 3:51 PM Damon Wang <damon.devops@gmail.com> wrote:
> >
> > Hi,
> >
> > I can not create lv in an environment and after some check I found a
> > server has hold the VGLK and not released for long time.
> >
> > this is "sanlock client status" prints:
> >
> >         [root@HLD-1-4-S10 ~]# sanlock client status
> >         daemon 091c17d0-822c6a4f-HLD-1-4-S10
> >         p -1 helper
> >         p -1 listener
> >         p 27919 lvmlockd
> >         p 27919 lvmlockd
> >         p 27919 lvmlockd
> >         p 27919 lvmlockd
> >         p -1 status
> >         s lvm_b075258f5b9547d7b4464fff246bbce1:49:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:0
> >         s lvm_671bfaeb4e344014b041fc78115307bb:30:/dev/mapper/671bfaeb4e344014b041fc78115307bb-lvmlock:0
> >         s lvm_4c149e7262a64c728997954257bece01:94:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:0
> >         s lvm_091c17d096894a179313aad65cb4127a:87:/dev/mapper/091c17d096894a179313aad65cb4127a-lvmlock:0
> >         r lvm_b075258f5b9547d7b4464fff246bbce1:VGLK:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:69206016:SH
> > p 27919        <------
> >         r lvm_4c149e7262a64c728997954257bece01:0fiorC-82Su-yVRq-dQPe-ed93-xYC5-Pou1i7:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:101711872:SH
> > p 27919
> >         r lvm_4c149e7262a64c728997954257bece01:TMG0ev-vvP0-kVWU-xRLE-G9y3-kMf0-bIgIrc:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:111149056:4
> > p 27919
> >         ... ...
> >         r lvm_4c149e7262a64c728997954257bece01:yyjuZt-euSf-ZCG6-eJWF-a0f4-MtpA-KX2Jzr:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:119537664:4
> > p 27919
> >         r lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH
> > p 27919 ADD        <------
> >
> > As it shows, it is adding lock for
> > "lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD"
> > and holding VGLK with shared mode, so there is an command hanging:
> >
> >         [root@HLD-1-4-S10 ~]# ps aux | grep lv
> >         root      7755  0.0  0.0 160248  5724 ?        S    14:12
> > 0:00 lvchange -asy
> > /dev/b075258f5b9547d7b4464fff246bbce1/e36d96c2a29716b999b2a33aa16e94e0
> >        <------
> >         root     11335  0.0  0.0 112660   972 pts/0    S+   14:40
> > 0:00 grep --color=auto lv
> >         root     27919  0.0  0.0 423860  5088 ?        Ssl  11:07
> > 0:00 /usr/sbin/lvmlockd --daemon-debug --sanlock-timeout 40
> >         root     27926  0.0  0.0 114476  1116 ?        Ssl  11:07
> > 0:00 /usr/sbin/lvmetad -f
> >
> > As "ps" shows, I use lvmlockd with damon debug mode, so it will print
> > log in messages:
> >
> >         Oct 10 14:07:13 HLD-1-4-S10 kernel: kvm [39758]: vcpu0
> > disabled perfctr wrmsr: 0xc1 data 0xabcd
> >         Oct 10 14:10:01 HLD-1-4-S10 systemd: Started Session 248 of user root.
> >         Oct 10 14:10:01 HLD-1-4-S10 systemd: Starting Session 248 of user root.
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 new cl 849 pi 2 fd 9
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 recv
> > lvchange[7755] cl 849 lock vg "b075258f5b9547d7b4464fff246bbce1" mode
> > sh flags 0
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK action lock sh
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock cl 849 mode sh
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK lock_san sh at
> > /dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:69206016
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock rv 0 read vb 101
> > 0 3301
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock got version 3301
> > our 3292
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R VGLK res_lock set lvmetad vg
> > version 3301
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 send
> > lvchange[7755] cl 849 lock vg rv 0
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 recv
> > lvchange[7755] cl 849 lock lv "b075258f5b9547d7b4464fff246bbce1" mode
> > sh flags 1
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R
> > u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD action lock sh
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R
> > u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD res_lock cl 849 mode sh
> > (e36d96c2a29716b999b2a33aa16e94e0)
> >         Oct 10 14:12:36 HLD-1-4-S10 lvmlockd: 1539151956 S
> > lvm_b075258f5b9547d7b4464fff246bbce1 R
> > u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD lock_san sh at
> > /dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056
> >         Oct 10 14:15:23 HLD-1-4-S10 systemd-logind: New session 249 of
> > user root.
> >         Oct 10 14:15:23 HLD-1-4-S10 systemd: Started Session 249 of user root.
> >         Oct 10 14:15:23 HLD-1-4-S10 systemd: Starting Session 249 of user root.
> >         Oct 10 14:18:12 HLD-1-4-S10 sanlock[27912]: 2018-10-10
> > 14:18:12 11831 [27917]: cmd_release 2,9,27919 no resource VGLK
> >         Oct 10 14:20:01 HLD-1-4-S10 systemd: Started Session 250 of user root.
> >         Oct 10 14:20:01 HLD-1-4-S10 systemd: Starting Session 250 of user root.
> >         Oct 10 14:30:01 HLD-1-4-S10 systemd: Started Session 251 of user root.
> >         Oct 10 14:30:01 HLD-1-4-S10 systemd: Starting Session 251 of user root.
> >         Oct 10 14:32:22 HLD-1-4-S10 sanlock[27912]: 2018-10-10
> > 14:32:22 12680 [27917]: cmd_release 2,9,27919 no resource VGLK
> >         Oct 10 14:40:01 HLD-1-4-S10 systemd: Started Session 252 of user root.
> >         Oct 10 14:40:01 HLD-1-4-S10 systemd: Starting Session 252 of user root.
> >         Oct 10 14:40:28 HLD-1-4-S10 lvmlockd: 1539153628 new cl 850 pi
> > 3 fd 14
> >
> > the timestamp matches, it holds VGLK at 14:12:36 and not release.
> > So I keep digging log of sanlock and find this:
> >
> >         2018-10-10 14:12:33 11492 [27916]: cmd_examine 6,17
> > lvm_091c17d096894a179313aad65cb4127a
> >         2018-10-10 14:12:33 11492 [27916]: cmd_examine 6,17 done 2
> >         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
> >         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
> >         2018-10-10 14:12:33 11492 [27917]: cmd_examine 6,17
> > lvm_b075258f5b9547d7b4464fff246bbce1
> >         2018-10-10 14:12:33 11492 [27917]: cmd_examine 6,17 done 2
> >         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
> >         2018-10-10 14:12:33 11492 [27918]: examine_token rv 1 lver 0 mode 0
> >         2018-10-10 14:12:33 11492 [27916]: set_lockspace_event
> > lvm_091c17d096894a179313aad65cb4127a
> >         2018-10-10 14:12:33 11492 [27916]: cmd_set_event result 0
> >         2018-10-10 14:12:33 11492 [27917]: set_lockspace_event
> > lvm_b075258f5b9547d7b4464fff246bbce1
> >         2018-10-10 14:12:33 11492 [27917]: cmd_set_event result 0
> >         2018-10-10 14:12:34 11493 [9550]: s2 delta_renew begin read
> >         2018-10-10 14:12:34 11493 [9550]: s2 delta_renew begin write
> > for new ts 11493
> >         2018-10-10 14:12:34 11493 [9550]: s2 renewed 11493
> > delta_length 0 interval 81
> >         2018-10-10 14:12:36 11494 [27916]: cmd_acquire 5,15,27919
> > ci_in 5 fd 15 count 1 flags 9
> >         2018-10-10 14:12:36 11494 [27916]: s4:r3097 resource
> > lvm_b075258f5b9547d7b4464fff246bbce1:VGLK:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:69206016:SH
> > for 5,15,27919
> >         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_acquire begin e 0 0
> >         2018-10-10 14:12:36 11494 [27916]: r3097 leader 42693 owner 66
> > 2 0 dblocks 65:140695692504066:140695692504066:66:2:3805:42693:1,
> >         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_acquire leader
> > 42693 owner 66 2 0 max mbal[65] 140695692504066 our_dblock
> > 140695692434049 140695692434049 49 2 4303 42658
> >         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_acquire leader 42693 free
> >         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase1
> > write mbal 140695692506049
> >         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase1
> > read 48:140695692506049:0:0:0:0:42694:0,
> >         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase2
> > write bal 140695692506049 inp 49 2 11494 q_max -1
> >         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 phase2
> > read 48:140695692506049:140695692506049:49:2:11494:42694:0,
> >         2018-10-10 14:12:36 11494 [27916]: r3097 ballot 42694 commit
> > self owner 49 2 11494
> >         2018-10-10 14:12:36 11494 [27916]: r3097 acquire_disk rv 1
> > lver 42694 at 11494
> >         2018-10-10 14:12:36 11494 [27916]: r3097 write_host_block
> > host_id 49 flags 1 gen 2 dblock
> > 140695692506049:140695692506049:49:2:11494:42694:RELEASED.
> >         2018-10-10 14:12:36 11494 [27916]: r3097 paxos_release leader
> > 42694 owner 49 2 11494
> >         2018-10-10 14:12:36 11494 [27916]: cmd_acquire 5,15,27919
> > result 0 pid_dead 0
> >         2018-10-10 14:12:36 11494 [27917]: cmd_get_lvb ci 6 fd 17
> > result 0 res lvm_b075258f5b9547d7b4464fff246bbce1:VGLK
> >         018-10-10 14:12:36 11494 [27916]: cmd_acquire 5,15,27919 ci_in
> > 5 fd 15 count 1 flags 8
> >         018-10-10 14:12:36 11494 [27916]: s4:r3098 resource
> > lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH
> > for 5,15,27919
> >         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire begin e 0 0
> >         018-10-10 14:12:36 11494 [27916]: r3098 leader 2 owner 19 1
> > 4854717 dblocks
> > 8:29802:510:140245418403952:140245440585933:140245418403840:4:1,48:202556049:0:0:0:0:3:0,65:218746066:0:0:0:0:3:0,79:202874080:0:0:0:0:3:0,
> >         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire leader 2
> > owner 19 1 4854717 max mbal[65] 218746066 our_dblock 202556049 0 0 0 0
> > 3
> >         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire owner 19
> > 1 4854717 host_status 19 2 10914 wait_start 11494
> >         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire owner 19
> > 1 4854717 delta 19 2 10995 mismatch
> >         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire leader 2
> > owner 19 1 4854717
> >         018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 phase1 write
> > mbal 218748049
> >         018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 abort1 larger
> > lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> > our dblock 218748049:0:0:0:0:3
> >         018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 phase1 read
> > 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
> >         018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire 3 retry
> > delay 887122 us
> >         018-10-10 14:12:37 11495 [27916]: r3098 paxos_acquire leader 2
> > owner 19 1 4854717
> >         018-10-10 14:12:37 11495 [27916]: r3098 ballot 3 phase1 write
> > mbal 218750049
> >         018-10-10 14:12:37 11495 [27916]: r3098 ballot 3 abort1 larger
> > lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> > our dblock 218750049:0:0:0:0:3
> >         018-10-10 14:12:37 11495 [27916]: r3098 ballot 3 phase1 read
> > 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
> >         018-10-10 14:12:37 11495 [27916]: r3098 paxos_acquire 3 retry
> > delay 455075 us
> >         018-10-10 14:12:38 11496 [27916]: r3098 paxos_acquire leader 2
> > owner 19 1 4854717
> >         018-10-10 14:12:38 11496 [27916]: r3098 ballot 3 phase1 write
> > mbal 218752049
> >         018-10-10 14:12:38 11496 [27916]: r3098 ballot 3 abort1 larger
> > lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> > our dblock 218752049:0:0:0:0:3
> >         018-10-10 14:12:38 11496 [27916]: r3098 ballot 3 phase1 read
> > 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
> >         018-10-10 14:12:38 11496 [27916]: r3098 paxos_acquire 3 retry
> > delay 904853 us
> >         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20
> > lvm_671bfaeb4e344014b041fc78115307bb
> >         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20 done 2
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20
> > lvm_4c149e7262a64c728997954257bece01
> >         018-10-10 14:12:38 11496 [27917]: cmd_examine 6,20 done 5
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11496 [27917]: set_lockspace_event
> > lvm_671bfaeb4e344014b041fc78115307bb
> >         018-10-10 14:12:38 11496 [27917]: cmd_set_event result 0
> >         018-10-10 14:12:38 11496 [27917]: set_lockspace_event
> > lvm_4c149e7262a64c728997954257bece01
> >         018-10-10 14:12:38 11496 [27917]: cmd_set_event result 0
> >         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20
> > lvm_091c17d096894a179313aad65cb4127a
> >         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20 done 2
> >         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20
> > lvm_b075258f5b9547d7b4464fff246bbce1
> >         018-10-10 14:12:38 11497 [27917]: cmd_examine 6,20 done 3
> >         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11497 [27918]: examine_token rv 1 lver 0 mode 0
> >         018-10-10 14:12:38 11497 [27917]: set_lockspace_event
> > lvm_091c17d096894a179313aad65cb4127a
> >         018-10-10 14:12:38 11497 [27917]: cmd_set_event result 0
> >         018-10-10 14:12:38 11497 [27917]: set_lockspace_event
> > lvm_b075258f5b9547d7b4464fff246bbce1
> >         018-10-10 14:12:38 11497 [27917]: cmd_set_event result 0
> >         018-10-10 14:12:39 11497 [27916]: r3098 paxos_acquire leader 2
> > owner 19 1 4854717
> >         018-10-10 14:12:39 11497 [27916]: r3098 ballot 3 phase1 write
> > mbal 218754049
> >         018-10-10 14:12:39 11497 [27916]: r3098 ballot 3 abort1 larger
> > lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> > our dblock 218754049:0:0:0:0:3
> >         018-10-10 14:12:39 11497 [27916]: r3098 ballot 3 phase1 read
> > 18:29802:510:140245418403952:140245440585933:140245418403840:4:1,
> >         018-10-10 14:12:39 11497 [27916]: r3098 paxos_acquire 3 retry
> > delay 981162 us
> >         018-10-10 14:12:40 11498 [27916]: r3098 paxos_acquire leader 2
> > owner 19 1 4854717
> >
> > This is confusing to me, what means "ballot 3 abort1 larger lver in
> > bk" and what causes this?
> > Seems related to the bug I reported that io timeout when release vg
> > lock causes problems?
> >
> > Besides, I found there are some hosts has different sanlock io timeout
> > than others, is this the root cause?
> >
> > Thanks,
> > Damon
