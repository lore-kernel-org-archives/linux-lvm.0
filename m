Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795251673;
	b=r0erfXJ6Cff98LO1GSfGTOfjzZ1YvuhfdfklO25MadpkP7LTNdRsCGDyGwioZkZCuZUR
	 Tp4QV9kcX9L5LWS8pulCRvQcTo6u3iGOyC6CWe3wAWpQ8bboXdC26U4k8yjyrtnTt8flz
	 P9H4+L4YPMe5DqX+CoVKN0BkgxbENJElBbMjaccIqZvIbbDocnepNxixVTzHDC6tdnhyd
	 SmcrMfLgfHzKI/2Hv3s4Wg7+k8fVwNuOf+qEW1oCasstL8ki1JeAwc9Mwx1AlG92nEzN9
	 cTC7KQxpFj8cZiS/OZPvStcFEvZRmlt11efSPB8tAX6+kYR5MeY2bLkzOHDsZbkkmNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795251673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8gFQXpwozw9+rTYifVCIwnEBcus34OEppRVv5lCKiXk=;
	b=mPDTch7GBfk1PFle0nf0Wt7DU4zvP+Uq6NOs1Lv2ACfigW6coJMQhHfHgiu7Gsl3C16J
	 +qoplWt1OE7P7F9ig8QBVQJtDgY5a0XANHsMuLUxBFqqdCdmDsXIRBwoiU5I3gxH+I6Jx
	 gBTKEqSnKqorLUjvdflV+KwvQLmXLRtEvLWFBLLXTXQnx9RHNS9u1Q2Sr2vlajW3kVjVK
	 OvB40QBvMHevi+AG0iJvjy+SyCmK6SpTgs1w2X3XUDpQrzWhdqr6QUvJKlVS2mfUFY9a6
	 SYDmZS5KA1Ss3o5lc6Os3YYVN8NCZEUGWx6+6MYcG1LtkbuEi71HQoQEKgyprqGChMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBImVxT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789F606A325
	for <linux-lvm@lists.linux.dev>; Sat, 21 Nov 2026 09:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7789F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBImVxT
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so3836213c88.1
        for <linux-lvm@lists.linux.dev>; Sat, 21 Nov 2026 01:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795251672; cv=none;
        d=google.com; s=arc-20260327;
        b=p9b4iWH1vDNWMPOS1xWjdVq0XaIxJZBWwo22lBz48THTPcXpwiqjMSai4IvKSHAfB5
         a/TKH9B6haTRNtfSGMi5XJ45hgVC2N+QHm6T/XK73QQzSJhfUiDalyod5zfRDJyuXWmP
         K8HTBde3RpMwWNlVm/XlcyiZhvffW7roqrrze3z2U/rL7bwzHG1zSeo82FPGlRxCGS1Q
         dZ9uaSW2FE8ywT5a1swqSbkqnFi1fke7NGlSvKwi9cqWl3pbLzj+M0P+JZI4iL+UBspb
         E6Gad13evM+g0zzDsnnBRJsZKeXTNVAhbyCuBWOa5ut9DsM8Fz0g+sS7wvFm3ny6lDPq
         rrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gFQXpwozw9+rTYifVCIwnEBcus34OEppRVv5lCKiXk=;
        fh=bI1uf/8tyvfA/zxI6/vbELWhwLKSEjPDDcbEYm8jrf8=;
        b=T9JO+eteoVopOSEACh3Y0QHrWpulN77Oe22RRXFqLte4d/Lx1F2td5DA0qODawhZMb
         II0mz2YO4r1mW5AWyviSasLbQzRF1IUwtAqwovtK2z77jUen48YN9Lf4tI/FA+jh/6Iy
         T4Jn+Zxe11P+cKfCvPf75QqSzVdGooeWgZjzkAbQCt4v9KeNv0OqMlndEjsiFRw86FOa
         z6O+7F/ECYo2O6yN0Ldg8NjPvBmeEIIiYmRtslFRaAs5Fk8biNe+bVz/Jb+jAAkFa7YK
         9z0+90oZrXq8ShMscNd6AYueaXtWxtGzIl8uBsQDQaUZC3UrhmfqYSENAxmKVU1pPkmB
         iMMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795251672; x=1795856472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gFQXpwozw9+rTYifVCIwnEBcus34OEppRVv5lCKiXk=;
        b=KZBImVxTTGg7wdI9a359gy4waG1HYA1RYRaCVRBjUJ/VgzZtCMrnhLogUzIV2bUDHp
         GQJ+vFZEHwiZsjDOD3olzs8Jzo8ZgTSF5Ov9JTe21Hh63fr9rqc9TNGUH9y5YRFAWVbK
         SySzFvjLnySxFA+bD+66In3/T+M+C4bhCzgTmyn69vx5JqfjmHN2EFlAzyf2dyZta486
         VTi4/Xo6dQRtFBstxJdOVXpWH2UU17LmohEVKsSFQ1wBfE9MFHxebN3eM+JACs9YD/XW
         0oT5SBe8rMbjFduM3WZWHyZcDXt3T5XRFfk9Ha7LgPvUFg9aS3dfjzNPnG4ML3u+fvpa
         nHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251672; x=1795856472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gFQXpwozw9+rTYifVCIwnEBcus34OEppRVv5lCKiXk=;
        b=fuVG31Fk/b7YXGeZ7RSw9+s7/xiJ2hJdH8BR9NPh1rApQO1XTS5MJBHpfRyy+kjI+H
         yvZPPzgD6njfxI6Z8Cj8oL+5WlUCZjx0W8NxLZh5QRRPa8aKK7UKSPbPXxjLpn+L95rc
         AIb/SqvLVVpM+Kol1Zy37SwsI+xfhkvTht+kWaPrqIQHV8LQ6V8y4HHoqvDVYoo/4hEF
         FjXjbkT9F0OcbrbwpEtcNVSoK1uQ62c8qgHmoM/0UA3qGag9ecx0jINhCI/HMmOF4fKz
         PTyHc0zPmjVF+Xu2vNs0wu52QQGQs1Z07OGn7aN8KZCoe+ADnV3B71b5RbJBO0ih+O7Y
         f/yA==
