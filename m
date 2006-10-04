Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94MSOb3019986
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 23:28:24 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GVFE0-0005W6-UZ
	for linux-lvm@redhat.com; Wed, 04 Oct 2006 23:28:24 +0100
Date: Wed, 4 Oct 2006 23:28:24 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Bug in LVM2 tools
Message-ID: <20061004222824.GH17654@agk.surrey.redhat.com>
References: <4524222F.3060902@baldauf.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4524222F.3060902@baldauf.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Oct 04, 2006 at 11:05:51PM +0200, Xu=EF=BF=BDn Baldauf wrote:
> I observed an obscure bug in the current LVM2 tools. Observe this:
=20
> # vgcreate --physicalextentsize=3D1k test.vg /dev/loop4

When you have larger PEs, this bug gets lost in the rounding that gets done
for alignment.

> It seems that there is
> space reserved for a second metadata copy at the end of /dev/loop4,

It's not actually related to that - it's simply a mistake in the logic that
means it adjusts for the metadata areas both in pvcreate and then a second
time in vgcreate.  When you run vgremove it now reinstates the full disk
size (a bug fix that was applied) so the subsequent vgcreate only makes a
single (correct) adjustment.  In short, there's confusion of responsibility
between pvcreate and vgcreate for calculating the usable data area size
that holds the PEs.

Alasdair
--=20
agk@redhat.com
