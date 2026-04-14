Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561C3ED100
	for <linux-lvm@lists.linux.dev>; Tue, 14 Apr 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181849; cv=pass; b=im40+bbMr7E5fPRp0m2qOVhdDiU7pqwNeTJmAEv0zpUCmKYf56DxpAAWcKpqa3tgeHa23w8W7Jgue6MCBOsZJlNOkPinJmDYdm0PHV3myRH0EKf2oJ4ATfoN6EMCNOwMJlCiS/2LA4zaOmql6HA83EF3xvUQ5u7f83jYGmG7e2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181849; c=relaxed/simple;
	bh=onf+SvGPemenjCHl/l4rEC/CNfS+tLsjvcCVLf6tnME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPA1LHyrlucNxMLUzZ5Zsb8xlWZPKhjSCGtkOOxnsinWtEjtYwFtJWubbK8pGB9NUS7DAQNeQbuTgmNUaRZpOntsFEluZ/tepjHrTcMiAWZCg9teaFXwBcuAXP1lGGuNtkQeyVkhrnVoqEp3qf9TuLVyM6LHuBB6HJnSuDI0XsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fUOUu2W6; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fUOUu2W6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f344e880bso1669657b3a.3
        for <linux-lvm@lists.linux.dev>; Tue, 14 Apr 2026 08:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776181846; cv=none;
        d=google.com; s=arc-20240605;
        b=XjwPH+KLNDkoynUyrAO+OqojgRUTxb0Wiwb/AVdyerjjnMyHRKmtsE2255htA2sh9j
         HHOcXiGPSl9oQO8cVe0G+mITt63eYLR/OQ2zTu5UviuqKl+zrF2SdaClWyYJyKRL4moo
         sTmoi12AHcaIQtEida6iksXs6xEaj7IDkjzDXdABTY/+1Nt8R21AoRYj+Kycxs3oH8N3
         E+BilLAEg0PCWAOySQ1NR2p+BZPwuxPPOvcpSikBxnOszCpMuuhPOr90LVByrh1kZN8Y
         eoM6OMD8EpqnhtyBIzvc+8Fkc/qyds4DBXDJeryZTdMmU50JJcEH/wjnh4NWFFVUahO+
         ebGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCiLf6J3GcNvdeWXHEfW/pgrGHYo45glw8I/V1tVIWA=;
        fh=ZIyhTZcUpHZWP2x5HHOnRzppmJEI4whRzxLLc1uBYeQ=;
        b=MlEunNcG/QJrRhdAbAOdfrj3idBRTXfHjGy+jv77V0BHgkjiATOKAewsejyXKKobaR
         o3Q+IU6qrA3i6GJYCE/G3yprpYtL0NJVU20s3WlELmfqR61qt0arKA6MniCukLza6+b2
         E4USjJqLa4A+1WpD3GAnHFvhL8ktN35qTzGJAEuArvsEqVbgzj9YwpqwPCZERo/EPrbA
         kz9orZcs7qGVjNwUau/69Y47pyG6IYsnv3+UdB8vcir+zKPvkV/sHyGqtFswA7iVkYvW
         oQwZZJQBFdjr2fHMOUxA7Y6VHI1bQc2hOenAz3Bet37bmqip80yD7RRhA61Gp/F/pQyN
         Bnfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1776181846; x=1776786646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCiLf6J3GcNvdeWXHEfW/pgrGHYo45glw8I/V1tVIWA=;
        b=fUOUu2W6py4LX9IEgoQpeuZQr6RnUQEw2NRsGnIQmNJkxHoZor+H090E0t81Rgudpz
         4UIldMU2ewEsF/xq/3MGIDtYbw1xUaCSoRfpF2bQn+u/GHyxsthAm5PtKp3ehQqEcEi5
         axkfM+XT02HUDZRzh1+Fq6dUscJV/OClVvLNXKBvknrduhx5AowhrwFp4jW4zw+PjM/Q
         ywHePTGb27T/cSzNTrv+eyiQ23kjnoR7ky74FOZwniOsjk0nprBZTMVuFqpFaaH6JoOI
         04idI68OeROICbuMO0twGFHBRJ47X1EXRtoHN+UKUKgUgZGg4ER2XjLTMIW51y3cF4nB
         04mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776181846; x=1776786646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCiLf6J3GcNvdeWXHEfW/pgrGHYo45glw8I/V1tVIWA=;
        b=akeRRWZOCzv8+8eaNnxVIzz1zOCuxFTje0SEsKF+c035iDlqAKdwXsGt2kQ1wUS533
         mHrJre2pmgWmV14ot6ett7i5BqYx7Jf/ZA//j1YKnI5w43KerT41CBxSvJzGUpPjHO3u
         uG7uzd+MXBsaM8H/pOYEgFJp5I4JQCfaUK/efdQJ9VyMqUCRwsl9gsMSjKXl0+W6kQ07
         G2OZ0HKupQdNAS40eHn8dVy9x0tRp+1GC6wv8N9sq7RrW1ZW9fHKjQt2hZhGFq2pXV1r
         Co/v4dCQx5JU3Yg4d9GrBd1VO8WI4i/8dPJShtmuw+OOmvmxahrNa35K021RMsTqlrsl
         hRQw==
