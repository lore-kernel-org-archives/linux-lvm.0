Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1SLd2K28534
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 16:39:02 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1SLcuN6021634
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 16:38:57 -0500
Date: Mon, 28 Feb 2005 22:38:56 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Having duplicate PV problems,
	think there's a bug in LVM2 md component detection
Message-ID: <20050228213856.GA4151@percy.comedia.it>
References: <002101c51c41$f6bcfdc0$32dcdc0a@vanish>
	<a3558a98050228031544d8f8c6@mail.gmail.com>
	<001301c51dd5$abc80860$32dcdc0a@vanish>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001301c51dd5$abc80860$32dcdc0a@vanish>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Feb 28, 2005 at 03:39:59PM -0500, Ron Watkins wrote:
>Yes, I have two PVs with the same UUID.  The problem is that these PVs are 
>COMPONENTS OF an MD device.  So when pvcreate writes its superblock to md0, 
>it gets mirrored onto all the components of md0.  Later runs elicit much 
>complaining because /dev/hda and several /dev/sd devices now have the 
>'same' UUID.   They're SUPPOSED to, they're components of a RAID.
>
>LVM is supposed to detect this situation and not do that, but it doesn't 
>seem to be working for me.
>
i wonder if it is a problem with largefile access ?!?
which version of lvm2 are you using?
does debian patch it?
can you try stracing it an look for seeks, so we can see if it is
wrapping around somewhere?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
