Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id j0PKVJl13753
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 15:31:19 -0500
Received: from smtp2.prod2.securaserv.com (203-96-158-55.paradise.net.nz
	[203.96.158.55])
	by mx2.redhat.com (8.12.11/8.12.11) with SMTP id j0PKjchT000471
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 15:45:39 -0500
Message-ID: <41F6A729.9050709@vilain.net>
Date: Wed, 26 Jan 2005 09:08:09 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is included
	in the LVM
References: <1106517355.26963.213384700@webmail.messagingengine.com>	<20050124002632.GA23702@pob>
	<1106605480.13480.213476562@webmail.messagingengine.com>
In-Reply-To: <1106605480.13480.213476562@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: greenrd@greenrd.org
Cc: LVM general discussion and development <linux-lvm@redhat.com>

fromkth+lvm@fastmail.fm wrote:
> I ran Knoppix Live CD 3.7 which has qtparted 0.4.4 and it does not
> recognizes the linux lvm partition and shows it as unknown
   [...]
> so the question remains how to do it.

The knoppix CD also has the commandline lvm utilities and ext2resize
binaries.  Have fun reading the manpages for vgscan, vgchange,
ext2resize, lvreduce, pvmove, vgreduce, pvremove, fdisk, pvcreate,
vgextend, and pvmove.  Not necessarily in that order.

HTH.
-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
