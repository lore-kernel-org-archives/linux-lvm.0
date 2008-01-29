Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0TAHgk1025687
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 05:17:42 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0TAHIfU005342
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 05:17:18 -0500
Date: Tue, 29 Jan 2008 11:17:18 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] How to hide a "Linux LVM" partition away from Windows?
Message-ID: <20080129101717.GE15191@percy.comedia.it>
References: <20080121140239.GA16686@zenon.in.qult.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080121140239.GA16686@zenon.in.qult.net>
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

On Mon, Jan 21, 2008 at 03:02:39PM +0100, Ignacy Gawedzki wrote:
>Hi everyone,
>
>I've been looking for the answer for some time now and it is apparently
>nowhere to be found, so I resolved to ask it here.
>
>Somehow unexpectedly, Windows "sees" LVM partitions (partition type 8e) and
>shows them in the explorer and in other places.  Of course it doesn't
>understand the format and I don't have access to their contents from there,
>but nevertheless it happens to offer a "format..." entry in the contextual
>menu (brrrr... quite frightening!).  Obviously, LVM just doesn't care that
>much about the partition type when it scans for PVs, so I could probably just
>put something else here (e.g. Linux, 82).
>
>I was just wondering whether anybody here could provide with some insight
>about this (why doesn't Windows simply ignore these partitions or whether
>there are better tricks to hide them from it).  I find it pretty useful to be
>able to identify LVM PVs when using fdisk for example (curiously enough,
>gparted doesn't understand the 8e type).
>
right click on my computer.
chose manage
open disk management
right click on the partitio,
chose change drive letter and paths
chose remove

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
