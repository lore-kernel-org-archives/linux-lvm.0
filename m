Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j887EbV03175
	for <linux-lvm@redhat.com>; Thu, 8 Sep 2005 03:14:37 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j887EUbo003742
	for <linux-lvm@redhat.com>; Thu, 8 Sep 2005 03:14:31 -0400
Date: Thu, 8 Sep 2005 09:14:23 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] VGDA Question
Message-ID: <20050908071423.GC21002@percy.comedia.it>
References: <20050907144600.42410.qmail@web52915.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050907144600.42410.qmail@web52915.mail.yahoo.com>
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

On Wed, Sep 07, 2005 at 07:46:00AM -0700, Rik Herrin wrote:
>Hi,
> According to the LVM man page, the VGDA (Volume Group
>Descriptor Area) holds the metadata responsible for
>keeping information about the LVs.  However, it is
>contained in the PVs.  Why does the VGDA contain both
>LV descriptors and PE descriptors?  Shouldn't it just
>have PE descriptors and leave the LV descriptors to
i tried, but fail to understand your question.
The VGDA is the only place on disk where information necessary for
activation of the volume group and contained logical volume can be
stored permanetly.

>the volume group?  Also, when booting, what makes the
>kernel know that there are VGs and LVs?  Does it look
The kernel doesn't. lvm is setup by user space tools.

>Finally, where exactly is the VGDA information held?. 
>Thanks for your time.
at the beginning of the PV
regatds

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