X-Gm-Message-State: APuU4Z+90Ia/vyiAvB8ZESMpmxAv+9SBBiM9pRUL7xIAwGfaQ8NZDaXV
	+AWHDKMilqzS4V6KfXd6nEATCve+N36rGwNtMjuB+ttejYBg/xak4sjTo3emeTMxdxnYIUrwSkm
	AP2WgbZCw/PO4T6UlgYOea3yaXBdR7MFBvnz4DC8=
X-Gm-Gg: AZFdTZdcxQ+6seLvtIu9u5nfBXhRngBunSsVoqwI8kBF6e7dFFaK6ePH88TUlvXG/Qz
	Ocu5BjSzmbR9MNALZXVzuNmDIU3KW2du72J1nep6yyvWc8TviX9iC2tngmuTYimcb4vREOL/TsP
	cIy4p71iIuJ4rXxtoGBh83+wW1bb8pO0r5mr/CayNxP0ig5XzZahWlIU7yzrBFBPlE+WL3JHU6j
	YXX2CZSdohX6PIl5/B1x+WVwZnywAWaMLya4tZt//yS3w+3iqnKuD0xWFCHij7BPXfCG9yGMjFZ
	JmwVKduK/KblFbzDf0OV/7bhoYfVbLJFV8ghnMxS01Bk/JnYo6a7pHExh4OCOch70rRwNUSC3Rr
	/DgSopxYyXdZ3+XVgG+UfyTfnQoBa11Bafh8eMJ8TIkFZcUBhAfCqYOQBVR4y2oG9u6Z8oA==
X-Received: by 2002:a05:7022:ea56:20b0:1b2:4e2c:6838 with SMTP id
 a92af1059eb24-1b5568cf7a0mr6313411c88.15.1795251672264; Sat, 21 Nov 2026
 01:01:12 -0800 (PST)
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Post: <mailto:linux-lvm@lists.linux.dev>
List-Help: <mailto:linux-lvm+help@lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-lvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJs94EY01OBuV0hsOeP3sy=kMCamMRBO-6m4Zx3x72rLcNc46Q@mail.gmail.com>
 <e7d5386a-aacb-4f21-b432-e1bbbc654a36@gmail.com>
