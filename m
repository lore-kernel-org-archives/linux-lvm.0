Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996417;
	b=yoGSNuClNGhMZRnDPQ57xJ20SdBsRSAnjDiIdiRoNpeANQm2DsRQ8bh7kgy2felCG9PF
	 yfRvKnlVcr1Zpmx55aYM5NzJtaayFFGGzQioZ3uWY+zcs6ca99SdZAhhs+V58/AznOuP/
	 U+S6TLuDh/f+GQj06y8FrCVGXy4Tjd1nMqREMvn7ya7i+H0CxNYzV7GYfZomXvOGG/+Zi
	 vzXGtlMaqxx/rZTvWFL8oe5+eNtZX1v0yTgHjORM4VVlKLMF2TC3M0nAzDDWOybA5iwgX
	 httOy63C1eVb9XObEadu21sMO6Vn+YxKYjcZUZ2NeQ9QmlQbg7XS2gAfQrQd8IGEF5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lr/wSbZJJG3m5PN4Xw5eFcCpQcZB/KuQiQw+DeUudnc=;
	b=ghY6OiEV7eqljHQYSZy5Te43IAxCMNv4xovIbXQTR/E0XsliruRON5Er3DxDAITct/8U
	 yeD8NxbNTNl7EDt/wNeBj7xhqVEir0I0Nwwn3x33xj8kuzElQz8JY0Dr87DbeTdWzDQPz
	 RcBfnVspzGzTeC6doMgr4YRpqoZBMLhgmks4pgKStlrf1PLBr3BY6SSVy91WYLXpmAm7/
	 ma9zuM0qNk+0l/+SEkHvjDdH3K7pXm4fYT76pmdIEjk+0jmSXMIBG2MB/I/4KFcQ0Mi7u
	 XXMouy9ytfdcceBb48kziQE8hCjr1Hu79ICPjZrgbiAZdfgsShRdL04EU4A68aKgYhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4700WuL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4674606A320
	for <linux-lvm@lists.linux.dev>; Wed, 18 Nov 2026 10:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4674606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4700WuL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so7962355e9.1
        for <linux-lvm@lists.linux.dev>; Wed, 18 Nov 2026 02:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996415; x=1795601215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lr/wSbZJJG3m5PN4Xw5eFcCpQcZB/KuQiQw+DeUudnc=;
        b=q4700WuLSWAEScSL4N84r4kyS+GN9gk1g5drU0r2Nxj+H9PsGWuKakTh7G7yk8wElC
         gAa5fa0DdyZTnoMrkKFgsaJjgy59sm3MMB4OUQ5whTb0J2inkvBIdWb9I/z8j9S/Yory
         jF90ya8b2Qm4qaP5Ze/5nUrFofU5yDm9ccM4P0FL7sc2oO/TQ9/gQBtqmGK57yi3b7m9
         35HTfLq2A1z0/Ng3iEDnkfSqjpVzxfOY+bKTJUK07jD211IvV/xwJkCdA/AU5uKnXxJw
         TysT0hCt6BhWmAZbkNC7fdnxwoCN5twAuvL7K1SD/vqeMqfULXD2y25emt+GBd2UB7bU
         OCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996415; x=1795601215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lr/wSbZJJG3m5PN4Xw5eFcCpQcZB/KuQiQw+DeUudnc=;
        b=TfdH9FajlcQktT1VUfSHan6lUrXiPeHM1L6dY4Ht26azTfyb6ERdusthgGk/rUFMEH
         y9uAf6fOkkePkBehOUtWVVo0Gr7p5cZFnMEiLL7UyIQMHE4zUGAiAsKhX1mvRHPaENec
         Ve/RHsV0KSVt0zx05+DE54SRyWjBgftyi+683kxptTO0tEhO68PV+FOZyxIUhK53pXQQ
         ghHZnQKACaUYRJ++z3i5L5+wHg/mEcPNoXZIZgUB/6e+x/hHadftr2tJVl+9sBTNGvYe
         skiRSZ3qdqnb+gmTrg37g9h1XmxdMPFk7HSac3FYIRvwiDF9E6PXlLySFqdqvX2oc0yJ
         vacA==
X-Forwarded-Encrypted: i=1; AL+hErFqsM9OOj+5AEz8rIl0/Y8xua4H4wbR/ksGJJ3wOjnIgV7vG8D/wxU21lSVi5lYZGmQ5GkCmgWsUBI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8SZqrIRcCNPxU1LzJzEiX+1ASr6urRRVrnH45gM8AgkDj/rKEy
	AefXlZ71N7IY28QU47dJMqvcaan4pS9iPsvvPb7Tr5ha+1ry8tQV6EJS+vi8Fg==
