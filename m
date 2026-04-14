Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE863939B0
	for <linux-lvm@lists.linux.dev>; Tue, 14 Apr 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166025; cv=none; b=VtXpxHqOy7zEW6FvjiQroweVuUKGhNbzZii/Kk6sLTjbDlc1gBFABrvrm0PeuOpI4kchnYin7GKRzemnMperT4aCHpf4AJXebRUi9uAhVXfylA6zyazxQeiJQplZskickrGU/l2z+1cmifC0PtuNxO4ouRk7Izaqh97BQnkxLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166025; c=relaxed/simple;
	bh=uur+k56RblgnL0rqqxqL+tVbNfyrMqq0J5STKVfMrjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=QeAgzsjLn2cj6t7HWgdYnsG/eR3TbFkxfT43MaCMhuc3sDofqFppns8O0XL8ShBhzbKDIPkLVe5GF61kkYUMOXXId8mctv0+QTpF0XQ29Tv+AUkw4v02GYYnl3szWX0WuayNbd6tenrYHrXAlR+/U/a/BXnIGuqti7uMWjOmjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qc3mxhYQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qc3mxhYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776166022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRTlpr0fSopAYAimF+9qKPmU+bcGrh3i9W7MaxVTIq0=;
	b=Qc3mxhYQlsOLGH5fSxiVoCRm+/9tGPwJju74SyoGxRfJPpwx3eXk3zAAsK9LzwYDx3UnUn
	0vOH9fSZ7KWdNF56sjKQraw0kxsAlWbm+x6HBPVINWhT3oFFz3rvZbpkSNJz4xPHZ8vAk8
	Qukm/Q8eflKWTJkpYUiKppB1fTIMmk8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-Xri_PBDIM9OehmjGLeTzmg-1; Tue, 14 Apr 2026 07:27:00 -0400
X-MC-Unique: Xri_PBDIM9OehmjGLeTzmg-1
X-Mimecast-MFC-AGG-ID: Xri_PBDIM9OehmjGLeTzmg_1776166019
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-38e83f0482eso9419861fa.3
        for <linux-lvm@lists.linux.dev>; Tue, 14 Apr 2026 04:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166019; x=1776770819;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRTlpr0fSopAYAimF+9qKPmU+bcGrh3i9W7MaxVTIq0=;
        b=HtSo3EXe46uRTnPke4p4GvLpN8aF7ebrrASKDHF5zyZc9LTqWrTfwJTeWjIlhKuZnx
         cCOwnzHBhyw4urWmzB8DeErkpJ4xH9xyFd4juA+gSMn7OqwcBENNSgcW5qmt15jUu2oI
         MPQsNryk8KT9T2CMQQfjk9BH+x//x3xC5SCO83erfZkiL6M8OU9W2VB4dBpCHxLzzjp8
         WyRXIaNNWRl8Ov0TdxR/lVjuaBZ6gR+gL62FQkD7sMg6wA0BExJCzFOQYEwkkfTNvBKm
         Qykt6+hTe55Guyfh1y7yftVTDoSPoBYHCPxCFzw8FGO49CXGWyDnXOrAD1yX7OXEiNFa
         J1NQ==
X-Gm-Message-State: AOJu0YxQaQDCBv493y6S8dCmt46ALvVdgeCtQA3Wwe1wDu+w4fg4Mdja
	mgB+g8g9tlE2WzewvMYAr3xJQClAGjN5L2zaD2tEPoU1siOhgIN/vkQO2QOEkTdqMgbvRSjR6nL
	fyq4g2deajOQ6kcmyYcFLL79uFfQTJ6UeUhcc6eOTCx7LVodAsAm3AbXTRc/mvyQ7Q3H2EHUJ+8
	DivbbJ7z9OdvsqbP3OwZxDXguP0UhDEJ/P2oWyCkcVMXyOEA==
X-Gm-Gg: AeBDiesLmgaGeY+kpSJ45CQhLTqUFb5eBKY6WTxakq476a5HD5mw5yK5og57p7rIyXH
	GcT5ldNbFHyYWVIiIJCcY5zzjRFFZGUKH9a46qQJn7gGOqZ+e95UY0m3eIx2ij2rjJSp5jPAoKL
	XSQkViY5R8yQa+KjRY8fwOEfLFCprBdcm1A5T3vJaK97PGNBOz5wbuCq0ZXMSL5AdFmILJuAU3j
	r7v
