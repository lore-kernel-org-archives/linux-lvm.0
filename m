Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6IMpuwh010648
	for <linux-lvm@redhat.com>; Tue, 18 Jul 2006 18:51:56 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6IMpsKZ024640
	for <linux-lvm@redhat.com>; Tue, 18 Jul 2006 18:51:54 -0400
Date: Wed, 19 Jul 2006 00:51:52 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Error setting up a mirrored lv
Message-ID: <20060718225144.GA28146@percy.comedia.it>
References: <D81E5F9261AA644D90FF7B8E4005881737C122@PDBEX02E.pdb.fsc.net>
	<44BD337D.8070005@chaos.ao.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44BD337D.8070005@chaos.ao.net>
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

On Tue, Jul 18, 2006 at 03:16:13PM -0400, Harik A'ttar wrote:
>As you noticed, you need a log partition.  dm-mirror is a bit smarter 
>then the basic MD raid1 in that it uses a log disk to keep track of 
>write completions for synchronization.  I've only recently got a kernel 
Just for fairness, modern md also supports bitmaps either on a different
device or inside the md components for this very purpose.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