X-Gm-Gg: AYBFou1BSaxdNRGM+GDSNclfSlu4GFuo5acmkd8gH0Rc3/pNg0hdWeijrEfiofuXqP1
	PcRQWt0Jj9Mwv//0ujLqc1lNUUXvj3EQrjGc7Z28EF5pVfNH5W0f51Iu6W4dc39WAS1jgO2ZJu5
	9iXE32dwLbIESqLwO3HH3FXNjWIkDogHgPae4T/X0PECR+fGI5IWcXMaHWJEijjFfw82Fuyr0u1
	pNlcsCN94F1PnnVI4axZLX8AZ74qd7NMSibPI2q3YCmjLta9I/9saQHF3w1v5a1dsFaA9npWqkI
	JORUl1pMt7QDhdzsdfLet7L95VvNlko+Qv0n1dlgHjUvdbyS7y6JOofl1VMQGTNELO0Nck+SQXS
	QT/L30TnBCBfV67jxelRHussZvRED22JO3EUjqKxRyxO0bJbZoyW75fMzs+mes1IEwREWeT7UKg
	0sAhbiJ9LCCL/Jqcu2zTknHtecUZmTpEG01QZP2rC8KqG5uVibqbQAZqUL9RkpqrOmzh9OtBSuc
	R7TrhEvrhg7XXF6ZEATGHZCV8ZKiH4J3Na3YtHqZV+5KR4Ucw0+re2YBr6Cf/vSpywCe7/lddze
	wb9jdXaA5n7H50L3cv8uWvx/+vInwHLoKJKtrhSe5PzV48eN4IteuundBo9um47aZCgd
X-Received: by 2002:a05:600c:4f56:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb7da12aa6mr42189695e9.10.1794996414694;
        Wed, 18 Nov 2026 02:06:54 -0800 (PST)
Received: from [10.202.149.245] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm54439975e9.11.2026.11.18.02.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:06:54 -0800 (PST)
Message-ID: <e7d5386a-aacb-4f21-b432-e1bbbc654a36@gmail.com>
Date: Wed, 18 Nov 2026 11:06:53 +0100
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Post: <mailto:linux-lvm@lists.linux.dev>
List-Help: <mailto:linux-lvm+help@lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-lvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvmthin man page is not clear on pmspare and RAID
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
 linux-lvm@lists.linux.dev
References: <CAJs94EY01OBuV0hsOeP3sy=kMCamMRBO-6m4Zx3x72rLcNc46Q@mail.gmail.com>
Content-Language: en-US, cs-CZ
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAJs94EY01OBuV0hsOeP3sy=kMCamMRBO-6m4Zx3x72rLcNc46Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 15. 11. 26 v 11:12 Matwey V. Kornilov napsal(a):
> Dear LVM team,
> 
> Recently I came across the lvmthin man page. My interest is in having
> a thin pool on RAID1 (mirror). While there is information on this
> topic in the man page, I am not sure that I understand all the
> concepts correctly. I think that when we are talking about storing
> data, it is better to explain things explicitly.
> 
> The most problematic topic is how pmspare is related to RAID and vice
> versa. In the section "Thin Pool on LVM RAID", there is an example of
> a mirrored thin pool, where I can see that the pmspare volume is not
> mirrored. Why? What happens when the physical drive containing pmspare
> goes out of service? vgreduce won't let me remove the failed drive
> from the volume group due to the hidden pmspare volume allocated on
> "[unknown]".
> 
> My understanding, based on the section "Thin Pool Metadata check and
> repair", is that pmspare is really used only while "lvconvert
> --repair" is running, either manually or automatically, so the volume
> can be safely disposed of as long as there is enough free space in the
> volume group. And this means that each physical drive in the volume
> group needs to have enough free space for the pmspare volume in case
> of an emergency. Is this correct?
> 
> I would be particularly happy to see a new section, "Recovering Thin
> Pool on LVM RAID", in the lvmthin man page, explaining these specific
> concerns.

Hi,

Thanks for reading the page carefully and for writing this up. Your
reading is mostly right, and the pmspare/RAID relationship is indeed not
explained well in lvmthin(7). A "Recovering Thin Pool on LVM RAID"
section is a good idea.