X-Gm-Message-State: AOJu0YymY5WMPe2L6hRkw3rrQMsd3XWIW2nix5XptnrTUzsXIIbo8vJ3
	JCZO8Bcwikiry9mpfXoF64Fg7+jJfg8eGC9j0xqzi4MB7ng+5m5Znt3fmNDLJKhK1JKvfc0rz6i
	+VnwT2NNbb6SK9jgAzimsk7Ltu6qQsSLaPH9YekvlI7+yaFEMe+7gCCg=
X-Gm-Gg: AeBDietlC6gBaUjZWsmfBf9hluYXsubv3jhr+3FesKBxxapqq5SNjOuMoGZ81wiFuBW
	vWK1cCoHxIX5iSbSYfp8ZdLeCD3EoGuJjWpjwHonIVs/hvc1j099LiLRMSwkk7Kn5Vym/07EpLk
	UF0WYvm7YAm4kNdbQhWazEpPPPhtNPWGSmQZ8oDF82KW9G/OZ1w+V3MsnQntI0NdErv9HPkPjd2
	UStGf2d9zyJp1Xx8m9uV0R541+t1p61Ue/CVcewUv0CTwV4kfCotW3RjSkuyuw6PlrLYuacUkRv
	HxdCRagle2rqDE2QeHEE8xMhZNQhzQ==
X-Received: by 2002:a05:6a00:3907:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-82f0c29fed7mr18564038b3a.25.1776181845444; Tue, 14 Apr 2026
 08:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFe+wq3EXW0n_bLCri0zC2zVQK987D3x5LY+GiOpaLsgZxk4Rw@mail.gmail.com>
 <CAFe+wq1RNJiiaak5dJycDsRBZ08ga1YQGYh4QTS9mV353YPLmw@mail.gmail.com>
 <CALjSBEurs6mNvR1YdoF-UVEjJUpycahcOxU2Ok6YYh-jBJNwKw@mail.gmail.com>
 <CAFe+wq25Few1Vx-TzKgCuFZ6tnVw=nuOFdhsR99ARM5PADuSDQ@mail.gmail.com> <CALjSBEuyC3U2RYj+tUVE+su6GaXi6bNp9fh3sMCOCsi0Cd-E0Q@mail.gmail.com>
In-Reply-To: <CALjSBEuyC3U2RYj+tUVE+su6GaXi6bNp9fh3sMCOCsi0Cd-E0Q@mail.gmail.com>
From: Lakshmi Narasimhan Sundararajan <lsundararajan@purestorage.com>
Date: Tue, 14 Apr 2026 21:20:33 +0530
X-Gm-Features: AQROBzCj3VPuGI626hOY6CvVp6PReyV9_vXAWfXtu-_z5XqyXT0Slqd2Q5zp71Q
Message-ID: <CAFe+wq0bLF3zzXzDJRi3aZqcnS7dbpxT9sdEQ7RSdH8sWGg7tQ@mail.gmail.com>
Subject: Re: Reg dm thin pool metadata inconsistency
To: Ming Hung Tsai <mtsai@redhat.com>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 8:38=E2=80=AFPM Ming Hung Tsai <mtsai@redhat.com> w=
rote:
>
> Hi Lakshmi,
>
> On Tue, Apr 14, 2026 at 8:03=E2=80=AFPM Lakshmi Narasimhan Sundararajan
> <lsundararajan@purestorage.com> wrote:
> >
> > Hi Ming,
> >
> > I do not have the raw metadata unfortunately, did not collect from the
> > customer recovery.
> > We do have discard_passdown enabled on those setups where the issue occ=
urred.
>
> Do you mean there's a "discard_passdown" flag in the `dmsetup status` out=
put?
> The feature counter for the thin-pool table is set to 2, with
> skip_block_zeroing as the first flag, and the second flag appears to
> be truncated.
> Could you provide the name of the second flag, if present?
>
> "0 3311132672 thin-pool 253:12 253:13 128 0 2 skip_block_zeroing ..."


