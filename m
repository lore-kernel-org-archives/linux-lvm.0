Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4J5lkp2031730
	for <linux-lvm@redhat.com>; Tue, 19 May 2009 01:47:47 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n4J5kwj5003952
	for <linux-lvm@redhat.com>; Tue, 19 May 2009 01:46:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 2CB2186F22
	for <linux-lvm@redhat.com>; Tue, 19 May 2009 07:46:57 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id tVRznsuK2pen for <linux-lvm@redhat.com>;
	Tue, 19 May 2009 07:46:57 +0200 (CEST)
Date: Tue, 19 May 2009 07:46:56 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] General LVM information request
Message-ID: <20090519054656.GA3384@maude.comedia.it>
References: <68ACA1A82B5FDD11955600188B42D42B30812F@postpath-lx1.mv1.postpath.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68ACA1A82B5FDD11955600188B42D42B30812F@postpath-lx1.mv1.postpath.com>
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

On Mon, May 18, 2009 at 02:09:08PM -0700, Joe Armstrong wrote:
>Hi,
> 
>I was wondering what the maximum number of LV partitions are for a given PV -and is this configurable ? We have a situation where it would be convenient to have a large number of small partitions and be able to grow those partitions as needed. I just don't know what LVM supports in that area.

there is no relation between LV and PV, the whole idea is to group more
Physical Volumes (i.e. real disks) into a Volume Group, then split the
Volume Group into smaller Logical Volumes.
Btw, these are referred as 'Volumes' not 'partitions'.

as an answer for your second question, the manual page for vgcreate
states that with lvm2 metadata format (the default), has no limit for
the number of LV or PV.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
