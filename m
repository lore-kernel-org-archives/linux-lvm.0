Received: from gw.citecs.de (gw.citecs.de [212.9.189.66])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA91A18C33
	for <linux-lvm@lists.linux.dev>; Sat, 21 Feb 2026 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.9.189.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771706286; cv=none; b=GHTQPt1ABeuskCMN0/ODJOmY8tS+enY+ksBzKNtLGoa4+fLtDXgmT0AZZQzkzqEYYTpwgtdKOKAkMu95M7q5wFyBKsy96QLqhEion27xiZq67wpDS6LcV5lavee/KrMXYtdwj2AuBRgZhcFqCNnTAdCi9y//DNEFZ3IhtaauvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771706286; c=relaxed/simple;
	bh=aXrJptN3WcpQiFtTNYnDQ1xtJdNBDmQEBRoWcOut9nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vipb8QdnCIwsboYem+aql7aFgykReMS76JIn2puepUEnMY6vN/qB2U1AB1sW3ura9WFC1y5eoju+2qB37DVb5z0HD0miUjUnonpXSyEs7utNCLfR6b5cyJMJDblSwjsoExTr2oEbDbYfBXC9d5nc40Xn+w4ors/dZIE6oCpPdNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=citecs.de; spf=pass smtp.mailfrom=citecs.de; arc=none smtp.client-ip=212.9.189.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=citecs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citecs.de
Received: from app.citecs ([10.0.0.50])
	by gw.citecs.de with esmtp (Exim 3.35 #1 (Debian))
	id 1vttT5-0002Zq-00; Sat, 21 Feb 2026 21:20:47 +0100
Received: from chris by app.citecs proof01 pqnkqszo with local (Exim 4.80)
	id 1vttT5-0003MP-BB; Sat, 21 Feb 2026 21:20:47 +0100
Date: Sat, 21 Feb 2026 21:20:47 +0100
From: Christian Recktenwald <chris@citecs.de>
To: =?utf-8?B?RnLDqWTDqXJpYw==?= Baldit <frederic.baldit@free.fr>
Cc: linux-lvm@lists.linux.dev
Subject: Re: is it possible to use LVM AFTER system installation?
Message-ID: <20260221202047.GA32516@app.citecs>
Reply-To: Christian Recktenwald <chris@citecs.de>
References: <20260221185816.34fab009@ThinkPadT15g.lan>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260221185816.34fab009@ThinkPadT15g.lan>
X-PGP-Fingerprint: 4096R/3B7D0DF2 / B865 A021 AC93 B61F 4476  32A6 04A6 FBDD
 3B7D 0DF2
X-PGP-Key-Url: https://www.citecs.de/pgpkey.chris.asc
X-PGP-Key: https://www.citecs.de/pgpkey.chris.asc
Organization: private
User-Agent: Mutt/1.5.21 (2010-09-15)

On Sat, Feb 21, 2026 at 06:58:16PM +0100, Frédéric Baldit wrote:
> 
> Hi everybody,
> 
> I'm a debian 12 user, running it on a system which was initially 
> installed without LVM (on a thinkpad laptop)n with classical netinst. My
> system is totally installed on a unique nvme disk, with distinct
> partitions, among which a /home partition for all my personal data.
> 
> I recently installed a second nvme disk (512G capacity). I would like
> to extend my /home ext4 partition (which is now exclusively on
> /dev/nvme0n1p6, 436G) so that I can keep my old data but have
> the possibility to split /home on the initial disk and the second
> recently added disk.
> 
> This seems to be possible with LVM but only when decided at the
> beginning of the installation. Right or wrong?
> 
> Or would it possible to:

create 3 partitions:
1MB for boot loader (grub)
500B for UEFI
rest: LVM PV

Something like:
  VG=vg01
  LVN=lvhome
  DRV=/dev/nvme....
  PART2=/dev/nvme....
  PART3=/dev/nvme....

  SZ=...G # slightly larger (like 1GB) than your current /home

  parted    $DRV mklabel gpt
  # those values are crucial:
  parted -s $DRV unit s mkpart primary      34     2047 set 1 bios_grub on
  parted -s $DRV unit s mkpart primary    2048  1050623 set 2 esp on
  parted -s $DRV unit s mkpart primary 1050624 100%FREE set 3 lvm on
  partprobe $DRV

  mkfs.fat -F32 $PART2
  pvcreate $PART3
  vgcreate $VG $PART3
  lvcreate $VG -n $LVN -L $SZ

  umount /home
  dd if=$OLDHOME of=/dev/$VG/$LVN bs=10M 
  resize2fs /dev/$VG/$LVN
  fsck -f /dev/$VG/$LVN
  $EDITOR /etc/fstab
  mount /home

  live happily ever after...

  cherry on top:
  - mount partition 2 somewhere
    copy the contents of your existing efi boot partition there
    umount partition 2
  - run grub to install on the new drive
  Y? If you ever come across replacing the smaller disk 
  the preparations to get the new disk bootable are already done
  
-- 
Christian Recktenwald      : voice +49 711 601 2091  : Böblinger Strasse 189
chris@citecs.de            : mobil +49 172 711 8104  : D-70199 Stuttgart