Yes these are SAN volumes that are provisioned for use.
Hence discard_passdown is turned ON, I can confirm on that.

Regards

>
>
>
> > Have you seen this problem before?
> >
> > On Tue, Apr 14, 2026 at 4:58=E2=80=AFPM Ming Hung Tsai <mtsai@redhat.co=
m> wrote:
> > >
> > > Hi,
> > >
> > > I have two questions posted inline.
> > >
> > > On Tue, Apr 14, 2026 at 1:59=E2=80=AFAM Lakshmi Narasimhan Sundararaj=
an
> > > <lsundararajan@purestorage.com> wrote:
> > > >
> > > > Good day!
> > > >
> > > > A gentle ping to hear an update from the authors here. More updates=
 inline.
> > > >
> > > > On Sat, Apr 11, 2026 at 5:41=E2=80=AFPM Lakshmi Narasimhan Sundarar=
ajan
> > > > <lsundararajan@purestorage.com> wrote:
> > > > >
> > > > > Hi LVM Team! A very good day to you all.
> > > > > [ I hope this email is the right one now]
> > > > >
> > > > > I recently experienced an outage where thin pool activation faile=
d,
> > > > > details are as follows.
> > > > > Good news is, I was able to recover the pool through thin_repair.
> > > > > Thank goodness!
> > > > >
> > > > > There was no infra induced failure i.e. no network, disk, usage o=
ver
> > > > > limit, memory or compute being faulty orover used in any way.
> > > > > Node was running healthy for 13 days and suddenly hit this issue.
> > > > > Pool would handle I/O load (including discards), new volume
> > > > > creation/deletion, and other regular activities.
> > > > >
> > > > > I tried to identify if there is a direct known issue, but I was u=
nable to.
> > > > > This generally seems to be some known issue, but I am unable to f=
ind a
> > > > > direct link with the same signature.
> > > > >
> > > > > a) how to induce thin pool failures at will, so thin pool does no=
t
> > > > > activate, but repair succeeds, so  I can test this recovery in so=
me
> > > > > controlled form.
> > > >
> > > > I have found a way, I think I can pull out the metadata xml and mod=
ify
> > > > highest transaction and rewrite the metadata and swap the pool to
> > > > recreate this condition.
> > > > pool activation will fail and thin_repair can correct it. Any easie=
r
> > > > way that my suggestion, please feel free to suggest.
> > >
> > > Were you able to reproduce the issue on your end? I'm concerned that
> > > using metadata rebuilt from XML might not trigger the bug because the
> > > rebuilt layout differs from the original.
> > >
> > > Could you please provide the raw metadata image prior to any repairs?
> > > This will allow us to investigate the issue further.
> > >
> > >
> > > > > b) To your best knowledge this seems a known issue and fixed in a=
 later release?
> > > > > I did my search at both kernel bugzilla and RHEL - and I am hopin=
g you
> > > > > can help me find it. Internet searches point to errata pages, but=
 I am