X-Received: by 2002:a05:651c:3259:b0:38e:2aa7:398f with SMTP id 38308e7fff4ca-38e4be1467fmr49924061fa.7.1776166018594;
        Tue, 14 Apr 2026 04:26:58 -0700 (PDT)
X-Received: by 2002:a05:651c:3259:b0:38e:2aa7:398f with SMTP id
 38308e7fff4ca-38e4be1467fmr49923851fa.7.1776166017864; Tue, 14 Apr 2026
 04:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFe+wq3EXW0n_bLCri0zC2zVQK987D3x5LY+GiOpaLsgZxk4Rw@mail.gmail.com>
 <CAFe+wq1RNJiiaak5dJycDsRBZ08ga1YQGYh4QTS9mV353YPLmw@mail.gmail.com>
In-Reply-To: <CAFe+wq1RNJiiaak5dJycDsRBZ08ga1YQGYh4QTS9mV353YPLmw@mail.gmail.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Tue, 14 Apr 2026 19:26:45 +0800
X-Gm-Features: AQROBzB5oy_sDXsX99e2ChSqWsXhdKdd28hFgwyqr9nS8RBW5eCPwi-GY5Y2IBA
Message-ID: <CALjSBEurs6mNvR1YdoF-UVEjJUpycahcOxU2Ok6YYh-jBJNwKw@mail.gmail.com>
Subject: Re: Reg dm thin pool metadata inconsistency
To: linux-lvm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Oi9ShurIkPb3qQJVVQuLRNa0bnj6D5AiQ6ceWVkkh8_1776166019
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have two questions posted inline.

On Tue, Apr 14, 2026 at 1:59=E2=80=AFAM Lakshmi Narasimhan Sundararajan
<lsundararajan@purestorage.com> wrote:
>
> Good day!
>
> A gentle ping to hear an update from the authors here. More updates inlin=
e.
>
> On Sat, Apr 11, 2026 at 5:41=E2=80=AFPM Lakshmi Narasimhan Sundararajan
> <lsundararajan@purestorage.com> wrote:
> >
> > Hi LVM Team! A very good day to you all.
> > [ I hope this email is the right one now]
> >
> > I recently experienced an outage where thin pool activation failed,
> > details are as follows.
> > Good news is, I was able to recover the pool through thin_repair.
> > Thank goodness!
> >
> > There was no infra induced failure i.e. no network, disk, usage over
> > limit, memory or compute being faulty orover used in any way.
> > Node was running healthy for 13 days and suddenly hit this issue.
> > Pool would handle I/O load (including discards), new volume
> > creation/deletion, and other regular activities.
> >
> > I tried to identify if there is a direct known issue, but I was unable =
to.
> > This generally seems to be some known issue, but I am unable to find a
> > direct link with the same signature.
> >
> > a) how to induce thin pool failures at will, so thin pool does not
> > activate, but repair succeeds, so  I can test this recovery in some
> > controlled form.
>
> I have found a way, I think I can pull out the metadata xml and modify
> highest transaction and rewrite the metadata and swap the pool to
> recreate this condition.
> pool activation will fail and thin_repair can correct it. Any easier
> way that my suggestion, please feel free to suggest.

Were you able to reproduce the issue on your end? I'm concerned that
using metadata rebuilt from XML might not trigger the bug because the
rebuilt layout differs from the original.

Could you please provide the raw metadata image prior to any repairs?
This will allow us to investigate the issue further.


> > b) To your best knowledge this seems a known issue and fixed in a later=
 release?