In-Reply-To: <e7d5386a-aacb-4f21-b432-e1bbbc654a36@gmail.com>
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date: Sat, 21 Nov 2026 12:01:00 +0300
X-Gm-Features: Aa3M54oouSiog-_sBnvBvFdC0kHH5GLW_kvLcDEL1rwyd2CxlLibsqi6DCnvNNU
Message-ID: <CAJs94Ea0NZHg12ZPqR9pMGRVHODRBmD7kWBPJqwY+g_-pCPU3w@mail.gmail.com>
Subject: Re: lvmthin man page is not clear on pmspare and RAID
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 13:0=
6, Zdenek Kabelac <zdenek.kabelac@gmail.com>:
>
> Dne 15. 11. 26 v 11:12 Matwey V. Kornilov napsal(a):
> > Dear LVM team,
> >
> > Recently I came across the lvmthin man page. My interest is in having
> > a thin pool on RAID1 (mirror). While there is information on this
> > topic in the man page, I am not sure that I understand all the
> > concepts correctly. I think that when we are talking about storing
> > data, it is better to explain things explicitly.
> >
> > The most problematic topic is how pmspare is related to RAID and vice
> > versa. In the section "Thin Pool on LVM RAID", there is an example of
> > a mirrored thin pool, where I can see that the pmspare volume is not
> > mirrored. Why? What happens when the physical drive containing pmspare
> > goes out of service? vgreduce won't let me remove the failed drive
> > from the volume group due to the hidden pmspare volume allocated on
> > "[unknown]".
> >
> > My understanding, based on the section "Thin Pool Metadata check and
> > repair", is that pmspare is really used only while "lvconvert
> > --repair" is running, either manually or automatically, so the volume
> > can be safely disposed of as long as there is enough free space in the
> > volume group. And this means that each physical drive in the volume
> > group needs to have enough free space for the pmspare volume in case
> > of an emergency. Is this correct?
> >
> > I would be particularly happy to see a new section, "Recovering Thin
> > Pool on LVM RAID", in the lvmthin man page, explaining these specific
> > concerns.
>
> Hi,
>
> Thanks for reading the page carefully and for writing this up. Your
> reading is mostly right, and the pmspare/RAID relationship is indeed not
> explained well in lvmthin(7). A "Recovering Thin Pool on LVM RAID"
> section is a good idea.
>
> Let me take your points in order.

Hi,

Thank you for your massive answer! It is good to know that I
interpreted the man page almost right.
At first it was surprising that thin_repair makes the metadata volume
linear. But I've got the point about pmspare: contrary to how
filesystems perform repair modifying their data structures in place,
lvm thin repair writes new data structures to pmspare and then makes
atomic (not sure if it is true atomic) exchange of the old metadata
volume and pmspare. Then it is not surprising that this action makes
the metadata linear again because pmspare was linear.


