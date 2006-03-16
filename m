Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GHs3121668
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 12:54:03 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2GHrvwP012264
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 12:53:57 -0500
Date: Thu, 16 Mar 2006 18:53:56 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20060316175356.GA20437@percy.comedia.it>
References: <H000007200bf1fff.1142521692.fsu50.nll.se@MHS>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <H000007200bf1fff.1142521692.fsu50.nll.se@MHS>
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

On Thu, Mar 16, 2006 at 04:08:12PM +0100, fredrik.backman@nll.se wrote:
>Hi
>
>Im doing a snapshot (hardware-based in EVA5000) of a LV (lvm2) and i 
>wonder what is the correct way to use this snapshot? Problem is that 
>this snapshot has the same ID as the original one. In HP-UX a would do a 
>vgchgid on this snapshot-LV. Any help would be aprreciated.
>

maybe use vgcfgbackup, change the uid and vgcfgrestore?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