Let me take your points in order.

What pmspare is

pmspare is a VG-level spare, not a per-pool volume. There is at most one
per VG, created with the first thin (or cache) pool unless
--poolmetadataspare n is used. It is sized to be at least as large as the
largest pool metadata LV in the VG, and is extended if a larger metadata
LV appears. It is a hidden LV with a single copy by default, allocated
from the VG's free space like any other LV, and it is not activated as
part of the pool.

It is not a copy of the pool metadata and it is not a backup. It is
reserved space. The option description says exactly that: "A spare
metadata LV is reserved space that can be used when repairing a pool." It
only contains valid metadata after thin_repair has written to it during
lvconvert --repair.

pmspare is a last-defence reserve, not a routine part of the recovery
workflow. The expectation is that an admin monitors the pools (dmeventd,
autoextend thresholds, whenfull, and free space in the VG) and does not
use the spare to compensate for a full or neglected VG. It is there for
the case where metadata is damaged despite that care, and it is intended
for an admin who understands the state of the VG. It also buys one
repair: lvconvert --repair writes the repaired metadata into the spare,
swaps it in as the new tmeta, and then tries to allocate a fresh spare
from free space (unless --poolmetadataspare n was used). If that
allocation fails, the VG is left without a pmspare, and a second pool
that needs repair has nowhere to write. One VG-wide spare cannot cover
several simultaneous pool failures; they have to be handled one at a
time, with enough free space for each repaired metadata LV and for the
next spare.

Why a second metadata volume is needed

Before the failure modes, it is worth being explicit about why metadata
matters so much. The data LV is just a pool of chunks, allocated on
demand in no particular order. The metadata contains the B-tree that
maps the logical blocks of each thin LV to chunks in the data LV.
Without that mapping, the data LV is not a filesystem or a set of LVs;
it is just a collection of thin-pool chunks, and there is no way to tell
which block belongs to which thin LV or file. The data blocks may still
be physically intact, but they are mostly useless without the mapping.
The metadata is small, but it is the difference between a usable pool
and a pile of chunks.

Two different failures can affect a thin pool. The device holding the
metadata LV can fail, in which case the metadata may be gone even if the
data LV is still readable. Or the metadata can be corrupted, for example
by a kernel bug, while the device itself is still usable. A physical
failure is handled by replacing the lost RAID image on a new device; if
the metadata was not redundant and the only copy is gone, the pmspare
cannot recreate it. A corrupted metadata LV is handled by writing a
repaired copy to a new metadata LV and swapping it in.

The dm-thin metadata format and tools do not support in-place repair.
Thin metadata was designed to be small, and supporting in-place repair
would add complexity and cost to the normal metadata path for a rare
operation. Instead, thin_repair reads the old metadata and writes a new,
reconstructed copy to a different LV. The old metadata LV is left
untouched, and the new copy is swapped in only after it has been
successfully written.

This is why a second metadata-sized LV is needed for the corruption
case, and why LVM keeps the pmspare LV: it is a preallocated destination
for that new copy. It also means the repair does not depend on finding
free space at the worst possible moment, when the old metadata LV is
still allocated and the VG may be full.

Why it is not mirrored

Because it is not part of the pool or of the RAID set. One pmspare serves
every thin and cache pool in the VG, and those pools can have different
layouts (linear, raid1, raid5, raid10, ...). A single spare cannot match
the layout of all of them. It is scratch space; redundancy of the live
metadata is the job of the tmeta LV itself. So the example output is
expected: [lvol0_pmspare] is a plain LV while pool0_tmeta is raid1.

Given that it is a single-use last-defence reserve rather than a live
copy, the current design does not try to mirror it; the trade-off is the
one you identified.

There is an important consequence, and this is the part I think the man
page must state explicitly: after lvconvert --repair, the pool metadata
LV is the former pmspare, so it becomes linear. The old RAID1 metadata LV
is kept read-only as ThinPool_metaN. The current code warns only that the
new metadata LV might use different PVs and may need pvmove; it does not
warn that the metadata is no longer RAID1. In practice, after a repair
the new tmeta is linear, while the saved old metadata LV still has its
original RAID layout.

So if you repair a RAID-backed pool this way, you must re-establish
metadata redundancy afterwards. If you want to keep RAID1 in the first
place, use the manual thin_repair plus lvconvert --thinpool --poolmetadata
path with a new RAID1 metadata LV instead of the built-in spare swap.

