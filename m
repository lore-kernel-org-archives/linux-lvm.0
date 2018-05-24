Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4286B941E4
	for <linux-lvm@redhat.com>; Thu, 24 May 2018 14:44:17 +0000 (UTC)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB4383325FCC
	for <linux-lvm@redhat.com>; Thu, 24 May 2018 14:44:06 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id t1-v6so2225090oth.8
	for <linux-lvm@redhat.com>; Thu, 24 May 2018 07:44:06 -0700 (PDT)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Thu, 24 May 2018 22:44:05 +0800
Message-ID: <CABZYMH5Ucj3Nm_FOtJ_+TZS+Q_iXOsJ_k5H4ZSoeX_teqPV6ww@mail.gmail.com>
Subject: [linux-lvm] [lvmlockd] "VGLK res_unlock lm error -250" and lvm
	command hung forever
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

Hi all,

I'm using lvmlockd + sanlock on iSCSI, and sometimes (usually
intensive operations), it shows vglock is failed:

/var/log/messages:

    May 24 21:14:29 dev1 sanlock[1108]: 2018-05-24 21:14:29 605471
[1112]: r627 paxos_release 8255 other lver 8258
    May 24 21:14:29 dev1 sanlock[1108]: 2018-05-24 21:14:29 605471
[1112]: r627 release_token release leader -250
    May 24 21:14:29 dev1 lvmlockd[1061]: 1527167669 S
lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK unlock_san release error
-250
    May 24 21:14:29 dev1 lvmlockd[1061]: 1527167669 S
lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK res_unlock lm error -250
    May 24 21:14:29 dev1 lvmlockd[1061]: 1527167669 S
lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK unlock_san release error
-1
    May 24 21:14:29 dev1 lvmlockd[1061]: 1527167669 S
lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK res_unlock lm error -1
    May 24 21:14:29 dev1 sanlock[1108]: 2018-05-24 21:14:29 605471
[1111]: cmd_release 2,9,1061 no resource VGLK


meanwhile lvmlockctl -d:

    1527167668 close lvchange[34042] cl 476 fd 9
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK res_lock
rv 0 read vb 101 0 1761
    1527167669 send lvcreate[34073] cl 478 lock vg rv 0
    1527167669 recv lvcreate[34073] cl 478 find_free_lock vg
"ff35ecc8217543e0a5be9cbe935ffc84" mode iv flags 0
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 find free lock
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84
find_free_lock_san found unused area at 127926272
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 find free lock 0
offset 127926272
    1527167669 send lvcreate[34073] cl 478 find_free_lock vg rv 0
    1527167669 recv lvcreate[34073] cl 478 init lv
"ff35ecc8217543e0a5be9cbe935ffc84" mode iv flags 0
    1527167669 work init_lv
ff35ecc8217543e0a5be9cbe935ffc84/c0dda9c02a7347a098203fbe2a7df1d0 uuid
Wnj8vm-2Hiy-gdqs-Uh1i-fUiA-W3mj-zdASzK
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 init_lv_san
Wnj8vm-2Hiy-gdqs-Uh1i-fUiA-W3mj-zdASzK found unused area at 127926272
    1527167669 send lvcreate[34073] cl 478 init lv rv 0 vg_args
1.0.0:lvmlock lv_args 1.0.0:127926272
    1527167669 recv lvcreate[34073] cl 478 update vg
"ff35ecc8217543e0a5be9cbe935ffc84" mode iv flags 0
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK action update iv
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
res_update cl 478 lk version to 1762
    1527167669 send lvcreate[34073] cl 478 update vg rv 0
    1527167669 recv lvcreate[34073] cl 478 lock lv
"ff35ecc8217543e0a5be9cbe935ffc84" mode un flags 1
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R
Wnj8vm-2Hiy-gdqs-Uh1i-fUiA-W3mj-zdASzK action lock un
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R
Wnj8vm-2Hiy-gdqs-Uh1i-fUiA-W3mj-zdASzK res_unlock cl 478 no locks
    1527167669 send lvcreate[34073] cl 478 lock lv rv -2
    1527167669 recv lvcreate[34073] cl 478 lock vg
"ff35ecc8217543e0a5be9cbe935ffc84" mode un flags 0
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK action lock un
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK res_unlock cl 478
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
res_unlock r_version new 1762
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
unlock_san ex r_version 1762 flags 0
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
unlock_san set r_version 1762
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
unlock_san release error -250
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
res_unlock lm error -250
    1527167669 send lvcreate[34073] cl 478 lock vg rv -250
    1527167669 close lvcreate[34073] cl 478 fd 11
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
res_unlock cl 478 from close
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
unlock_san ex r_version 0 flags 0
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
unlock_san release error -1
    1527167669 S lvm_ff35ecc8217543e0a5be9cbe935ffc84 R VGLK
res_unlock lm error -1
    1527167670 new cl 479 pi 2 fd 9


and then any lvm related commands will hung:

    [root@dev1 ~]# lvmlockctl -i
    VG ff35ecc8217543e0a5be9cbe935ffc84 lock_type=sanlock
Nz4PmR-Bwfi-pItr-C3om-Ewnj-SICA-5rFuFg
    LS sanlock lvm_ff35ecc8217543e0a5be9cbe935ffc84
    LK VG ex ver 1762 pid 0 ()
    LW VG sh ver 0 pid 34216 (lvchange)
    LW VG sh ver 0 pid 75685 (lvs)
    LW VG sh ver 0 pid 83741 (lvdisplay)
    LW VG sh ver 0 pid 90569 (lvchange)
    LW VG sh ver 0 pid 92735 (lvchange)
    LW VG sh ver 0 pid 99982 (lvs)
    LW VG sh ver 0 pid 14069 (lvchange)
    LK LV sh onuPlt-YXI0-nYtv-CV8Q-yS93-6Zt9-QvlfyH
    LK GL sh ver 0 pid 75685 (lvs)
    LK GL sh ver 0 pid 99982 (lvs)
    LK LV un XOgw6I-3Nuh-ejIP-ydPq-rr7g-LMjb-oklfup

My questions are:

1. why VGLK failed, is it because network failure(cause iSCSI fail and
sanlock could not find VGLK volume), can I find a direct proof?
2. Is it recoverable? I have tried kill all hung commands but new
command still hung forever.

Thanks a lot,
Damon
