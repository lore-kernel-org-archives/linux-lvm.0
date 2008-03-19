Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2JDclKR003596
	for <linux-lvm@redhat.com>; Wed, 19 Mar 2008 09:38:47 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JbyVD-0004Zp-Nl
	for linux-lvm@redhat.com; Wed, 19 Mar 2008 13:38:47 +0000
Date: Wed, 19 Mar 2008 13:38:47 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Characters allowed for vg name
Message-ID: <20080319133847.GF12007@agk.fab.redhat.com>
References: <A78DB34D00374344A0AB65B6523C05DC02CDCF5D@marsden.win.datacash.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC02CDCF5D@marsden.win.datacash.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 19, 2008 at 01:19:19PM -0000, Gerrard Geldenhuis wrote:
> I have a kickstart file which fails if I use an - character in the
> vgname. Using a _ works fine. 

Report a bug?

Hyphens are permitted *inside* VG and LV names, but not as the first
character.  There are also some reserved names you cannot use
because of existing /dev entries.  (E.g. a VG name of 'null' would clash
with '/dev/null' and '.' and '..' are also banned of course).

> Does anybody know what the allowable characters are for vg, pv and lv
> names?
 
VG/LV:
  a-zA-Z0-9+_.-

(PV names are simply filenames)

Alasdair
-- 
agk@redhat.com
