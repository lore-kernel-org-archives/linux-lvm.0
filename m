Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6608231C9F
	for <linux-lvm@lists.linux.dev>; Sat, 11 Apr 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909507; cv=pass; b=bwQpZ7OAVkNnBoFhjx6Q+XFVs01+jlf4Xc4i0dhpq2Ww9C8ohMFQxOsyj6iGNrDXnJHEVaYScYACGqftbteqFYlLmqJpmZ8lKKYy2l/Sm8EJ0j6GzIMx3WgQleyZ/RqDnbHkxPRyjJ3aXfCVGKU+bM1N++rYMzZpOIO8zBkJq2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909507; c=relaxed/simple;
	bh=VuKcgusEfm9C0e2m67f0aE2dAwn/LolTIMrqSgjAahE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=M66VhuoT0pc/o9dHO92CS9INAXh9Er92hYzoPjxhgn5Ls40przhRdK3YzlZi0VAWLZnOZ+QYqSl5X1S8hyxS36wNjKoJVPO+eth0IC8+FtRP2ewwnYofDJL80tStY1+6SMcKPba7gYvYnQHWMCVz9bnGTe5Bn/ljHFSYlaZhq6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Hqn20WsN; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Hqn20WsN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b24fdac394so26676955ad.3
        for <linux-lvm@lists.linux.dev>; Sat, 11 Apr 2026 05:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775909505; cv=none;
        d=google.com; s=arc-20240605;
        b=dLtMuvBJNPt6H3O4lGoOZlcthSO2P4pU7q84JZWsZR66TCsmEW3BvaRa2O/vVhXeLJ
         HOytNoR4Ig0rmUaPG0c9Mh7nJpdr8KlP3j0zrRPMgayW0Ry2yl58DxubXKBQGc6iSRQd
         4mTaOq0ei0MPAqnHPa4GMjIcF9i+8DjAXJjCXMumn9wbVcnahNZco+KHocc2IPNwJs/P
         6mM4HgIHvcyV6QZ/D33PS0T6CB/3pp/pnMvXrcRi0hl6dYm/ft2ckywk/xnK+K1z0+Hi
         kjS4+AH/bSupxHg6dZa3TJnxhuF+rzCIxUyjY5241paowmkhIzGT//S/YZFddBBXbUtB
         lmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=YL22O443bIEh9I31MKaTgjxDSnFndKCDFfYNtWqw90M=;
        fh=iQOWxowsu+faQgcWO2V4Hll1LFv7Q5iitXvpXh+DqLU=;
        b=B6+jmftu3ZajpSW5whF2NUmuqFQTMa93jLw5r6bSPdG/Cp1vhSkO4ldKh0+hgYeQN7
         1VrpUHcEXfNfYh0acPopG+JDfneYFp9u5qlB7TtZCz81bx8piVX1MIHwQlhAIrkt4mM4
         I2izAIPFu2A0ev0ACLt6EGOdvdId/eRXX3iN6OjlsmOD4Z/sAN1ofjveMQ6BkhCFj6rP
         ZUG7s/X6PzzaokPb/i4ndqSWXs+awPZMUF7NS5zW+frI25M3zq24ILt9Z9QAjCyTFAwz
         s0cWJPhGu3+ACXK+8KDr2f+nMpq05O3Pc+8Yb4FkO+Ju6VJtxxxdwpFnVQsqLhGRfV15
         7Wig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1775909505; x=1776514305; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YL22O443bIEh9I31MKaTgjxDSnFndKCDFfYNtWqw90M=;
        b=Hqn20WsN5Ge5S5kXbyhM5b/h4DCWc3Ztzm20NgfXz0boObrG/3pBlkPgAiDDC7uOh0
         /RtpKl5vWRQ1OFoMAfhV+CUuO3z0wRzXC1fFJdbntCP4u1HTXygdRzs+L48o1X/u4ond
         DL8pMmHzVaby7cp72bLAXlSEll/VXQQxtygm04PcWNQi1R/Kq4muJSMTdVKb3ixaquNY
         34nk5BsqCFfKcm+wjoXpN5nFwiXlO/1M31MOBVjIT33W51ZOZdrJ0JEw5tmtXleyG+p4
         vJEYPhsd6Tlm+Rk96U/Ba7Tb9wvKPJhaK3IecSklA/hs/+WO9PXxUQC8/7TIQ6H1c3jk
         orUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909505; x=1776514305;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL22O443bIEh9I31MKaTgjxDSnFndKCDFfYNtWqw90M=;
        b=sU7HAYDh5YE5vGTUCdmkfB5Rcztc+umJOjrTVuEJKNCSA+h77AAmMHDz65UauaVBZt
         ISvCueJzhUes0JFyNU/l2XKsGbJLvVgwK+bReutMP2CQCMjAoA55rgCgxbQdMMY5glXc
         x576ty39UAxVNCxbG+m1eJZpww/ALSL7aqEMErE+F3m++3ieFNVH1u+pk95dx1M8d9vB
         fplQ1Iruzc6Ed6+csX4BY7WUxYUacrFRXLkuZ733RSyizpzt0ksGgtZ9S+tphrU+M/OH
         exJ0DgsWhde2+vx7i7mf46MpJmt2u/9fLHEl74sN/WabZyjD6SH2xckhxInHDI5E2Rx7
         EIaA==
