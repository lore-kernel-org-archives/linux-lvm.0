Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i62Hv3027447
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 13:57:03 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i62Hv1e1020114
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 13:57:02 -0400
Date: Fri, 2 Jul 2004 19:57:00 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Resize VG
Message-ID: <20040702175659.GB10939@percy.comedia.it>
References: <000d01c45f3a$e8d91820$cf42e3c1@pitagora.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000d01c45f3a$e8d91820$cf42e3c1@pitagora.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Jul 01, 2004 at 09:13:23AM +0200, Mimmus wrote:
>Sorry for obvious question: does LVM2 support extending LUN size? What is
there was a plan for a pvresize command for lvm2 but it is not ready
yet, it should be possible to extend a pv by doing a vgcfgbackup,
editing the ascii backup file and doing a vgcfgrestore, search for a
mail from heinz in the archives explaining this.
>the current status of LVM2?
>
lvm2 is working fine, provided you use a very recent 2.6 kernel or the
udm patchset, the mirror target used by pvmove is not yet finished iirc.
unfortunately lvm2 is not supported by RHAS 3.0

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
