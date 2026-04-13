Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854AF3803F2
	for <linux-lvm@lists.linux.dev>; Mon, 13 Apr 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102613; cv=pass; b=HzgYzubNtBAk/1JAib1wQXd0VJOzOxs0NGSPq1aDwDu3lxhKHRYvTPmW4R5y7hkx5w4b9sq/5mvEl3+hZOdhErbHOUDq524gp6BZ2BpZujLiGYyhlgEmxBIH+vYBlxiKUP6WxHIlT8ZGsShYxOadRXzQ9KEzYDhS337lfMNb3Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102613; c=relaxed/simple;
	bh=c0hknodX7LVXdLU+o4WCvSnx3DNqsFrDF1N4hFZK2uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=oy2ZGZw30o9FpynvjcLQREUPj/DDM4oHXNzxkk9opbupngQLgq3Q4NRj2XkJ+P0C8Blx6CeZ2io0U5+BSh8691Fax7aC39IAkIY8A/HOBlKgY0HALwgjx1iAD95Bd2yWBYyJG20NrnArdPVVNwmmf5qkyd5F+qsmp3NK9VWp6Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=EXhbsyQY; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="EXhbsyQY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso4114828a91.3
        for <linux-lvm@lists.linux.dev>; Mon, 13 Apr 2026 10:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776102610; cv=none;
        d=google.com; s=arc-20240605;
        b=YTAyybJoXwhlBOFm6VhXAYjrusBCSw1ePptkLW9UbF5BgftZAm24IO3UNp1zJnTE5l
         fX2CsQBdWMbkT2QQZJ068m9IjOs+RUEJxLic/ZvCEb+KEmK5RcVaGvlCaGKfVPaW46qW
         S57U10lkftPK59qxRTCFZRUaPDQk7ALSTcTnj3r+XZMnsXsCWA2ikUVzpOA6Q/6qzIj5
         HO/lyim6RjXpjlzyLzcbj7+IQEffwqLU202bJeC5blPB0b0szdrNrIbFVqiYAnC8K5iV
         mvVluw0x2gQez21vmbRGvK+la/fbvkWF5I5w9G5awYHSH6zc1PZZCFnUmFVqlQkp7PfZ
         jW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MCX8cwPc90FZvhmKW0DlflgUqOD0ydsBtfuTOE4kgVM=;
        fh=iQOWxowsu+faQgcWO2V4Hll1LFv7Q5iitXvpXh+DqLU=;
        b=dgwD8MFrpxRcEZ9sh3P09/Bw5dDsA1GWXOuH9zDrQBh/RFOsGi9/mCCOhlQ7qilbPm
         T8OdEx4PLhAKAdJH8d/yp4RMi2YwELJvyOZVSh6DGk+RGRWWXipY+Hk1gqSIiHACVTte
         AylTJxD1Qz1OdYo7dgJm6mkH/aO/gD1I4khPdGsBUcnAsvShqh8K1A9vywm/l/D8qEgd
         wh69BMvfjdQFrezYgE0v7BC12ok3lC+V2Mex8cqL57F23DxZ+QTdCwaMniN1a/gDWno1
         re5Wvzc2zUzR1G2XvtAywj9Rrl6EpX4p43wGFsdaiy5sh5/EsmpYvlEzfxB6B705zNHV
         7OFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1776102610; x=1776707410; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCX8cwPc90FZvhmKW0DlflgUqOD0ydsBtfuTOE4kgVM=;
        b=EXhbsyQYkBYWh94lCpOhk9+oI2WEAtnqbm8ix7+7k9sjp5EH2Rj1bhe4HyaBzj52D7
         MoEK3CAPDFBZtvABPoSs12R9HIO17QRmyG6xIE32EjFmhKD+X8WlZpasKCpz7WDx47+p
         fmqse03okFosBb9hmZBpIY2wllzcansiAyRENXz7QebYsnd4SU9E9csb3udDQ16Sd27U
         tm6Wv3Ci6NY69heoWuVLoPJe/LHDNcOsmCw5mRiKbjyVZI0iPjlr3c2egoFP9yAbp1JI
         7tq+kEgliXAhPKgOeSH//EoIr40xPSQsxVXCSWhGcoGeHW9GhiivKlV7QfbMGBMqP0Q8
         0NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102610; x=1776707410;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCX8cwPc90FZvhmKW0DlflgUqOD0ydsBtfuTOE4kgVM=;
        b=oRCNMFM5nVLAIJyVE/61W/Ttd2yEqOZEQVViUFIZ3jLTs2mVtiKf3XvtV+k1F4HHlb
         bIIz1rPiAXHXJhMiH9CiGvtEJU/3nrGnZcbnoKFAa8zm2mc9WZ7MUhYsBlyyRfUAGRS8
         9ZC/o3RnvWBB0Aak/G+pckZbO1bzokkruWLptDyS4ZDP/mWQit7iMx/+9wCro0QvxBXd
         0u1PO0O7dsCfHMccPSAj3B9ck8ZkzE5ZMGEGHVZETeiO+HUM47f/kIuLFRNgpumNx7hd
         4ghu51cE0mzANFL4fXlAvcBY6S0PoifvJ4q+zEoer6IcewbAj3FNbHxQstNPkHsN6TUz
         euow==