X-Gm-Message-State: AOJu0Yw3eoULeUpsFpndkpKr5p4BN++YBbIWceEyVAXDw8k3Ut0HHL8X
	LuM7gnW6uvNM01ZfvXhknG/36EGEwjp5ZRPYKyyLOuiZs6ShYeZRNBc6RK3zwxKmCaKqfSmGHVc
	GrxJ8SlMGQU8SytBkA31UF5GW7fj/tz9+JXoU0Sl9Qc7KOqkurj3ZFAkKyg==
X-Gm-Gg: AeBDievo2XOX/NFCY7yfkJSLMMdkmeI19gD0GInoEGHrznBbKCOcEHuQFxiLH852VzL
	Y/cN92ohJf7I8uA9p6cEKPuQu6V2mU2OPscA0g4q7moJPbmIzSBolhqFc0gMmmAk4KxagwBJiyD
	Bd/17TYAXkHfQIvLor0WBppBr5AGU7KSNFQUmVBeUzlpUgHFF0NPqtPtIsFEdGwy5RFLY5nAj5G
	xW08DFAai1jPNozX35Nrz5ljuu1rjZqVfWw5bebJyRdIApz8JyOlseeF6j1opAPnYP2rFi3ceGA
	hauiVQ==
X-Received: by 2002:a17:903:4b46:b0:2b0:6f21:8289 with SMTP id
 d9443c01a7336-2b2d5a45fe2mr74146525ad.25.1775909504643; Sat, 11 Apr 2026
 05:11:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lakshmi Narasimhan Sundararajan <lsundararajan@purestorage.com>
Date: Sat, 11 Apr 2026 17:41:28 +0530
X-Gm-Features: AQROBzCtRItGDcW1CP6R-wHf5b1bnltwq7bawJzBrn7hp8pwo63OYxRO-M1bQS0
Message-ID: <CAFe+wq3EXW0n_bLCri0zC2zVQK987D3x5LY+GiOpaLsgZxk4Rw@mail.gmail.com>
Subject: Reg dm thin pool metadata inconsistency
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi LVM Team! A very good day to you all.
[ I hope this email is the right one now]

I recently experienced an outage where thin pool activation failed,
details are as follows.
Good news is, I was able to recover the pool through thin_repair.
Thank goodness!