> > I did my search at both kernel bugzilla and RHEL - and I am hoping you
> > can help me find it. Internet searches point to errata pages, but I am
> > unable to find the
> > exact ticket, commit that address this. The OCP platform was running a
> > recent release from RHEL.
> > Linux kernel: 5.14.0-427.109.1.el9_4 RHEL 9.4 This is likely 2 years ol=
d though.
>
> So far I and my team have not been able to reproduce this issue, and
> look to your help confirming whether
> a) is this known already and is fixed!
> b) whats the safest kernel to upgrade to?
> c) still an open issue!
>
> >
> > c) After spending some time reviewing thin code and the commits since
> > the mentioned
> > kernel from kernel.org linux.. I suspect it could be a race with
> > discard and either IO or device creation/deletion on the same pool
> > could cause this?
> > Could the authors here, please confirm my code reading below.
> > ```
>
> As mentioned we tried a focussed reproducer around this, but unable to
> trigger the issue.
> There are volume creation/deletions, snapshot creations and deletions,
> discards and regular IO at any point on the thin pool.
> And in addition, there would be calls to reserve/release the thin
> metadata to capture diff for backup between volumes.
> These are serialized at our app layer and I also see these are
> serialized within lvm layer too.
>
> Our volume deletions are 2 phased, based on our earlier discussion in
> this thread, we had observed high IO latency when volumes are deleted
> and the suggestion from this team was to discard and then delete
> volumes to keep the deletion time short.
>
> I hope this is giving enough context to understand this better.
> Unfortunately, since I am unable to reproduce this and have this
> sighted now twice at customer, I have no more datapoints to add.
> Would be willing to hear out if you have any suggestions I can pursue in =
house.
>
> Best regards
>
>
> > *** phase 1 - userspace issues blkdiscard on thin volumes ***
> >   dm-thin.c : thin_bio_map()
> >     =E2=86=92 detects REQ_OP_DISCARD
> >     =E2=86=92 thin_defer_bio_with_throttle(tc, bio)
> >       =E2=86=92 adds bio to tc->deferred_bio_list        // QUEUED, not=
 processed
> >       =E2=86=92 wakes pool worker thread
> >
> >   dm-thin.c : do_worker()                         // runs ASYNCHRONOUSL=
Y
> >     =E2=86=92 process_deferred_bios()
> >       =E2=86=92 process_thin_deferred_bios()
> >         =E2=86=92 process_discard_bio()
> >           =E2=86=92 creates mapping, adds to pool->prepared_discards
> >     =E2=86=92 process_prepared(pool->prepared_discards)
> >       =E2=86=92 process_prepared_discard_no_passdown(m):
> >         =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
> >             [dm-thin-metadata.c]
> >           =E2=86=92 dm_btree_remove_leaves()
> >               [dm-btree-remove.c]
> >             =E2=86=92 data_block_dec()                    // for each d=
ata block
> >                 [dm-thin-metadata.c]
> >               =E2=86=92 dm_sm_dec_blocks()                // DECREMENTS=
 refcount
> >                   [dm-space-map-common.c]
> >
> > ***  phase 2: these steps still be IN PROGRESS or QUEUED when
> > userspace deletes the thin volume ***
> >
> >   dm-thin.c : thin_dtr()                          // dmsetup remove
> >     =E2=86=92 list_del_rcu(&tc->list)                     // removes fr=
om
> >                                                   //   pool->active_thi=
ns
> >     =E2=86=92 synchronize_rcu()
> >     =E2=86=92 dm_pool_close_thin_device(tc->td)           // open_count=
--
> >     =E2=86=92 kfree(tc)                                   // tc FREED
> >
> >     *** does NOT flush pool workqueue ***          =E2=86=90 GAP 1
> >     *** does NOT drain prepared_discards ***       =E2=86=90 GAP 2
> >
> >   dm-thin.c : process_delete_mesg()               // dmsetup message
> >     =E2=86=92 dm_pool_delete_thin_device(pool->pmd, dev_id)
> >         [dm-thin-metadata.c : __delete_device()]
> >       =E2=86=92 dm_btree_remove(&pmd->tl_info, ...)       // remove fro=
m top-level
> >           [dm-btree-remove.c]                      //   btree
> >         =E2=86=92 subtree_dec()                            // cascades =
into:
> >             [dm-thin-metadata.c]
> >           =E2=86=92 dm_btree_del()                         // walks ALL=
 leaves
> >               [dm-btree.c]
> >             =E2=86=92 data_block_dec() for EVERY remaining block
> >                 [dm-thin-metadata.c]
> >               =E2=86=92 dm_sm_dec_blocks()                 // DECREMENT=
S refcount
> >                   [dm-space-map-common.c]          //   for ALL blocks
> >
> > ** phase 3: KERNEL (worker thread =E2=80=94 still running from Phase 1)=
 ***
> >   dm-thin.c : do_worker()                         // ASYNC, still runni=
ng
> >     =E2=86=92 process_prepared(pool->prepared_discards)
> >       =E2=86=92 process_prepared_discard_no_passdown(m):
> >         =E2=86=92 m->tc points to FREED tc                // =E2=86=90 =
use-after-free risk
> >         =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
> >             [dm-thin-metadata.c]
> >           =E2=86=92 dm_btree_remove_leaves()
> >               [dm-btree-remove.c]
> >             =E2=86=92 data_block_dec()                    // SAME block=
s already
> >                 [dm-thin-metadata.c]              //   decremented in
> >               =E2=86=92 dm_sm_dec_blocks()                //   Phase 2!
> >                   [dm-space-map-common.c]
> >
> >                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> >                   sm_ll_dec_bitmap():
> >                     old =3D sm_lookup_bitmap(ic->bitmap, bit);
> >                     switch (old) {
> >                     case 0:  // =E2=86=90 refcount ALREADY 0
> >                       DMERR("unable to decrement block");
> >                       return -EINVAL;  // -22
> >                     }
> >                                  [dm-space-map-common.c]
> >                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> >
> >                           =E2=96=BC
> >                 dm_tm_shadow_block() fails (corrupted space map)
> >                     [dm-transaction-manager.c]
> >
> >                           =E2=96=BC
> >                 dm_pool_inc_data_range() fails with -EINVAL (-22)
> >                     [dm-thin-metadata.c]
> >
> >                           =E2=96=BC
> >                 metadata_operation_failed(pool, "dm_pool_inc_data_range=
")
> >                     [dm-thin.c]
> >
> >                           =E2=96=BC
> >                 set_pool_mode(pool, PM_READ_ONLY)
> >                     [dm-thin.c]
> >
> >                 *** POOL IS NOW DEAD ***
> > ```
> >
> >
> >
> > As always, many thanks for your help.
> >
> >
> > # issue unable to activate thin pool
> > ```
> > [Wed Apr  8 17:05:14 2026] device-mapper: space map common: unable to
> > decrement block
> > [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
> > decrement block
> > [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> > dm_tm_shadow_block() failed
> > [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
> > decrement block
> > [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> > dm_tm_shadow_block() failed
> > [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
> > decrement block
> > [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> > dm_tm_shadow_block() failed
> > [Wed Apr  8 17:08:31 2026] device-mapper: space map common: unable to
> > decrement block
> > [Wed Apr  8 17:08:31 2026] device-mapper: space map common:
> > dm_tm_shadow_block() failed
> > [Wed Apr  8 17:08:31 2026] device-mapper: space map common: unable to
> > decrement block
> > [Wed Apr  8 17:08:31 2026] device-mapper: space map common:
> > dm_tm_shadow_block() failed
> > ```
> >
> > # host and lvm tools version
> > ```
> > uname -a
> > Linux kernel: 5.14.0-427.109.1.el9_4
> > RHEL 9.4
> >
> > lvm version
> > 2.03.23(2) (2023-11-21)
> > library: 1.02.197 (2023-11-21)
> > driver: 4.48.1
> > ```
> >
> > Below are references to the node block layer.
> > There was IO, thin volume creations and deletions, IO includes discards=
 too.