X-Gm-Message-State: AOJu0YytUIoj64DuVe/2WGBdnzg9r6kkLBlY1JH9IaMHpZf4ZU9YvvmA
	XWDQQrjcY9QsZTgMrIlg9b73c7ZYDuaPizx/q337xQM/IGCDxC4n2atTcy/JI11E1+KitwK81RO
	JHTG9iMGrSYZYZRkeRVFPAUQizKaZgWQhHqTa4pOfAbjXBisaw0LANkU=
X-Gm-Gg: AeBDiesNxJJT3m+dxyq7KZqW44JLhOAsP5LobX2b6b7RPj++/YvHhyLUcClwGxwdRDV
	ufslLKsXm/Dr5Ty9IGB7RXg755Mxl3H8zfkfB6B4KAUtbiyiQeSM95s9ATkHpk26oQz7gIWiZr3
	Lx6sjHwC7PpfLTXGitQgdqZQ4SdwviHhpyIJGx/9snbw0+DDjxhu1svJxFBFdHbmHf55FNfQZ6r
	huNm4EitVfs4y8Nhunys6gsmny+L3yjtCMXJ84RmCgmy4q4L3H8GyeeMniZ1cw5bxKBUPUfvXtG
	6occPA==
X-Received: by 2002:a17:90b:5185:b0:35b:e5cf:20fc with SMTP id
 98e67ed59e1d1-35e4285c0acmr15337193a91.26.1776102610149; Mon, 13 Apr 2026
 10:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFe+wq3EXW0n_bLCri0zC2zVQK987D3x5LY+GiOpaLsgZxk4Rw@mail.gmail.com>
In-Reply-To: <CAFe+wq3EXW0n_bLCri0zC2zVQK987D3x5LY+GiOpaLsgZxk4Rw@mail.gmail.com>
From: Lakshmi Narasimhan Sundararajan <lsundararajan@purestorage.com>
Date: Mon, 13 Apr 2026 23:19:54 +0530
X-Gm-Features: AQROBzC7mZjVSsQTO_Jofylk41vycr17griUs5LB2T8L8CuLIXbojoXGAglJrKk
Message-ID: <CAFe+wq1RNJiiaak5dJycDsRBZ08ga1YQGYh4QTS9mV353YPLmw@mail.gmail.com>
Subject: Re: Reg dm thin pool metadata inconsistency
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good day!

A gentle ping to hear an update from the authors here. More updates inline.

On Sat, Apr 11, 2026 at 5:41=E2=80=AFPM Lakshmi Narasimhan Sundararajan
<lsundararajan@purestorage.com> wrote:
>
> Hi LVM Team! A very good day to you all.
> [ I hope this email is the right one now]
>
> I recently experienced an outage where thin pool activation failed,
> details are as follows.
> Good news is, I was able to recover the pool through thin_repair.
> Thank goodness!
>
> There was no infra induced failure i.e. no network, disk, usage over
> limit, memory or compute being faulty orover used in any way.
> Node was running healthy for 13 days and suddenly hit this issue.
> Pool would handle I/O load (including discards), new volume
> creation/deletion, and other regular activities.
>
> I tried to identify if there is a direct known issue, but I was unable to=
.
> This generally seems to be some known issue, but I am unable to find a
> direct link with the same signature.
>
> a) how to induce thin pool failures at will, so thin pool does not
> activate, but repair succeeds, so  I can test this recovery in some
> controlled form.