There was no infra induced failure i.e. no network, disk, usage over
limit, memory or compute being faulty orover used in any way.
Node was running healthy for 13 days and suddenly hit this issue.
Pool would handle I/O load (including discards), new volume
creation/deletion, and other regular activities.

I tried to identify if there is a direct known issue, but I was unable to.
This generally seems to be some known issue, but I am unable to find a
direct link with the same signature.

a) how to induce thin pool failures at will, so thin pool does not
activate, but repair succeeds, so  I can test this recovery in some
controlled form.
b) To your best knowledge this seems a known issue and fixed in a later rel=
ease?
I did my search at both kernel bugzilla and RHEL - and I am hoping you
can help me find it. Internet searches point to errata pages, but I am
unable to find the
exact ticket, commit that address this. The OCP platform was running a
recent release from RHEL.
Linux kernel: 5.14.0-427.109.1.el9_4 RHEL 9.4 This is likely 2 years old th=
ough.

c) After spending some time reviewing thin code and the commits since
the mentioned
kernel from kernel.org linux.. I suspect it could be a race with
discard and either IO or device creation/deletion on the same pool
could cause this?
Could the authors here, please confirm my code reading below.
```
*** phase 1 - userspace issues blkdiscard on thin volumes ***
  dm-thin.c : thin_bio_map()
    =E2=86=92 detects REQ_OP_DISCARD
    =E2=86=92 thin_defer_bio_with_throttle(tc, bio)
      =E2=86=92 adds bio to tc->deferred_bio_list        // QUEUED, not pro=
cessed
      =E2=86=92 wakes pool worker thread

  dm-thin.c : do_worker()                         // runs ASYNCHRONOUSLY
    =E2=86=92 process_deferred_bios()
      =E2=86=92 process_thin_deferred_bios()
        =E2=86=92 process_discard_bio()
          =E2=86=92 creates mapping, adds to pool->prepared_discards
    =E2=86=92 process_prepared(pool->prepared_discards)
      =E2=86=92 process_prepared_discard_no_passdown(m):
        =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
            [dm-thin-metadata.c]
          =E2=86=92 dm_btree_remove_leaves()
              [dm-btree-remove.c]
            =E2=86=92 data_block_dec()                    // for each data =
block
                [dm-thin-metadata.c]
              =E2=86=92 dm_sm_dec_blocks()                // DECREMENTS ref=
count
                  [dm-space-map-common.c]

***  phase 2: these steps still be IN PROGRESS or QUEUED when
userspace deletes the thin volume ***

  dm-thin.c : thin_dtr()                          // dmsetup remove
    =E2=86=92 list_del_rcu(&tc->list)                     // removes from
                                                  //   pool->active_thins
    =E2=86=92 synchronize_rcu()
    =E2=86=92 dm_pool_close_thin_device(tc->td)           // open_count--
    =E2=86=92 kfree(tc)                                   // tc FREED

    *** does NOT flush pool workqueue ***          =E2=86=90 GAP 1
    *** does NOT drain prepared_discards ***       =E2=86=90 GAP 2

  dm-thin.c : process_delete_mesg()               // dmsetup message
    =E2=86=92 dm_pool_delete_thin_device(pool->pmd, dev_id)
        [dm-thin-metadata.c : __delete_device()]
      =E2=86=92 dm_btree_remove(&pmd->tl_info, ...)       // remove from to=
p-level
          [dm-btree-remove.c]                      //   btree
        =E2=86=92 subtree_dec()                            // cascades into=
:
            [dm-thin-metadata.c]
          =E2=86=92 dm_btree_del()                         // walks ALL lea=
ves
              [dm-btree.c]
            =E2=86=92 data_block_dec() for EVERY remaining block
                [dm-thin-metadata.c]
              =E2=86=92 dm_sm_dec_blocks()                 // DECREMENTS re=
fcount
                  [dm-space-map-common.c]          //   for ALL blocks

** phase 3: KERNEL (worker thread =E2=80=94 still running from Phase 1) ***
  dm-thin.c : do_worker()                         // ASYNC, still running
    =E2=86=92 process_prepared(pool->prepared_discards)
      =E2=86=92 process_prepared_discard_no_passdown(m):
        =E2=86=92 m->tc points to FREED tc                // =E2=86=90 use-=
after-free risk
        =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
            [dm-thin-metadata.c]
          =E2=86=92 dm_btree_remove_leaves()
              [dm-btree-remove.c]
            =E2=86=92 data_block_dec()                    // SAME blocks al=
ready
                [dm-thin-metadata.c]              //   decremented in
              =E2=86=92 dm_sm_dec_blocks()                //   Phase 2!
                  [dm-space-map-common.c]

                =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
                  sm_ll_dec_bitmap():
                    old =3D sm_lookup_bitmap(ic->bitmap, bit);
                    switch (old) {
                    case 0:  // =E2=86=90 refcount ALREADY 0
                      DMERR("unable to decrement block");
                      return -EINVAL;  // -22
                    }
                                 [dm-space-map-common.c]
                =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98

                          =E2=96=BC
                dm_tm_shadow_block() fails (corrupted space map)
                    [dm-transaction-manager.c]

                          =E2=96=BC
                dm_pool_inc_data_range() fails with -EINVAL (-22)
                    [dm-thin-metadata.c]

                          =E2=96=BC
                metadata_operation_failed(pool, "dm_pool_inc_data_range")
                    [dm-thin.c]

                          =E2=96=BC
                set_pool_mode(pool, PM_READ_ONLY)
                    [dm-thin.c]

                *** POOL IS NOW DEAD ***
```



