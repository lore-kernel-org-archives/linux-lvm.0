Received: from mx01.frank.fyi (mx01.frank.fyi [5.189.178.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBED175B0
	for <linux-lvm@lists.linux.dev>; Fri, 12 Jan 2024 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frank.fyi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frank.fyi
Received: by mx01.frank.fyi (Postfix, from userid 1001)
	id F224B1121544; Fri, 12 Jan 2024 19:19:12 +0100 (CET)
Date: Fri, 12 Jan 2024 18:19:12 +0000
From: lists.linux.dev@frank.fyi
To: linux-lvm@lists.linux.dev
Subject: add volatile flag to PV/LVs (for cache) to avoid degraded state on
 reboot
Message-ID: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

at first, a happy new year to everyone.

I'm currently considering to use dm-cache with a ramdisk/volatile PV for a small project and noticed some usability issues that make using it less appealing.


Currently this means:
1. Adding a cache to a VG will cause the entire VG to depend on the cache. If one of the cache drives fails or is missing it cannot be accessed and even worse if this was the VG containing the root filesystem it also causes the entire system to fail to boot. Even though we may already know that we don't have any dataloss but just degraded access times.
2. Requires manual scripting to activate the VG and handle potentially missing/failing cache PVs
3. LVM doesn't have a way to clearly indicate that the physical volume is volatile and that dataloss on it is expected. Maybe even including the PV header itself. Or alternatively a way to indicate "if something is wrong with the cache, just forget about it (if possible)".
4. Just recreating the 'pvcreate --zero --pvmetadatacopies 0 --norestorefile --uuid' appears to be enough to get a write-through cache and thereby also the associated volume working again. Therefore it doesn't look like LVM cares about the cache data being lost, but only about the PV itself. Therefore failing to activate the VG appears to be a bit too convservative and probably the error handling here could be improved (see above).
6. Also as there is currently no place within the LVM metadata to label a PV/VG/LV as "volatile" it is also not clear both to LVM as well as admins looking at output of tools like lvdisplay that a specific LV is volatile. Therefore there will also be no safeguards and warnings against actions that would cause dataloss (like adding a ramdisk to a raid0, or even just adding a write-back instead of a write-through cache).


Therefore I'd like to ask if it would be possible to make two small improvements:
1. Add a "volatile" flag to PVs, LVs, and VGs to allow to clearly indicate that they are non-persistent and that dataloss is expected.
2. And one of:
 a. Change error handling and automatic recovery from missing PVs if the LV or VG has the volatile flag. Like e.g. automatically `--uncache`-ing the volume and mount it without the cache that is missing its PV. This is even more important for boot volumes, where such a configuration would prevent the system from booting at all.
 b. Alternatively, add native support for ramdisks. This mainly would require extending the VG metadata with an 'is-RAMdisk' flag that causes the lookup for the PV to be skipped and instead a new ramdisk being allocated while the VG is being activated (we know its size from the VG metadata, as we know how much we allocate/use). This could also help with unit tests and CI/CD usages (where currently the PV is manually created with brd before activating/creating the VG). Including our own test/lib/aux.sh, test/shell/devicesfile-misc.sh, test/shell/devicesfile-refresh.sh, test/shell/devicesfile-serial.sh.
 c. Same as 2a, but instead of automatically uncaching the volume, add a flag to the VG metadata that allows LVM to use the hints file to find the PV and automatically re-initialize it regardless of its header. Maybe together with an additional configuration option to demand the block device being zeroed (I.E. to avoid reading the entire block device, the first 4 sectors) to safeguard against accidental data-loss that we normally get by looking for the correct PV header.
 d. Same as 2b, but limited to caches only. Considering how caching is currently implemented adding ramdisks with an limitation to caches may cause unecessary additional work and be less useful compared to adding them as a new additional kind of PV. Also it wouldn't help the additional usecase with unit tests and CI/CD pipelines. Additionally it would also simplify "playing with" and learning about LVM.
 e. Add an option to have lvconvert enable caching but WITHOUT saving it within the VGs metadata. Causing LVM to forget about the case. I.E. next time the system boots LVM would mount the VG normally without the cache. For write-through caches this should always be safe and for write-back it only causes dataloss when the system crashes without flushing it.

My personal favourite is 2b, followed by 2e.
2b basically realizes my entire usecase within LVM natively and 2e at least avoids the need to automating the LVM recovery just to be able to reboot the system and allow me to write a systemd service to add the cache at runtime.

Best regards
