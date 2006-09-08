Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88FZDRp019840
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 11:35:13 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88FZBNT003902
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 11:35:11 -0400
Date: Fri, 8 Sep 2006 17:35:10 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Altering a Physical Volume's UUID
Message-ID: <20060908153510.GI19633@percy.comedia.it>
References: <20060908125506.GA30379@arvo.suso.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060908125506.GA30379@arvo.suso.org>
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

On Fri, Sep 08, 2006 at 12:55:06PM +0000, Mark Krenz wrote:
>  So is there a way to change the UUID of a physical volume and volume
>group?
>
i'd try with vgcfgbackup, sed, pvcreate, vgcfgrestore.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