As always, many thanks for your help.


# issue unable to activate thin pool
```
[Wed Apr  8 17:05:14 2026] device-mapper: space map common: unable to
decrement block
[Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
decrement block
[Wed Apr  8 17:08:11 2026] device-mapper: space map common:
dm_tm_shadow_block() failed
[Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
decrement block
[Wed Apr  8 17:08:11 2026] device-mapper: space map common:
dm_tm_shadow_block() failed
[Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
decrement block
[Wed Apr  8 17:08:11 2026] device-mapper: space map common:
dm_tm_shadow_block() failed
[Wed Apr  8 17:08:31 2026] device-mapper: space map common: unable to
decrement block
[Wed Apr  8 17:08:31 2026] device-mapper: space map common:
dm_tm_shadow_block() failed
[Wed Apr  8 17:08:31 2026] device-mapper: space map common: unable to
decrement block
[Wed Apr  8 17:08:31 2026] device-mapper: space map common:
dm_tm_shadow_block() failed
```

# host and lvm tools version
```
uname -a
Linux kernel: 5.14.0-427.109.1.el9_4
RHEL 9.4

lvm version
2.03.23(2) (2023-11-21)
library: 1.02.197 (2023-11-21)
driver: 4.48.1
```

Below are references to the node block layer.
There was IO, thin volume creations and deletions, IO includes discards too=
.
```
[root@root core]# lvs -a pwx1
  Please remove the lvm.conf global_filter, it is ignored with the devices =
file.
  LV                  VG   Attr       LSize   Pool   Origin
  Data%  Meta%  Move Log Cpy%Sync Convert
  1004123733318649769 pwx1 Vwi-a-t---  50.00g pxpool 660563940592999863  0.=
25
  103699400925372609  pwx1 Vwi-a-t--- 750.00g pxpool 1115712468847455249 59=
.75
  1072608604746349133 pwx1 Vwi-a-t---  50.00g pxpool 941788757364603035  0.=
25
  1115712468847455249 pwx1 Vwi-aot--- 750.00g pxpool                     59=
.75
  1138695541641144166 pwx1 Vwi-a-t---  50.00g pxpool 941788757364603035  0.=
25
  136169780918964477  pwx1 Vwi-aot---  30.00g pxpool                     33=
.33
  218651423266852202  pwx1 Vwi-aot---   5.00g pxpool                     3.=
49
  404947242154831849  pwx1 Vwi-aot---   5.00g pxpool                     4.=
20
  440731835552948333  pwx1 Vwi-aot---  50.00g pxpool                     5.=
59
  462681831690737818  pwx1 Vwi-a-t---  50.00g pxpool 73089959772282964   0.=
25
  519898065353250833  pwx1 Vwi-a-t---  50.00g pxpool 660563940592999863  0.=
25
  527922274169222783  pwx1 Vwi-aot--- 200.00g pxpool                     28=
.64
  537994915504805835  pwx1 Vwi-aot---  50.00g pxpool                     10=
.88
  569690966828279529  pwx1 Vwi-a-t--- 750.00g pxpool 1115712468847455249 59=
.75
  594992999737145586  pwx1 Vwi-aot--- 200.00g pxpool                     28=
.91
  660563940592999863  pwx1 Vwi-aot---  50.00g pxpool                     0.=
25
  702358223003836192  pwx1 Vwi-aot--- 200.00g pxpool                     28=
.64
  73089959772282964   pwx1 Vwi-aot---  50.00g pxpool                     0.=
25
  793515512579595979  pwx1 Vwi-aot---  30.00g pxpool                     33=
.33
  79731196567060146   pwx1 Vwi-aot---  50.00g pxpool                     10=
.90
  865397616123963982  pwx1 Vwi-aot---  50.00g pxpool                     9.=
39
  866802183893693297  pwx1 Vwi-aot--- 200.00g pxpool                     28=
.91
  941788757364603035  pwx1 Vwi-aot---  50.00g pxpool                     0.=
25
  960350716126095496  pwx1 Vwi-a-t---  50.00g pxpool 73089959772282964   0.=
25
  [lvol0_pmspare]     pwx1 ewi-------   2.00g
  pxMetaFS            pwx1 Vwi-aot---  64.00g pxpool                     0.=
05
  pxpool              pwx1 twi-aot---   1.54t
  43.59  5.06 <<< very low tmeta util.
  [pxpool_tdata]      pwx1 Twi-ao----   1.54t
  [pxpool_tmeta]      pwx1 ewi-ao----   4.00g
  pxreserve           pwx1 -wi------k  15.00g
[root@root core]#
[root@root core]# vgs pwx1
  Please remove the lvm.conf global_filter, it is ignored with the devices =
file.
  VG   #PV #LV #SN Attr   VSize VFree
  pwx1   1  27   0 wz--n- 1.56t    0
[root@root core]# lsblk -s /dev/pwx1/1004123733318649769
NAME                                         MAJ:MIN RM  SIZE RO TYPE
MOUNTPOINTS
pwx1-1004123733318649769                     253:107  0   50G  0 lvm
=E2=94=94=E2=94=80pwx1-pxpool-tpool                          253:14   0  1.=
5T  0 lvm
  =E2=94=9C=E2=94=80pwx1-pxpool_tmeta                        253:12   0    =
4G  0 lvm
  =E2=94=82 =E2=94=94=E2=94=80md126                                    9:12=
6  0  1.6T  0 raid0
  =E2=94=82   =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 253:10=
   0  1.6T  0 mpath
  =E2=94=82     =E2=94=9C=E2=94=80nvme4n2                            259:5 =
   0  1.6T  0 disk
  =E2=94=82     =E2=94=9C=E2=94=80nvme5n2                            259:8 =
   0  1.6T  0 disk
  =E2=94=82     =E2=94=94=E2=94=80nvme6n2                            259:11=
   0  1.6T  0 disk
  =E2=94=94=E2=94=80pwx1-pxpool_tdata                        253:13   0  1.=
5T  0 lvm
    =E2=94=94=E2=94=80md126                                    9:126  0  1.=
6T  0 raid0
      =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 253:10   0  1.=
6T  0 mpath
        =E2=94=9C=E2=94=80nvme4n2                            259:5    0  1.=
6T  0 disk
        =E2=94=9C=E2=94=80nvme5n2                            259:8    0  1.=
6T  0 disk
        =E2=94=94=E2=94=80nvme6n2                            259:11   0  1.=
6T  0 disk
[root@root core]# ls -al /dev/md/pwx1
lrwxrwxrwx. 1 root root 8 Apr 11 11:48 /dev/md/pwx1 -> ../md126
[root@root core]# dmsetup table /dev/mapper/pwx1-pxpool-tpool
0 3311132672 thin-pool 253:12 253:13 128 0 2 skip_block_zeroing
[root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tdata
0 1008459776 linear 9:126 35653632
1008459776 629145600 linear 9:126 1048307712
1637605376 1673527296 linear 9:126 1681647616
[root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tmeta
0 4194304 linear 9:126 1044113408
4194304 4194304 linear 9:126 1677453312
[root@root core]#
[root@root core]# dmsetup table --target multipath
3500a07513c1e23c4: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:16 1=
 1
3500a07513c1e2ade: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:64 1=
 1
3500a07513c1e2ca8: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:80 1=
 1
3500a07513c1e2cf3: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:0 1 =
1
3500a07513c1e3afc: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:48 1=
 1
eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 0 0 1 1
service-time 0 1 2 259:2 1 1
eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 0 0 1 1
service-time 0 1 2 259:0 1 1
eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 0 0 1 1
service-time 0 1 2 259:3 1 1
eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 0 0 1 1
service-time 0 1 2 259:1 1 1
eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 3
retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
259:4 1 259:7 1 259:10 1
eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 3
retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
259:5 1 259:8 1 259:11 1
eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 3
retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
259:6 1 259:9 1 259:12 1
[root@root core]# dmsetup status --target multipath
3500a07513c1e23c4: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:16 A 0 0 1
3500a07513c1e2ade: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:64 A 0 0 1
3500a07513c1e2ca8: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:80 A 0 0 1
3500a07513c1e2cf3: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:0 A 0 0 1
3500a07513c1e3afc: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:48 A 0 0 1
eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 2 0 0 0 1
1 A 0 1 2 259:2 A 0 0 1
eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 2 0 0 0 1
1 A 0 1 2 259:0 A 0 0 1
eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 2 0 0 0 1
1 A 0 1 2 259:3 A 0 0 1
eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 2 0 0 0 1
1 A 0 1 2 259:1 A 0 0 1
eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 2 0 0 0
1 1 A 0 3 1 259:4 A 1 22 259:7 A 1 21 259:10 A 1 22
eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 2 0 0 0 1
1 A 0 3 1 259:5 A 1 4 259:8 A 1 6 259:11 A 1 11
eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 2 0 0 0 1
1 A 0 3 1 259:6 A 1 0 259:9 A 1 0 259:12 A 1 0
[root@root core]#
[root@root core]# mdadm -D /dev/md/pwx1
/dev/md/pwx1:
           Version : 1.2
     Creation Time : Tue Mar 17 15:29:31 2026
        Raid Level : raid0
        Array Size : 1677589504 (1599.87 GiB 1717.85 GB)
      Raid Devices : 1
     Total Devices : 1
       Persistence : Superblock is persistent

       Update Time : Mon Mar 23 20:52:51 2026
             State : clean
    Active Devices : 1
   Working Devices : 1
    Failed Devices : 0
     Spare Devices : 0

        Chunk Size : 1024K

Consistency Policy : none

              Name : any:pwx1
              UUID : 1716a351:ed3e53e7:0ce83ccd:8d3a3021
            Events : 16

    Number   Major   Minor   RaidDevice State
       0     253       10        0      active sync   /dev/dm-10
[root@root core]#
```
