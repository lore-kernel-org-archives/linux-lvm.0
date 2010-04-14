Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3E5MAuV021527
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 01:22:11 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3E5LwxR019421
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 01:21:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 9A06186F7E
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 07:21:56 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id csXQAyDjO8Bs for <linux-lvm@redhat.com>;
	Wed, 14 Apr 2010 07:21:51 +0200 (CEST)
Date: Wed, 14 Apr 2010 07:21:51 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100414052151.GA28457@maude.comedia.it>
References: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

On Tue, Apr 13, 2010 at 08:59:40PM -0400, Vickie Troy-McKoy wrote:
>
>Hi All,
>
> 
>
>I have a RedHat4 server connected to a SAN 3510 Array.  On the host server, there are two volume groups set up--root_vg and san_vg.  I'm assuming that root_vg resides on the internal disks and san_vg on the SAN.  But, how can I check to make sure this is the case?
>
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

try with the pvs command

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
