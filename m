Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4KHdO002185
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 13:39:24 -0400
Received: from monkey.sneakemail.com (clean.sneakemail.com [38.136.15.35])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i4KHdOGG020583
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 13:39:24 -0400
Date: Thu, 20 May 2004 19:39:16 +0200
Subject: Re: [linux-lvm] Ext3, 2.4.26 and lvm snapshot
Message-ID: <29703-69379@sneakemail.com>
References: <20040420174154.7565e081.julien.combes@i-carre.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040420174154.7565e081.julien.combes@i-carre.net>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

COMBES Julien wrote 29 lines:

[mounting ext3 snapshots fails, ext2 works]

> I searched on internet and I found some information but it let me
> confused. I found many informations about a VFS-patch which seems to be
> necessary, but I don't found this patch for a linux kernel 2.4.26 (I only
> found it for version up to 2.4.22).

Apply the 2.4.22 patch to the 2.4.26 tree, it works.

You may get warnings about the line numbers being a bit off or
even about 'fuzzy' matches, but the 'patch' program is clever
enough to do the right thing.

> So I wonder if this patch is always necessary ?

If you want to mount ext3 snapshots, yes, it is.

-Wolfgang
