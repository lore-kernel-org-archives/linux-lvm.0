Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o126u1kf000917
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 01:56:02 -0500
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o126tnb2027053
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 01:55:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 31EF187107
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2010 07:55:48 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id HbPxF51hZysQ for <linux-lvm@redhat.com>;
	Tue,  2 Feb 2010 07:55:48 +0100 (CET)
Date: Tue, 2 Feb 2010 07:55:48 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100202065547.GA24147@maude.comedia.it>
References: <201002011828.29896.simonw@zynet.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201002011828.29896.simonw@zynet.net>
Subject: Re: [linux-lvm] Newbie: Yet another "Incorrect metadata area	header
	checksum"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Feb 01, 2010 at 06:28:29PM +0000, Simon Waters wrote:
>Installed Debian Lenny using NetInst CD 5.0.3 i386 dated  20090906-12:06 onto 
>a DELL SC1425 with two SATA disks.
>
....
>One suggestion was to install "dmraid" and look for metadata using this.
>It produces:
> /dev/sdb: ddf1. ".ddf1_disks", GROUP, ok, 155989151 sectors, data@ 0
> /dev/sda: ddf1. ".ddf1_disks", GROUP, ok, 155989151 sectors, data@ 0
>
i believe your dell machine configured the two disks in a fakeraid,
yet Lenny does not know (you did not tell it or you forced it to ignore
the fakeraid) and tries to use the two disks independently.
This will lead to problems since at every boot the fakeraid bios will
touch the two disks.

back up your data
decide wether you want to use the fakeraid or not
configure your bios accordingly
reinstall your OS accordingly

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
