Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j117qdO22828
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 02:52:39 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j117qdWJ016145
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 02:52:39 -0500
Date: Tue, 1 Feb 2005 08:52:39 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Building lvm2 against 2.6.10...
Message-ID: <20050201075239.GB15226@percy.comedia.it>
References: <41FC9F47.4030001@shaw.ca>
	<20050130095955.GL21542@percy.comedia.it>
	<41FDCEF5.1010600@shaw.ca>
	<20050201070014.GA14642@percy.comedia.it>
	<41FF2DA6.4030809@shaw.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41FF2DA6.4030809@shaw.ca>
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

On Tue, Feb 01, 2005 at 12:20:06AM -0700, Gerald Schepens wrote:
>My distro is Red Hat 9.
>
>I do have the device mapper built. Under 2.6.10, it's called dm-mod.
this is the device-mapper module.
you also need to build and install the device mapper library you can
find at:
ftp://sources.redhat.com/pub/dm/
(lvm2 2.00.xx requires 1.00.xx, lvm2 2.01.xx requires dm 1.01.xx)


>I took interest in your comment about header files. Where do you get 
>your /usr/include files if not from the kernel? Do they come with your 
>distro? (Maybe Red Hat 9 is just too old.)
usually the glibc-devel package, but rh9 was based on kernel 2.4, so i
don't know...

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