If the PV holding pmspare fails

Losing the pmspare itself does not affect the pool. It is not used during
normal operation and is not activated with the pool. You lose the
preallocated repair area, not data. If the same PV also held data or
metadata LVs, those failures are separate; with RAID they may leave the
pool degraded. The VG is marked partial because the hidden pmspare still
has extents on the missing PV.

You have found a real rough edge: vgreduce --removemissing will not
remove it. Without --force it only removes empty missing PVs; with
--force it skips invisible LVs, so the partial pmspare is left behind,
consolidation fails, and vgreduce exits with an error. The workaround is
to remove the spare explicitly first:

   # lvs -a -o name,devices,segtype VG
   # lvremove -y VG/lvol0_pmspare
   # vgreduce --removemissing --force VG

The exact name may be lvol1_pmspare, etc. lvremove is documented as
allowed for pmspare, and it will warn that removing it disables automatic
recovery attempts. After that, the next pool creation or conversion, or a
later lvconvert --repair that needs one, will create a new pmspare if
there is free space. There is currently no standalone "create pmspare"
command.

If the PV is still present and you simply want to remove it, vgreduce
also refuses while pmspare has extents there. In that case pvmove -n
VG/lvol0_pmspare <src> <dst> (or a full pvmove <src>) moves it out of the
way.

About free space

Your "as long as there is enough free space" is right in the narrow sense
that removing pmspare does not endanger the pool. But pmspare's whole
point is to reserve that space before you need it. At repair time the
damaged tmeta is still allocated, so without a spare LVM may have nowhere
to write the repaired copy if the VG is full. The spare is a last
defence, not a substitute for capacity planning: a successful repair
consumes it, and a fresh spare has to be allocated afterwards, which
again needs free space. Keeping one metadata-sized area free is cheap
insurance, but the primary defences are monitoring the pool and not
letting the VG fill up. An admin who treats pmspare as the normal
recovery path can end up with a full VG and no spare.

But "each physical drive needs enough free space for pmspare" is not
correct. pmspare is one LV with one copy. It does not need space on every
PV and it is not mirrored. What does need space is RAID reconstruction:
if a PV dies, each lost RAID image (a full copy of tdata or tmeta) needs
a new home on a surviving or replacement PV. That requirement is separate
from pmspare, and for tdata it is much larger. Plan spare capacity for
the largest image, not for a pmspare copy on every drive.

Also note that lvconvert --repair VG/pool on a thin pool is the
thin-metadata repair, not the RAID repair. For a failed RAID leg, repair
the RAID LV itself, e.g. lvconvert --repair VG/pool_tdata <newdev> and
lvconvert --repair VG/pool_tmeta <newdev>. For RAID LVs, dmeventd's
raid_fault_policy=allocate can replace failed images automatically using
free space; that path does not use pmspare. LVM does not run thin_repair
automatically; that is an admin action.

Recovery order for a RAID-backed thin pool

For the new section I would describe the cases separately:

1. Lost a PV, RAID legs missing but metadata content intact: after
    removing a partial pmspare, make the VG consistent and replace the
    missing legs:

      # lvconvert --repair VG/<pool>_tdata <newdev>
      # lvconvert --repair VG/<pool>_tmeta <newdev>

    This is RAID repair, not thin repair.

2. Metadata content corrupt: the pool must be inactive, then lvconvert
    --repair VG/<pool>. This consumes pmspare and leaves tmeta linear.
    Verify the pool and the thin LVs, then either restore redundancy or
    use the manual path:

      # lvchange -an VG/<pool>
      # lvcreate --type raid1 -m1 -L <meta size> -n newmeta VG <dev1> <dev2>
      # lvchange -ay VG/<pool>_tmeta VG/newmeta
      # thin_repair -i /dev/VG/<pool>_tmeta -o /dev/VG/newmeta
      # lvconvert --thinpool VG/<pool> --poolmetadata VG/newmeta

    The old metadata LV is kept as ThinPool_metaN until you have verified
    the new one.

3. Lost the pmspare PV: remove the partial pmspare as above, then
    vgreduce --removemissing. A new pmspare is created on demand if there
    is free space.

I will write this up for lvmthin(7), including that pmspare is a
single-use, VG-wide last defence and not a replacement for monitoring and
free-space planning. Thanks again for the report; the distinction between
"live metadata redundancy" and "reserved repair space" is exactly what
the page should make explicit.


Regards

Zdenek



