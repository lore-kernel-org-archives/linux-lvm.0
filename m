Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9O7ZGU8027177
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 03:35:16 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9O7Z0mh010687
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 03:35:01 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 6B05186F0C
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 09:34:59 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id ZmuxdRAhMyGo for <linux-lvm@redhat.com>;
	Sat, 24 Oct 2009 09:34:59 +0200 (CEST)
Date: Sat, 24 Oct 2009 09:34:59 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
Message-ID: <20091024073458.GA12353@maude.comedia.it>
References: <a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20091024000642.GA30974@bdmcc-us.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Oct 23, 2009 at 05:06:42PM -0700, Brian McCullough wrote:
>I'm surprised that you haven't yet been told that one of the first rules of LVM is "don't use it for root!"  Actually, I don't really hold with that, but it is MUCH more important to plan what you are doing when you do have an LVM root partition.  As you have found, you can not manipulate an LVM partition while it is mounted. ( I know, there are ways for certain types of filesystems, but in general, the rule holds. )  That is especially true when the partition that you want to manipulate is root ( / ).
There is no such rule.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