I have found a way, I think I can pull out the metadata xml and modify
highest transaction and rewrite the metadata and swap the pool to
recreate this condition.
pool activation will fail and thin_repair can correct it. Any easier
way that my suggestion, please feel free to suggest.

> b) To your best knowledge this seems a known issue and fixed in a later r=
elease?
> I did my search at both kernel bugzilla and RHEL - and I am hoping you
> can help me find it. Internet searches point to errata pages, but I am
> unable to find the
> exact ticket, commit that address this. The OCP platform was running a
> recent release from RHEL.
> Linux kernel: 5.14.0-427.109.1.el9_4 RHEL 9.4 This is likely 2 years old =
though.

So far I and my team have not been able to reproduce this issue, and
look to your help confirming whether
a) is this known already and is fixed!
b) whats the safest kernel to upgrade to?
c) still an open issue!

>
> c) After spending some time reviewing thin code and the commits since
> the mentioned
> kernel from kernel.org linux.. I suspect it could be a race with
> discard and either IO or device creation/deletion on the same pool
> could cause this?
> Could the authors here, please confirm my code reading below.
> ```

As mentioned we tried a focussed reproducer around this, but unable to
trigger the issue.
There are volume creation/deletions, snapshot creations and deletions,
discards and regular IO at any point on the thin pool.
And in addition, there would be calls to reserve/release the thin
metadata to capture diff for backup between volumes.
These are serialized at our app layer and I also see these are
serialized within lvm layer too.

Our volume deletions are 2 phased, based on our earlier discussion in
this thread, we had observed high IO latency when volumes are deleted
and the suggestion from this team was to discard and then delete
volumes to keep the deletion time short.

I hope this is giving enough context to understand this better.
Unfortunately, since I am unable to reproduce this and have this
sighted now twice at customer, I have no more datapoints to add.
Would be willing to hear out if you have any suggestions I can pursue in ho=
use.

Best regards


> *** phase 1 - userspace issues blkdiscard on thin volumes ***
>   dm-thin.c : thin_bio_map()
>     =E2=86=92 detects REQ_OP_DISCARD
>     =E2=86=92 thin_defer_bio_with_throttle(tc, bio)
>       =E2=86=92 adds bio to tc->deferred_bio_list        // QUEUED, not p=
rocessed
>       =E2=86=92 wakes pool worker thread
>
>   dm-thin.c : do_worker()                         // runs ASYNCHRONOUSLY
>     =E2=86=92 process_deferred_bios()
>       =E2=86=92 process_thin_deferred_bios()
>         =E2=86=92 process_discard_bio()
>           =E2=86=92 creates mapping, adds to pool->prepared_discards
>     =E2=86=92 process_prepared(pool->prepared_discards)
>       =E2=86=92 process_prepared_discard_no_passdown(m):
>         =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
>             [dm-thin-metadata.c]
>           =E2=86=92 dm_btree_remove_leaves()
>               [dm-btree-remove.c]
>             =E2=86=92 data_block_dec()                    // for each dat=
a block
>                 [dm-thin-metadata.c]
>               =E2=86=92 dm_sm_dec_blocks()                // DECREMENTS r=
efcount
>                   [dm-space-map-common.c]
>
> ***  phase 2: these steps still be IN PROGRESS or QUEUED when
> userspace deletes the thin volume ***
>
>   dm-thin.c : thin_dtr()                          // dmsetup remove
>     =E2=86=92 list_del_rcu(&tc->list)                     // removes from
>                                                   //   pool->active_thins
>     =E2=86=92 synchronize_rcu()
>     =E2=86=92 dm_pool_close_thin_device(tc->td)           // open_count--
>     =E2=86=92 kfree(tc)                                   // tc FREED
>
>     *** does NOT flush pool workqueue ***          =E2=86=90 GAP 1
>     *** does NOT drain prepared_discards ***       =E2=86=90 GAP 2
>
>   dm-thin.c : process_delete_mesg()               // dmsetup message
>     =E2=86=92 dm_pool_delete_thin_device(pool->pmd, dev_id)
>         [dm-thin-metadata.c : __delete_device()]
>       =E2=86=92 dm_btree_remove(&pmd->tl_info, ...)       // remove from =
top-level
>           [dm-btree-remove.c]                      //   btree
>         =E2=86=92 subtree_dec()                            // cascades in=
to:
>             [dm-thin-metadata.c]
>           =E2=86=92 dm_btree_del()                         // walks ALL l=
eaves
>               [dm-btree.c]
>             =E2=86=92 data_block_dec() for EVERY remaining block
>                 [dm-thin-metadata.c]
>               =E2=86=92 dm_sm_dec_blocks()                 // DECREMENTS =
refcount
>                   [dm-space-map-common.c]          //   for ALL blocks
>
> ** phase 3: KERNEL (worker thread =E2=80=94 still running from Phase 1) *=
**
>   dm-thin.c : do_worker()                         // ASYNC, still running
>     =E2=86=92 process_prepared(pool->prepared_discards)
>       =E2=86=92 process_prepared_discard_no_passdown(m):
>         =E2=86=92 m->tc points to FREED tc                // =E2=86=90 us=
e-after-free risk
>         =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
>             [dm-thin-metadata.c]
>           =E2=86=92 dm_btree_remove_leaves()
>               [dm-btree-remove.c]
>             =E2=86=92 data_block_dec()                    // SAME blocks =
already
>                 [dm-thin-metadata.c]              //   decremented in
>               =E2=86=92 dm_sm_dec_blocks()                //   Phase 2!
>                   [dm-space-map-common.c]
>
>                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                   sm_ll_dec_bitmap():
>                     old =3D sm_lookup_bitmap(ic->bitmap, bit);
>                     switch (old) {
>                     case 0:  // =E2=86=90 refcount ALREADY 0
>                       DMERR("unable to decrement block");
>                       return -EINVAL;  // -22
>                     }
>                                  [dm-space-map-common.c]
>                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
>                           =E2=96=BC
>                 dm_tm_shadow_block() fails (corrupted space map)
>                     [dm-transaction-manager.c]
>
>                           =E2=96=BC
>                 dm_pool_inc_data_range() fails with -EINVAL (-22)
>                     [dm-thin-metadata.c]
>
>                           =E2=96=BC
>                 metadata_operation_failed(pool, "dm_pool_inc_data_range")
>                     [dm-thin.c]
>
>                           =E2=96=BC
>                 set_pool_mode(pool, PM_READ_ONLY)
>                     [dm-thin.c]
>
>                 *** POOL IS NOW DEAD ***
> ```
>
>
>
> As always, many thanks for your help.
>
>
> # issue unable to activate thin pool
> ```
> [Wed Apr  8 17:05:14 2026] device-mapper: space map common: unable to
> decrement block
> [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
> decrement block
> [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> dm_tm_shadow_block() failed
> [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
> decrement block
> [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> dm_tm_shadow_block() failed
> [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unable to
> decrement block
> [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> dm_tm_shadow_block() failed
> [Wed Apr  8 17:08:31 2026] device-mapper: space map common: unable to
> decrement block
> [Wed Apr  8 17:08:31 2026] device-mapper: space map common:
> dm_tm_shadow_block() failed
> [Wed Apr  8 17:08:31 2026] device-mapper: space map common: unable to
> decrement block
> [Wed Apr  8 17:08:31 2026] device-mapper: space map common:
> dm_tm_shadow_block() failed
> ```
>
> # host and lvm tools version
> ```
> uname -a
> Linux kernel: 5.14.0-427.109.1.el9_4
> RHEL 9.4
>
> lvm version
> 2.03.23(2) (2023-11-21)
> library: 1.02.197 (2023-11-21)
> driver: 4.48.1
> ```
>
> Below are references to the node block layer.
> There was IO, thin volume creations and deletions, IO includes discards t=
oo.
> ```
> [root@root core]# lvs -a pwx1
>   Please remove the lvm.conf global_filter, it is ignored with the device=
s file.
>   LV                  VG   Attr       LSize   Pool   Origin
>   Data%  Meta%  Move Log Cpy%Sync Convert
>   1004123733318649769 pwx1 Vwi-a-t---  50.00g pxpool 660563940592999863  =
0.25
>   103699400925372609  pwx1 Vwi-a-t--- 750.00g pxpool 1115712468847455249 =
59.75
>   1072608604746349133 pwx1 Vwi-a-t---  50.00g pxpool 941788757364603035  =
0.25
>   1115712468847455249 pwx1 Vwi-aot--- 750.00g pxpool                     =
59.75
>   1138695541641144166 pwx1 Vwi-a-t---  50.00g pxpool 941788757364603035  =
0.25
>   136169780918964477  pwx1 Vwi-aot---  30.00g pxpool                     =
33.33
>   218651423266852202  pwx1 Vwi-aot---   5.00g pxpool                     =
3.49
>   404947242154831849  pwx1 Vwi-aot---   5.00g pxpool                     =
4.20
>   440731835552948333  pwx1 Vwi-aot---  50.00g pxpool                     =
5.59
>   462681831690737818  pwx1 Vwi-a-t---  50.00g pxpool 73089959772282964   =
0.25
>   519898065353250833  pwx1 Vwi-a-t---  50.00g pxpool 660563940592999863  =
0.25
>   527922274169222783  pwx1 Vwi-aot--- 200.00g pxpool                     =
28.64
>   537994915504805835  pwx1 Vwi-aot---  50.00g pxpool                     =
10.88
>   569690966828279529  pwx1 Vwi-a-t--- 750.00g pxpool 1115712468847455249 =
59.75
>   594992999737145586  pwx1 Vwi-aot--- 200.00g pxpool                     =
28.91
>   660563940592999863  pwx1 Vwi-aot---  50.00g pxpool                     =
0.25
>   702358223003836192  pwx1 Vwi-aot--- 200.00g pxpool                     =
28.64
>   73089959772282964   pwx1 Vwi-aot---  50.00g pxpool                     =
0.25
>   793515512579595979  pwx1 Vwi-aot---  30.00g pxpool                     =
33.33
>   79731196567060146   pwx1 Vwi-aot---  50.00g pxpool                     =
10.90
>   865397616123963982  pwx1 Vwi-aot---  50.00g pxpool                     =
9.39
>   866802183893693297  pwx1 Vwi-aot--- 200.00g pxpool                     =
28.91
>   941788757364603035  pwx1 Vwi-aot---  50.00g pxpool                     =
0.25
>   960350716126095496  pwx1 Vwi-a-t---  50.00g pxpool 73089959772282964   =
0.25
>   [lvol0_pmspare]     pwx1 ewi-------   2.00g
>   pxMetaFS            pwx1 Vwi-aot---  64.00g pxpool                     =
0.05
>   pxpool              pwx1 twi-aot---   1.54t
>   43.59  5.06 <<< very low tmeta util.
>   [pxpool_tdata]      pwx1 Twi-ao----   1.54t
>   [pxpool_tmeta]      pwx1 ewi-ao----   4.00g
>   pxreserve           pwx1 -wi------k  15.00g
> [root@root core]#
> [root@root core]# vgs pwx1
>   Please remove the lvm.conf global_filter, it is ignored with the device=
s file.
>   VG   #PV #LV #SN Attr   VSize VFree
>   pwx1   1  27   0 wz--n- 1.56t    0
> [root@root core]# lsblk -s /dev/pwx1/1004123733318649769
> NAME                                         MAJ:MIN RM  SIZE RO TYPE
> MOUNTPOINTS
> pwx1-1004123733318649769                     253:107  0   50G  0 lvm
> =E2=94=94=E2=94=80pwx1-pxpool-tpool                          253:14   0  =
1.5T  0 lvm
>   =E2=94=9C=E2=94=80pwx1-pxpool_tmeta                        253:12   0  =
  4G  0 lvm
>   =E2=94=82 =E2=94=94=E2=94=80md126                                    9:=
126  0  1.6T  0 raid0
>   =E2=94=82   =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 253:=
10   0  1.6T  0 mpath
>   =E2=94=82     =E2=94=9C=E2=94=80nvme4n2                            259:=
5    0  1.6T  0 disk
>   =E2=94=82     =E2=94=9C=E2=94=80nvme5n2                            259:=
8    0  1.6T  0 disk
>   =E2=94=82     =E2=94=94=E2=94=80nvme6n2                            259:=
11   0  1.6T  0 disk
>   =E2=94=94=E2=94=80pwx1-pxpool_tdata                        253:13   0  =
1.5T  0 lvm
>     =E2=94=94=E2=94=80md126                                    9:126  0  =
1.6T  0 raid0
>       =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 253:10   0  =
1.6T  0 mpath
>         =E2=94=9C=E2=94=80nvme4n2                            259:5    0  =
1.6T  0 disk
>         =E2=94=9C=E2=94=80nvme5n2                            259:8    0  =
1.6T  0 disk
>         =E2=94=94=E2=94=80nvme6n2                            259:11   0  =
1.6T  0 disk
> [root@root core]# ls -al /dev/md/pwx1
> lrwxrwxrwx. 1 root root 8 Apr 11 11:48 /dev/md/pwx1 -> ../md126
> [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool-tpool
> 0 3311132672 thin-pool 253:12 253:13 128 0 2 skip_block_zeroing
> [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tdata
> 0 1008459776 linear 9:126 35653632
> 1008459776 629145600 linear 9:126 1048307712
> 1637605376 1673527296 linear 9:126 1681647616
> [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tmeta
> 0 4194304 linear 9:126 1044113408
> 4194304 4194304 linear 9:126 1677453312
> [root@root core]#
> [root@root core]# dmsetup table --target multipath
> 3500a07513c1e23c4: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:16=
 1 1
> 3500a07513c1e2ade: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:64=
 1 1
> 3500a07513c1e2ca8: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:80=
 1 1
> 3500a07513c1e2cf3: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:0 =
1 1
> 3500a07513c1e3afc: 0 3750748848 multipath 0 0 1 1 service-time 0 1 2 8:48=
 1 1
> eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 0 0 1 1
> service-time 0 1 2 259:2 1 1
> eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 0 0 1 1
> service-time 0 1 2 259:0 1 1
> eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 0 0 1 1
> service-time 0 1 2 259:3 1 1
> eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 0 0 1 1
> service-time 0 1 2 259:1 1 1
> eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 3
> retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
> 259:4 1 259:7 1 259:10 1
> eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 3
> retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
> 259:5 1 259:8 1 259:11 1
> eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 3
> retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 1
> 259:6 1 259:9 1 259:12 1
> [root@root core]# dmsetup status --target multipath
> 3500a07513c1e23c4: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:16 A 0 0 =
1
> 3500a07513c1e2ade: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:64 A 0 0 =
1
> 3500a07513c1e2ca8: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:80 A 0 0 =
1
> 3500a07513c1e2cf3: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:0 A 0 0 1
> 3500a07513c1e3afc: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:48 A 0 0 =
1
> eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 2 0 0 0 1
> 1 A 0 1 2 259:2 A 0 0 1
> eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 2 0 0 0 1
> 1 A 0 1 2 259:0 A 0 0 1
> eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 2 0 0 0 1
> 1 A 0 1 2 259:3 A 0 0 1
> eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 2 0 0 0 1
> 1 A 0 1 2 259:1 A 0 0 1
> eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 2 0 0 0
> 1 1 A 0 3 1 259:4 A 1 22 259:7 A 1 21 259:10 A 1 22
> eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 2 0 0 0 1
> 1 A 0 3 1 259:5 A 1 4 259:8 A 1 6 259:11 A 1 11
> eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 2 0 0 0 1
> 1 A 0 3 1 259:6 A 1 0 259:9 A 1 0 259:12 A 1 0
> [root@root core]#
> [root@root core]# mdadm -D /dev/md/pwx1
> /dev/md/pwx1:
>            Version : 1.2
>      Creation Time : Tue Mar 17 15:29:31 2026
>         Raid Level : raid0
>         Array Size : 1677589504 (1599.87 GiB 1717.85 GB)
>       Raid Devices : 1
>      Total Devices : 1
>        Persistence : Superblock is persistent
>
>        Update Time : Mon Mar 23 20:52:51 2026
>              State : clean
>     Active Devices : 1
>    Working Devices : 1
>     Failed Devices : 0
>      Spare Devices : 0
>
>         Chunk Size : 1024K
>
> Consistency Policy : none
>
>               Name : any:pwx1
>               UUID : 1716a351:ed3e53e7:0ce83ccd:8d3a3021
>             Events : 16
>
>     Number   Major   Minor   RaidDevice State
>        0     253       10        0      active sync   /dev/dm-10
> [root@root core]#
> ```
