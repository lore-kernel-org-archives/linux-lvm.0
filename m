Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j259Gen04386
	for <linux-lvm@redhat.com>; Sat, 5 Mar 2005 04:16:40 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j259GXXw008214
	for <linux-lvm@redhat.com>; Sat, 5 Mar 2005 04:16:33 -0500
Date: Sat, 5 Mar 2005 10:16:31 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Some general questions ..
Message-ID: <20050305091631.GH3192@percy.comedia.it>
References: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
	<42283E6D.9060208@bgc-jena.mpg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42283E6D.9060208@bgc-jena.mpg.de>
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

On Fri, Mar 04, 2005 at 11:54:37AM +0100, Dr.Peer-Joachim Koch wrote:
>So would it be possible to import some dedicated devices
>(all luns from the vg), while other luns are localy active
>and others are active on the third node ?

yes, but there is no locking, so be careful

>If just a pvscan is execute what is happening to "normaly"
>working vg's  ?
nothing

>Is it planed to mirroring of lv onto other devices within
>th vg ?
it will be available in the future, but doesn't the clariion provide
data redundancy.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