>
> What pmspare is
>
> pmspare is a VG-level spare, not a per-pool volume. There is at most one
> per VG, created with the first thin (or cache) pool unless
> --poolmetadataspare n is used. It is sized to be at least as large as the
> largest pool metadata LV in the VG, and is extended if a larger metadata
> LV appears. It is a hidden LV with a single copy by default, allocated
> from the VG's free space like any other LV, and it is not activated as
> part of the pool.
>
> It is not a copy of the pool metadata and it is not a backup. It is
> reserved space. The option description says exactly that: "A spare
> metadata LV is reserved space that can be used when repairing a pool." It
> only contains valid metadata after thin_repair has written to it during
> lvconvert --repair.
>
> pmspare is a last-defence reserve, not a routine part of the recovery
> workflow. The expectation is that an admin monitors the pools (dmeventd,
> autoextend thresholds, whenfull, and free space in the VG) and does not
> use the spare to compensate for a full or neglected VG. It is there for
> the case where metadata is damaged despite that care, and it is intended
> for an admin who understands the state of the VG. It also buys one
> repair: lvconvert --repair writes the repaired metadata into the spare,
> swaps it in as the new tmeta, and then tries to allocate a fresh spare
> from free space (unless --poolmetadataspare n was used). If that
> allocation fails, the VG is left without a pmspare, and a second pool
> that needs repair has nowhere to write. One VG-wide spare cannot cover
> several simultaneous pool failures; they have to be handled one at a
> time, with enough free space for each repaired metadata LV and for the
> next spare.
>
> Why a second metadata volume is needed
>
> Before the failure modes, it is worth being explicit about why metadata
> matters so much. The data LV is just a pool of chunks, allocated on
> demand in no particular order. The metadata contains the B-tree that
> maps the logical blocks of each thin LV to chunks in the data LV.
> Without that mapping, the data LV is not a filesystem or a set of LVs;
> it is just a collection of thin-pool chunks, and there is no way to tell
> which block belongs to which thin LV or file. The data blocks may still
> be physically intact, but they are mostly useless without the mapping.
> The metadata is small, but it is the difference between a usable pool
> and a pile of chunks.
>
> Two different failures can affect a thin pool. The device holding the
> metadata LV can fail, in which case the metadata may be gone even if the
> data LV is still readable. Or the metadata can be corrupted, for example
> by a kernel bug, while the device itself is still usable. A physical
> failure is handled by replacing the lost RAID image on a new device; if
> the metadata was not redundant and the only copy is gone, the pmspare
> cannot recreate it. A corrupted metadata LV is handled by writing a
> repaired copy to a new metadata LV and swapping it in.
>
> The dm-thin metadata format and tools do not support in-place repair.
> Thin metadata was designed to be small, and supporting in-place repair
> would add complexity and cost to the normal metadata path for a rare
> operation. Instead, thin_repair reads the old metadata and writes a new,
> reconstructed copy to a different LV. The old metadata LV is left
> untouched, and the new copy is swapped in only after it has been
> successfully written.
>
> This is why a second metadata-sized LV is needed for the corruption
> case, and why LVM keeps the pmspare LV: it is a preallocated destination
> for that new copy. It also means the repair does not depend on finding
> free space at the worst possible moment, when the old metadata LV is
> still allocated and the VG may be full.
>
> Why it is not mirrored
>
> Because it is not part of the pool or of the RAID set. One pmspare serves
> every thin and cache pool in the VG, and those pools can have different
> layouts (linear, raid1, raid5, raid10, ...). A single spare cannot match
> the layout of all of them. It is scratch space; redundancy of the live
> metadata is the job of the tmeta LV itself. So the example output is
> expected: [lvol0_pmspare] is a plain LV while pool0_tmeta is raid1.
>
> Given that it is a single-use last-defence reserve rather than a live
> copy, the current design does not try to mirror it; the trade-off is the
> one you identified.
>
> There is an important consequence, and this is the part I think the man
> page must state explicitly: after lvconvert --repair, the pool metadata
> LV is the former pmspare, so it becomes linear. The old RAID1 metadata LV
> is kept read-only as ThinPool_metaN. The current code warns only that the
> new metadata LV might use different PVs and may need pvmove; it does not
> warn that the metadata is no longer RAID1. In practice, after a repair
> the new tmeta is linear, while the saved old metadata LV still has its
> original RAID layout.
>
> So if you repair a RAID-backed pool this way, you must re-establish
> metadata redundancy afterwards. If you want to keep RAID1 in the first
> place, use the manual thin_repair plus lvconvert --thinpool --poolmetadat=
a
> path with a new RAID1 metadata LV instead of the built-in spare swap.
>
> If the PV holding pmspare fails
>
> Losing the pmspare itself does not affect the pool. It is not used during
> normal operation and is not activated with the pool. You lose the
> preallocated repair area, not data. If the same PV also held data or
> metadata LVs, those failures are separate; with RAID they may leave the
> pool degraded. The VG is marked partial because the hidden pmspare still
> has extents on the missing PV.
>
> You have found a real rough edge: vgreduce --removemissing will not
> remove it. Without --force it only removes empty missing PVs; with
> --force it skips invisible LVs, so the partial pmspare is left behind,
> consolidation fails, and vgreduce exits with an error. The workaround is
> to remove the spare explicitly first:
>
>    # lvs -a -o name,devices,segtype VG
>    # lvremove -y VG/lvol0_pmspare
>    # vgreduce --removemissing --force VG
>
> The exact name may be lvol1_pmspare, etc. lvremove is documented as
> allowed for pmspare, and it will warn that removing it disables automatic
> recovery attempts. After that, the next pool creation or conversion, or a
> later lvconvert --repair that needs one, will create a new pmspare if
> there is free space. There is currently no standalone "create pmspare"
> command.
>
> If the PV is still present and you simply want to remove it, vgreduce
> also refuses while pmspare has extents there. In that case pvmove -n
> VG/lvol0_pmspare <src> <dst> (or a full pvmove <src>) moves it out of the
> way.
>
> About free space
>
> Your "as long as there is enough free space" is right in the narrow sense
> that removing pmspare does not endanger the pool. But pmspare's whole
> point is to reserve that space before you need it. At repair time the
> damaged tmeta is still allocated, so without a spare LVM may have nowhere
> to write the repaired copy if the VG is full. The spare is a last
> defence, not a substitute for capacity planning: a successful repair
> consumes it, and a fresh spare has to be allocated afterwards, which
> again needs free space. Keeping one metadata-sized area free is cheap
> insurance, but the primary defences are monitoring the pool and not
> letting the VG fill up. An admin who treats pmspare as the normal
> recovery path can end up with a full VG and no spare.
>
> But "each physical drive needs enough free space for pmspare" is not
> correct. pmspare is one LV with one copy. It does not need space on every
> PV and it is not mirrored. What does need space is RAID reconstruction:
> if a PV dies, each lost RAID image (a full copy of tdata or tmeta) needs
> a new home on a surviving or replacement PV. That requirement is separate
> from pmspare, and for tdata it is much larger. Plan spare capacity for
> the largest image, not for a pmspare copy on every drive.
>
> Also note that lvconvert --repair VG/pool on a thin pool is the
> thin-metadata repair, not the RAID repair. For a failed RAID leg, repair
> the RAID LV itself, e.g. lvconvert --repair VG/pool_tdata <newdev> and
> lvconvert --repair VG/pool_tmeta <newdev>. For RAID LVs, dmeventd's
> raid_fault_policy=3Dallocate can replace failed images automatically usin=
g
> free space; that path does not use pmspare. LVM does not run thin_repair
> automatically; that is an admin action.
>
> Recovery order for a RAID-backed thin pool
>
> For the new section I would describe the cases separately:
>
> 1. Lost a PV, RAID legs missing but metadata content intact: after
>     removing a partial pmspare, make the VG consistent and replace the
>     missing legs:
>
>       # lvconvert --repair VG/<pool>_tdata <newdev>
>       # lvconvert --repair VG/<pool>_tmeta <newdev>
>
>     This is RAID repair, not thin repair.
>
> 2. Metadata content corrupt: the pool must be inactive, then lvconvert
>     --repair VG/<pool>. This consumes pmspare and leaves tmeta linear.
>     Verify the pool and the thin LVs, then either restore redundancy or
>     use the manual path:
>
>       # lvchange -an VG/<pool>
>       # lvcreate --type raid1 -m1 -L <meta size> -n newmeta VG <dev1> <de=
v2>
>       # lvchange -ay VG/<pool>_tmeta VG/newmeta
>       # thin_repair -i /dev/VG/<pool>_tmeta -o /dev/VG/newmeta
>       # lvconvert --thinpool VG/<pool> --poolmetadata VG/newmeta
>
>     The old metadata LV is kept as ThinPool_metaN until you have verified
>     the new one.
>
> 3. Lost the pmspare PV: remove the partial pmspare as above, then
>     vgreduce --removemissing. A new pmspare is created on demand if there
>     is free space.
>
> I will write this up for lvmthin(7), including that pmspare is a
> single-use, VG-wide last defence and not a replacement for monitoring and
> free-space planning. Thanks again for the report; the distinction between
> "live metadata redundancy" and "reserved repair space" is exactly what
> the page should make explicit.
>
>
> Regards
>
> Zdenek
>
>
>


--=20
With best regards,
Matwey V. Kornilov
