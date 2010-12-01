Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB1JltCs003639
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 14:47:55 -0500
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB1JlkOG024849
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 14:47:46 -0500
Received: by wyb28 with SMTP id 28so7528624wyb.33
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 11:47:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CF64495.80700@turmel.org>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
	<4CF3F7A0.2080108@rjl.com>
	<AANLkTim67atrgHEzunBRvp4ij+MUDiTg4vu5t6sbgFLq@mail.gmail.com>
	<4CF4A472.20107@rjl.com>
	<AANLkTing5ApAXM2o0M+pxNvg01mHewNgGGBiUXM3aLzZ@mail.gmail.com>
	<4CF4F85C.1020806@turmel.org>
	<AANLkTi=F5Ttrp9-_wto4ZNWiDvY=cPe0_p26BPyzvMDz@mail.gmail.com>
	<4CF52CA5.1090405@turmel.org>
	<AANLkTin4f=W69mr923KhSYT_qvFnLiz0fpScWo0w1rfu@mail.gmail.com>
	<4CF64495.80700@turmel.org>
Date: Thu, 2 Dec 2010 02:47:45 +0700
Message-ID: <AANLkTi=SXuv=ms8HsfSKSnXAveAq1=OefRkZV9ACTLdC@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Q: LVM over RAID,
 or plain disks? A:"Yes" = best of both worlds?
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
Content-Type: text/plain; charset="iso-8859-1"
To: Phil Turmel <philip@turmel.org>
Cc: linux-raid@vger.kernel.org, linux-lvm@redhat.com

On Wed, Dec 1, 2010 at 7:50 PM, Phil Turmel <philip@turmel.org> wrote:
>> Does dd already do some sort of "verify after copy"? I will likely
>> investigate the available COTS partition cloning tools as well.
>
> Not natively, but it fairly easy to pipe a dd reader through md5sum to a =
dd writer, then follow up with a dd read + md5sum of the copied partition (=
taking care to read precisely the same number of sectors).
>
> The various flavors of ddrescue might have something like this.. =EF=BF=
=BDdidn't check.

Sorry it's a bit OT, but for the sake of future googlers thought I'd
point to this tool I found:

http://dc3dd.sourceforge.net/
http://www.forensicswiki.org/wiki/Dc3dd
