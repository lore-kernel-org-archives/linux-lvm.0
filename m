Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LLKip11903
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 17:20:44 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3LLKgFe014095
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 17:20:43 -0400
Date: Wed, 21 Apr 2004 23:20:41 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvscan takes a lot of time
Message-ID: <20040421212041.GE15169@percy.comedia.it>
References: <Pine.LNX.4.43.0404212006390.4766-100000@beo.doppingen.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.43.0404212006390.4766-100000@beo.doppingen.nu>
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

On Wed, Apr 21, 2004 at 08:17:25PM +0200, Tomas wrote:
>Hi all LVM:ers... (Hmm .. almost sound like lamers ;-) )
>
>  PV /dev/md10   VG mirr_vg01   lvm2 [18,97 GB / 1,84 GB free]
it looks like you are not using devfs, so your dev is filled with a lot
of device nodes, could you try setting up device filters in
/etc/lvm/lvm.conf?

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