> > > > > unable to find the
> > > > > exact ticket, commit that address this. The OCP platform was runn=
ing a
> > > > > recent release from RHEL.
> > > > > Linux kernel: 5.14.0-427.109.1.el9_4 RHEL 9.4 This is likely 2 ye=
ars old though.
> > > >
> > > > So far I and my team have not been able to reproduce this issue, an=
d
> > > > look to your help confirming whether
> > > > a) is this known already and is fixed!
> > > > b) whats the safest kernel to upgrade to?
> > > > c) still an open issue!
> > > >
> > > > >
> > > > > c) After spending some time reviewing thin code and the commits s=
ince
> > > > > the mentioned
> > > > > kernel from kernel.org linux.. I suspect it could be a race with
> > > > > discard and either IO or device creation/deletion on the same poo=
l
> > > > > could cause this?
> > > > > Could the authors here, please confirm my code reading below.
> > > > > ```
> > > >
> > > > As mentioned we tried a focussed reproducer around this, but unable=
 to
> > > > trigger the issue.
> > > > There are volume creation/deletions, snapshot creations and deletio=
ns,
> > > > discards and regular IO at any point on the thin pool.
> > > > And in addition, there would be calls to reserve/release the thin
> > > > metadata to capture diff for backup between volumes.
> > > > These are serialized at our app layer and I also see these are
> > > > serialized within lvm layer too.
> > > >
> > > > Our volume deletions are 2 phased, based on our earlier discussion =
in
> > > > this thread, we had observed high IO latency when volumes are delet=
ed
> > > > and the suggestion from this team was to discard and then delete
> > > > volumes to keep the deletion time short.
> > > >
> > > > I hope this is giving enough context to understand this better.
> > > > Unfortunately, since I am unable to reproduce this and have this
> > > > sighted now twice at customer, I have no more datapoints to add.
> > > > Would be willing to hear out if you have any suggestions I can purs=
ue in house.
> > > >
> > > > Best regards
> > > >
> > > >
> > > > > *** phase 1 - userspace issues blkdiscard on thin volumes ***
> > > > >   dm-thin.c : thin_bio_map()
> > > > >     =E2=86=92 detects REQ_OP_DISCARD
> > > > >     =E2=86=92 thin_defer_bio_with_throttle(tc, bio)
> > > > >       =E2=86=92 adds bio to tc->deferred_bio_list        // QUEUE=
D, not processed
> > > > >       =E2=86=92 wakes pool worker thread
> > > > >
> > > > >   dm-thin.c : do_worker()                         // runs ASYNCHR=
ONOUSLY
> > > > >     =E2=86=92 process_deferred_bios()
> > > > >       =E2=86=92 process_thin_deferred_bios()
> > > > >         =E2=86=92 process_discard_bio()
> > > > >           =E2=86=92 creates mapping, adds to pool->prepared_disca=
rds
> > > > >     =E2=86=92 process_prepared(pool->prepared_discards)
> > > > >       =E2=86=92 process_prepared_discard_no_passdown(m):
> > > > >         =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
> > > > >             [dm-thin-metadata.c]
> > > > >           =E2=86=92 dm_btree_remove_leaves()
> > > > >               [dm-btree-remove.c]
> > > > >             =E2=86=92 data_block_dec()                    // for =
each data block
> > > > >                 [dm-thin-metadata.c]
> > > > >               =E2=86=92 dm_sm_dec_blocks()                // DECR=
EMENTS refcount
> > > > >                   [dm-space-map-common.c]
> > > > >
> > > > > ***  phase 2: these steps still be IN PROGRESS or QUEUED when
> > > > > userspace deletes the thin volume ***
> > > > >
> > > > >   dm-thin.c : thin_dtr()                          // dmsetup remo=
ve
> > > > >     =E2=86=92 list_del_rcu(&tc->list)                     // remo=
ves from
> > > > >                                                   //   pool->acti=
ve_thins
> > > > >     =E2=86=92 synchronize_rcu()
> > > > >     =E2=86=92 dm_pool_close_thin_device(tc->td)           // open=
_count--
> > > > >     =E2=86=92 kfree(tc)                                   // tc F=
REED
> > > > >
> > > > >     *** does NOT flush pool workqueue ***          =E2=86=90 GAP =
1
> > > > >     *** does NOT drain prepared_discards ***       =E2=86=90 GAP =
2
> > > > >
> > > > >   dm-thin.c : process_delete_mesg()               // dmsetup mess=
age
> > > > >     =E2=86=92 dm_pool_delete_thin_device(pool->pmd, dev_id)
> > > > >         [dm-thin-metadata.c : __delete_device()]
> > > > >       =E2=86=92 dm_btree_remove(&pmd->tl_info, ...)       // remo=
ve from top-level
> > > > >           [dm-btree-remove.c]                      //   btree
> > > > >         =E2=86=92 subtree_dec()                            // cas=
cades into:
> > > > >             [dm-thin-metadata.c]
> > > > >           =E2=86=92 dm_btree_del()                         // wal=
ks ALL leaves
> > > > >               [dm-btree.c]
> > > > >             =E2=86=92 data_block_dec() for EVERY remaining block
> > > > >                 [dm-thin-metadata.c]
> > > > >               =E2=86=92 dm_sm_dec_blocks()                 // DEC=
REMENTS refcount
> > > > >                   [dm-space-map-common.c]          //   for ALL b=
locks
> > > > >
> > > > > ** phase 3: KERNEL (worker thread =E2=80=94 still running from Ph=
ase 1) ***
> > > > >   dm-thin.c : do_worker()                         // ASYNC, still=
 running
> > > > >     =E2=86=92 process_prepared(pool->prepared_discards)
> > > > >       =E2=86=92 process_prepared_discard_no_passdown(m):
> > > > >         =E2=86=92 m->tc points to FREED tc                // =E2=
=86=90 use-after-free risk
> > > > >         =E2=86=92 dm_thin_remove_range(tc->td, begin, end)
> > > > >             [dm-thin-metadata.c]
> > > > >           =E2=86=92 dm_btree_remove_leaves()
> > > > >               [dm-btree-remove.c]
> > > > >             =E2=86=92 data_block_dec()                    // SAME=
 blocks already
> > > > >                 [dm-thin-metadata.c]              //   decremente=
d in
> > > > >               =E2=86=92 dm_sm_dec_blocks()                //   Ph=
ase 2!
> > > > >                   [dm-space-map-common.c]
> > > > >
> > > > >                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> > > > >                   sm_ll_dec_bitmap():
> > > > >                     old =3D sm_lookup_bitmap(ic->bitmap, bit);
> > > > >                     switch (old) {
> > > > >                     case 0:  // =E2=86=90 refcount ALREADY 0
> > > > >                       DMERR("unable to decrement block");
> > > > >                       return -EINVAL;  // -22
> > > > >                     }
> > > > >                                  [dm-space-map-common.c]
> > > > >                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> > > > >
> > > > >                           =E2=96=BC
> > > > >                 dm_tm_shadow_block() fails (corrupted space map)
> > > > >                     [dm-transaction-manager.c]
> > > > >
> > > > >                           =E2=96=BC
> > > > >                 dm_pool_inc_data_range() fails with -EINVAL (-22)
> > > > >                     [dm-thin-metadata.c]
> > > > >
> > > > >                           =E2=96=BC
> > > > >                 metadata_operation_failed(pool, "dm_pool_inc_data=
_range")
> > > > >                     [dm-thin.c]
> > > > >
> > > > >                           =E2=96=BC
> > > > >                 set_pool_mode(pool, PM_READ_ONLY)
> > > > >                     [dm-thin.c]
> > > > >
> > > > >                 *** POOL IS NOW DEAD ***
> > > > > ```
> > > > >
> > > > >
> > > > >
> > > > > As always, many thanks for your help.
> > > > >
> > > > >
> > > > > # issue unable to activate thin pool
> > > > > ```
> > > > > [Wed Apr  8 17:05:14 2026] device-mapper: space map common: unabl=
e to
> > > > > decrement block
> > > > > [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unabl=
e to
> > > > > decrement block
> > > > > [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> > > > > dm_tm_shadow_block() failed
> > > > > [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unabl=
e to
> > > > > decrement block
> > > > > [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> > > > > dm_tm_shadow_block() failed
> > > > > [Wed Apr  8 17:08:11 2026] device-mapper: space map common: unabl=
e to
> > > > > decrement block
> > > > > [Wed Apr  8 17:08:11 2026] device-mapper: space map common:
> > > > > dm_tm_shadow_block() failed
> > > > > [Wed Apr  8 17:08:31 2026] device-mapper: space map common: unabl=
e to
> > > > > decrement block
> > > > > [Wed Apr  8 17:08:31 2026] device-mapper: space map common:
> > > > > dm_tm_shadow_block() failed
> > > > > [Wed Apr  8 17:08:31 2026] device-mapper: space map common: unabl=
e to
> > > > > decrement block
> > > > > [Wed Apr  8 17:08:31 2026] device-mapper: space map common:
> > > > > dm_tm_shadow_block() failed
> > > > > ```
> > > > >
> > > > > # host and lvm tools version
> > > > > ```
> > > > > uname -a
> > > > > Linux kernel: 5.14.0-427.109.1.el9_4
> > > > > RHEL 9.4
> > > > >
> > > > > lvm version
> > > > > 2.03.23(2) (2023-11-21)
> > > > > library: 1.02.197 (2023-11-21)
> > > > > driver: 4.48.1
> > > > > ```
> > > > >
> > > > > Below are references to the node block layer.
> > > > > There was IO, thin volume creations and deletions, IO includes di=
scards too.
> > > > > ```
> > > > > [root@root core]# lvs -a pwx1
> > > > >   Please remove the lvm.conf global_filter, it is ignored with th=
e devices file.
> > > > >   LV                  VG   Attr       LSize   Pool   Origin
> > > > >   Data%  Meta%  Move Log Cpy%Sync Convert
> > > > >   1004123733318649769 pwx1 Vwi-a-t---  50.00g pxpool 660563940592=
999863  0.25
> > > > >   103699400925372609  pwx1 Vwi-a-t--- 750.00g pxpool 111571246884=
7455249 59.75
> > > > >   1072608604746349133 pwx1 Vwi-a-t---  50.00g pxpool 941788757364=
603035  0.25
> > > > >   1115712468847455249 pwx1 Vwi-aot--- 750.00g pxpool             =
        59.75
> > > > >   1138695541641144166 pwx1 Vwi-a-t---  50.00g pxpool 941788757364=
603035  0.25
> > > > >   136169780918964477  pwx1 Vwi-aot---  30.00g pxpool             =
        33.33
> > > > >   218651423266852202  pwx1 Vwi-aot---   5.00g pxpool             =
        3.49
> > > > >   404947242154831849  pwx1 Vwi-aot---   5.00g pxpool             =
        4.20
> > > > >   440731835552948333  pwx1 Vwi-aot---  50.00g pxpool             =
        5.59
> > > > >   462681831690737818  pwx1 Vwi-a-t---  50.00g pxpool 730899597722=
82964   0.25
> > > > >   519898065353250833  pwx1 Vwi-a-t---  50.00g pxpool 660563940592=
999863  0.25
> > > > >   527922274169222783  pwx1 Vwi-aot--- 200.00g pxpool             =
        28.64
> > > > >   537994915504805835  pwx1 Vwi-aot---  50.00g pxpool             =
        10.88
> > > > >   569690966828279529  pwx1 Vwi-a-t--- 750.00g pxpool 111571246884=
7455249 59.75
> > > > >   594992999737145586  pwx1 Vwi-aot--- 200.00g pxpool             =
        28.91
> > > > >   660563940592999863  pwx1 Vwi-aot---  50.00g pxpool             =
        0.25
> > > > >   702358223003836192  pwx1 Vwi-aot--- 200.00g pxpool             =
        28.64
> > > > >   73089959772282964   pwx1 Vwi-aot---  50.00g pxpool             =
        0.25
> > > > >   793515512579595979  pwx1 Vwi-aot---  30.00g pxpool             =
        33.33
> > > > >   79731196567060146   pwx1 Vwi-aot---  50.00g pxpool             =
        10.90
> > > > >   865397616123963982  pwx1 Vwi-aot---  50.00g pxpool             =
        9.39
> > > > >   866802183893693297  pwx1 Vwi-aot--- 200.00g pxpool             =
        28.91
> > > > >   941788757364603035  pwx1 Vwi-aot---  50.00g pxpool             =
        0.25
> > > > >   960350716126095496  pwx1 Vwi-a-t---  50.00g pxpool 730899597722=
82964   0.25
> > > > >   [lvol0_pmspare]     pwx1 ewi-------   2.00g
> > > > >   pxMetaFS            pwx1 Vwi-aot---  64.00g pxpool             =
        0.05
> > > > >   pxpool              pwx1 twi-aot---   1.54t
> > > > >   43.59  5.06 <<< very low tmeta util.
> > > > >   [pxpool_tdata]      pwx1 Twi-ao----   1.54t
> > > > >   [pxpool_tmeta]      pwx1 ewi-ao----   4.00g
> > > > >   pxreserve           pwx1 -wi------k  15.00g
> > > > > [root@root core]#
> > > > > [root@root core]# vgs pwx1
> > > > >   Please remove the lvm.conf global_filter, it is ignored with th=
e devices file.
> > > > >   VG   #PV #LV #SN Attr   VSize VFree
> > > > >   pwx1   1  27   0 wz--n- 1.56t    0
> > > > > [root@root core]# lsblk -s /dev/pwx1/1004123733318649769
> > > > > NAME                                         MAJ:MIN RM  SIZE RO =
TYPE
> > > > > MOUNTPOINTS
> > > > > pwx1-1004123733318649769                     253:107  0   50G  0 =
lvm
> > > > > =E2=94=94=E2=94=80pwx1-pxpool-tpool                          253:=
14   0  1.5T  0 lvm
> > > > >   =E2=94=9C=E2=94=80pwx1-pxpool_tmeta                        253:=
12   0    4G  0 lvm
> > > > >   =E2=94=82 =E2=94=94=E2=94=80md126                              =
      9:126  0  1.6T  0 raid0
> > > > >   =E2=94=82   =E2=94=94=E2=94=80eui.00806e28521374ac24a9371800098=
2be 253:10   0  1.6T  0 mpath
> > > > >   =E2=94=82     =E2=94=9C=E2=94=80nvme4n2                        =
    259:5    0  1.6T  0 disk
> > > > >   =E2=94=82     =E2=94=9C=E2=94=80nvme5n2                        =
    259:8    0  1.6T  0 disk
> > > > >   =E2=94=82     =E2=94=94=E2=94=80nvme6n2                        =
    259:11   0  1.6T  0 disk
> > > > >   =E2=94=94=E2=94=80pwx1-pxpool_tdata                        253:=
13   0  1.5T  0 lvm
> > > > >     =E2=94=94=E2=94=80md126                                    9:=
126  0  1.6T  0 raid0
> > > > >       =E2=94=94=E2=94=80eui.00806e28521374ac24a93718000982be 253:=
10   0  1.6T  0 mpath
> > > > >         =E2=94=9C=E2=94=80nvme4n2                            259:=
5    0  1.6T  0 disk
> > > > >         =E2=94=9C=E2=94=80nvme5n2                            259:=
8    0  1.6T  0 disk
> > > > >         =E2=94=94=E2=94=80nvme6n2                            259:=
11   0  1.6T  0 disk
> > > > > [root@root core]# ls -al /dev/md/pwx1
> > > > > lrwxrwxrwx. 1 root root 8 Apr 11 11:48 /dev/md/pwx1 -> ../md126
> > > > > [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool-tpool
> > > > > 0 3311132672 thin-pool 253:12 253:13 128 0 2 skip_block_zeroing
> > >
> > > The second feature flag was truncated. Does the thin-pool has
> > > no_discard_passdown enabled?
> > >
> > >
> > > > > [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tdata
> > > > > 0 1008459776 linear 9:126 35653632
> > > > > 1008459776 629145600 linear 9:126 1048307712
> > > > > 1637605376 1673527296 linear 9:126 1681647616
> > > > > [root@root core]# dmsetup table /dev/mapper/pwx1-pxpool_tmeta
> > > > > 0 4194304 linear 9:126 1044113408
> > > > > 4194304 4194304 linear 9:126 1677453312
> > > > > [root@root core]#
> > > > > [root@root core]# dmsetup table --target multipath
> > > > > 3500a07513c1e23c4: 0 3750748848 multipath 0 0 1 1 service-time 0 =
1 2 8:16 1 1
> > > > > 3500a07513c1e2ade: 0 3750748848 multipath 0 0 1 1 service-time 0 =
1 2 8:64 1 1
> > > > > 3500a07513c1e2ca8: 0 3750748848 multipath 0 0 1 1 service-time 0 =
1 2 8:80 1 1
> > > > > 3500a07513c1e2cf3: 0 3750748848 multipath 0 0 1 1 service-time 0 =
1 2 8:0 1 1
> > > > > 3500a07513c1e3afc: 0 3750748848 multipath 0 0 1 1 service-time 0 =
1 2 8:48 1 1
> > > > > eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 0 0 =
1 1
> > > > > service-time 0 1 2 259:2 1 1
> > > > > eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 0 0 =
1 1
> > > > > service-time 0 1 2 259:0 1 1
> > > > > eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 0 0 =
1 1
> > > > > service-time 0 1 2 259:3 1 1
> > > > > eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 0 0 =
1 1
> > > > > service-time 0 1 2 259:1 1 1
> > > > > eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 3
> > > > > retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 =
1
> > > > > 259:4 1 259:7 1 259:10 1
> > > > > eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 3
> > > > > retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 =
1
> > > > > 259:5 1 259:8 1 259:11 1
> > > > > eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 3
> > > > > retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 3 =
1
> > > > > 259:6 1 259:9 1 259:12 1
> > > > > [root@root core]# dmsetup status --target multipath
> > > > > 3500a07513c1e23c4: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:1=
6 A 0 0 1
> > > > > 3500a07513c1e2ade: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:6=
4 A 0 0 1
> > > > > 3500a07513c1e2ca8: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:8=
0 A 0 0 1
> > > > > 3500a07513c1e2cf3: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:0=
 A 0 0 1
> > > > > 3500a07513c1e3afc: 0 3750748848 multipath 2 0 0 0 1 1 A 0 1 2 8:4=
8 A 0 0 1
> > > > > eui.000000000000000100a075223f0c4773: 0 3125627568 multipath 2 0 =
0 0 1
> > > > > 1 A 0 1 2 259:2 A 0 0 1
> > > > > eui.000000000000000100a075223f0c47a6: 0 3125627568 multipath 2 0 =
0 0 1
> > > > > 1 A 0 1 2 259:0 A 0 0 1
> > > > > eui.000000000000000100a075233fc94da6: 0 3125627568 multipath 2 0 =
0 0 1
> > > > > 1 A 0 1 2 259:3 A 0 0 1
> > > > > eui.000000000000000100a075233fc94de4: 0 3125627568 multipath 2 0 =
0 0 1
> > > > > 1 A 0 1 2 259:1 A 0 0 1
> > > > > eui.00806e28521374ac24a93718000982bd: 0 14680064000 multipath 2 0=
 0 0
> > > > > 1 1 A 0 3 1 259:4 A 1 22 259:7 A 1 21 259:10 A 1 22
> > > > > eui.00806e28521374ac24a93718000982be: 0 3355443200 multipath 2 0 =
0 0 1
> > > > > 1 A 0 3 1 259:5 A 1 4 259:8 A 1 6 259:11 A 1 11
> > > > > eui.00806e28521374ac24a93718000982bf: 0 134217728 multipath 2 0 0=
 0 1
> > > > > 1 A 0 3 1 259:6 A 1 0 259:9 A 1 0 259:12 A 1 0
> > > > > [root@root core]#
> > > > > [root@root core]# mdadm -D /dev/md/pwx1
> > > > > /dev/md/pwx1:
> > > > >            Version : 1.2
> > > > >      Creation Time : Tue Mar 17 15:29:31 2026
> > > > >         Raid Level : raid0
> > > > >         Array Size : 1677589504 (1599.87 GiB 1717.85 GB)
> > > > >       Raid Devices : 1
> > > > >      Total Devices : 1
> > > > >        Persistence : Superblock is persistent
> > > > >
> > > > >        Update Time : Mon Mar 23 20:52:51 2026
> > > > >              State : clean
> > > > >     Active Devices : 1
> > > > >    Working Devices : 1
> > > > >     Failed Devices : 0
> > > > >      Spare Devices : 0
> > > > >
> > > > >         Chunk Size : 1024K
> > > > >
> > > > > Consistency Policy : none
> > > > >
> > > > >               Name : any:pwx1
> > > > >               UUID : 1716a351:ed3e53e7:0ce83ccd:8d3a3021
> > > > >             Events : 16
> > > > >
> > > > >     Number   Major   Minor   RaidDevice State
> > > > >        0     253       10        0      active sync   /dev/dm-10
> > > > > [root@root core]#
> > > > > ```
> > > >
> > >
> > >
> >
>
>