> > ```
> > [root@root core]# lvs -a pwx1
> >   Please remove the lvm.conf global_filter, it is ignored with the devi=
ces file.
> >   LV                  VG   Attr       LSize   Pool   Origin
> >   Data%  Meta%  Move Log Cpy%Sync Convert
> >   1004123733318649769 pwx1 Vwi-a-t---  50.00g pxpool 660563940592999863=
  0.25
> >   103699400925372609  pwx1 Vwi-a-t--- 750.00g pxpool 111571246884745524=
9 59.75
> >   1072608604746349133 pwx1 Vwi-a-t---  50.00g pxpool 941788757364603035=
  0.25
> >   1115712468847455249 pwx1 Vwi-aot--- 750.00g pxpool                   =
  59.75
> >   1138695541641144166 pwx1 Vwi-a-t---  50.00g pxpool 941788757364603035=
  0.25
> >   136169780918964477  pwx1 Vwi-aot---  30.00g pxpool                   =
  33.33
> >   218651423266852202  pwx1 Vwi-aot---   5.00g pxpool                   =
  3.49
> >   404947242154831849  pwx1 Vwi-aot---   5.00g pxpool                   =
  4.20
> >   440731835552948333  pwx1 Vwi-aot---  50.00g pxpool                   =
  5.59
> >   462681831690737818  pwx1 Vwi-a-t---  50.00g pxpool 73089959772282964 =
  0.25
> >   519898065353250833  pwx1 Vwi-a-t---  50.00g pxpool 660563940592999863=
  0.25
> >   527922274169222783  pwx1 Vwi-aot--- 200.00g pxpool                   =
  28.64
> >   537994915504805835  pwx1 Vwi-aot---  50.00g pxpool                   =
  10.88
> >   569690966828279529  pwx1 Vwi-a-t--- 750.00g pxpool 111571246884745524=
9 59.75
> >   594992999737145586  pwx1 Vwi-aot--- 200.00g pxpool                   =
  28.91
> >   660563940592999863  pwx1 Vwi-aot---  50.00g pxpool                   =
  0.25
> >   702358223003836192  pwx1 Vwi-aot--- 200.00g pxpool                   =
  28.64
> >   73089959772282964   pwx1 Vwi-aot---  50.00g pxpool                   =
  0.25
> >   793515512579595979  pwx1 Vwi-aot---  30.00g pxpool                   =
  33.33
> >   79731196567060146   pwx1 Vwi-aot---  50.00g pxpool                   =
  10.90
> >   865397616123963982  pwx1 Vwi-aot---  50.00g pxpool                   =
  9.39
> >   866802183893693297  pwx1 Vwi-aot--- 200.00g pxpool                   =
  28.91
> >   941788757364603035  pwx1 Vwi-aot---  50.00g pxpool                   =
  0.25
> >   960350716126095496  pwx1 Vwi-a-t---  50.00g pxpool 73089959772282964 =
  0.25
> >   [lvol0_pmspare]     pwx1 ewi-------   2.00g
> >   pxMetaFS            pwx1 Vwi-aot---  64.00g pxpool                   =
  0.05
> >   pxpool              pwx1 twi-aot---   1.54t
> >   43.59  5.06 <<< very low tmeta util.
> >   [pxpool_tdata]      pwx1 Twi-ao----   1.54t
> >   [pxpool_tmeta]      pwx1 ewi-ao----   4.00g
> >   pxreserve           pwx1 -wi------k  15.00g
> > [root@root core]#
> > [root@root core]# vgs pwx1
> >   Please remove the lvm.conf global_filter, it is ignored with the devi=
ces file.
> >   VG   #PV #LV #SN Attr   VSize VFree
> >   pwx1   1  27   0 wz--n- 1.56t    0
> > [root@root core]# lsblk -s /dev/pwx1/1004123733318649769
> > NAME                                         MAJ:MIN RM  SIZE RO TYPE
> > MOUNTPOINTS
> > pwx1-1004123733318649769                     253:107  0   50G  0 lvm
> > =E2=94=94=E2=94=80pwx1-pxpool-tpool                          253:14   0=
  1.5T  0 lvm
> >   =E2=94=9C=E2=94=80pwx1-pxpool_tmeta                        253:12   0=
    4G  0 lvm
> >   =E2=94=82 =E2=94=94=E2=94=80md126                                    =
9:126  0  1.6T  0 raid0
> >   =E2=94=82   =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 25=
3:10   0  1.6T  0 mpath
> >   =E2=94=82     =E2=94=9C=E2=94=80nvme4n2                            25=
9:5    0  1.6T  0 disk
> >   =E2=94=82     =E2=94=9C=E2=94=80nvme5n2                            25=
9:8    0  1.6T  0 disk
> >   =E2=94=82     =E2=94=94=E2=94=80nvme6n2                            25=
9:11   0  1.6T  0 disk
> >   =E2=94=94=E2=94=80pwx1-pxpool_tdata                        253:13   0=
  1.5T  0 lvm
> >     =E2=94=94=E2=94=80md126                                    9:126  0=
  1.6T  0 raid0
> >       =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 253:10   0=
  1.6T  0 mpath
> >         =E2=94=9C=E2=94=80nvme4n2                            259:5    0=
  1.6T  0 disk
> >         =E2=94=9C=E2=94=80nvme5n2                            259:8    0=
  1.6T  0 disk
> >         =E2=94=94=E2=94=80nvme6n2                            259:11   0=
  1.6T  0 disk
> > [root@root core]# ls -al /dev/md/pwx1
> > lrwxrwxrwx. 1 root root 8 Apr 11 11:48 /dev/md/pwx1 -> ../md126
> > [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool-tpool
> > 0 3311132672 thin-pool 253:12 253:13 128 0 2 skip_block_zeroing

The second feature flag was truncated. Does the thin-pool has
no_discard_passdown enabled?


> > [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tdata
> > 0 1008459776 linear 9:126 35653632
> > 1008459776 629145600 linear 9:126 1048307712
> > 1637605376 1673527296 linear 9:126 1681647616
> > [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tmeta
> > 0 4194304 linear 9:126 1044113408
> > 4194304 4194304 linear 9:126 1677453312
> > [root@root core]#
> > [root@root core]# dmsetup table --target multipath
> > 3500a07513c1e23c4: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:=
16 1 1
> > 3500a07513c1e2ade: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:=
64 1 1
> > 3500a07513c1e2ca8: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:=
80 1 1
> > 3500a07513c1e2cf3: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:=
0 1 1
> > 3500a07513c1e3afc: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:=
48 1 1
> > eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 0 0 1 1
> > service-time 0 1 2 259:2 1 1
> > eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 0 0 1 1
> > service-time 0 1 2 259:0 1 1
> > eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 0 0 1 1
> > service-time 0 1 2 259:3 1 1
> > eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 0 0 1 1
> > service-time 0 1 2 259:1 1 1
> > eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 3
> > retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
> > 259:4 1 259:7 1 259:10 1
> > eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 3
> > retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
> > 259:5 1 259:8 1 259:11 1
> > eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 3
> > retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
> > 259:6 1 259:9 1 259:12 1
> > [root@root core]# dmsetup status --target multipath
> > 3500a07513c1e23c4: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:16 A 0 =
0 1
> > 3500a07513c1e2ade: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:64 A 0 =
0 1
> > 3500a07513c1e2ca8: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:80 A 0 =
0 1
> > 3500a07513c1e2cf3: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:0 A 0 0=
 1
> > 3500a07513c1e3afc: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:48 A 0 =
0 1
> > eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 2 0 0 0 1
> > 1 A 0 1 2 259:2 A 0 0 1
> > eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 2 0 0 0 1
> > 1 A 0 1 2 259:0 A 0 0 1
> > eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 2 0 0 0 1
> > 1 A 0 1 2 259:3 A 0 0 1
> > eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 2 0 0 0 1
> > 1 A 0 1 2 259:1 A 0 0 1
> > eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 2 0 0 0
> > 1 1 A 0 3 1 259:4 A 1 22 259:7 A 1 21 259:10 A 1 22
> > eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 2 0 0 0 1
> > 1 A 0 3 1 259:5 A 1 4 259:8 A 1 6 259:11 A 1 11
> > eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 2 0 0 0 1
> > 1 A 0 3 1 259:6 A 1 0 259:9 A 1 0 259:12 A 1 0
> > [root@root core]#
> > [root@root core]# mdadm -D /dev/md/pwx1
> > /dev/md/pwx1:
> >            Version : 1.2
> >      Creation Time : Tue Mar 17 15:29:31 2026
> >         Raid Level : raid0
> >         Array Size : 1677589504 (1599.87 GiB 1717.85 GB)
> >       Raid Devices : 1
> >      Total Devices : 1
> >        Persistence : Superblock is persistent
> >
> >        Update Time : Mon Mar 23 20:52:51 2026
> >              State : clean
> >     Active Devices : 1
> >    Working Devices : 1
> >     Failed Devices : 0
> >      Spare Devices : 0
> >
> >         Chunk Size : 1024K
> >
> > Consistency Policy : none
> >
> >               Name : any:pwx1
> >               UUID : 1716a351:ed3e53e7:0ce83ccd:8d3a3021
> >             Events : 16
> >
> >     Number   Major   Minor   RaidDevice State
> >        0     253       10        0      active sync   /dev/dm-10
> > [root@root core]#
> > ```
>

