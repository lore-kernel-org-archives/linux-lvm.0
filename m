Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3K5eAuq010329
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 01:40:10 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3K5dpeM015420
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 01:39:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 383D1872F7
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 07:39:50 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id SvFoOOovcLOe for <linux-lvm@redhat.com>;
	Mon, 20 Apr 2009 07:39:50 +0200 (CEST)
Date: Mon, 20 Apr 2009 07:39:49 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
Message-ID: <20090420053949.GA16457@maude.comedia.it>
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
	<49EACA64.8070006@redhat.com>
	<49EB4045.7020407@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49EB4045.7020407@whgl.uni-frankfurt.de>
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

On Sun, Apr 19, 2009 at 05:16:21PM +0200, Sven Eschenberg wrote:
> Unfortunately I don't have the box at hand for 2 days, but I asked md to 
> use a chunksize of 2048K and the /proc/mdstat reported 2048K, last time I 
> checked.
> The LVM hat a phy-extsize of 2M and with the --dataalignment option set to 
> 2M, pvs reported a pe_start value of 2M aswell.

if you have a 2M chunk size, a full stripe is 2M*(N-1), where N-1 is the
number of drives in your array minus redundancy. (i.e. for a 5 drive
raid5 a stripe size would be 8M).

L.

-- 
Luca Berra -- bluca@comedia.it
          Communication Media & Services S.r.l.
   /"\
   \ /     ASCII RIBBON CAMPAIGN
    X        AGAINST HTML MAIL
   / \
