Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GJjPJH029227
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:45:25 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GJjEZv030090
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:45:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 0087286F7A
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 20:45:14 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id GtG9Wh+S3Yvv for <linux-lvm@redhat.com>;
	Tue, 16 Mar 2010 20:45:13 +0100 (CET)
Date: Tue, 16 Mar 2010 20:45:13 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100316194513.GA22130@maude.comedia.it>
References: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
	<20100316180619.GC15884@maude.comedia.it>
	<f6105209d6067f820f119b0f157890d0.squirrel@trans.am>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6105209d6067f820f119b0f157890d0.squirrel@trans.am>
Subject: Re: [linux-lvm] Multipath / LVM2
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

On Tue, Mar 16, 2010 at 08:09:16PM +0100, blub@trans.am wrote:
>hello
>thanks for trying to help :)
>
>I've changed the filter and preferred_names variables to
>
>preferred_names="^/dev/mapper/"
>filter=["a|/dev/mapper/.*|", "r/.*/"]
>
>without luck :(

reading your output again i noticed you partitioned the luns on the HDS
(hope at least you aligned the partition)
but i fail to see the partitioned multipath luns in /dev/mapper
rereading again i see a "livecd" prompt
are you by chance using systemrescuecd (gentoo based)? i tried it once and it did not
run kpartix on /dev/mapper.
you should check your udev rules and see why kpartx is not called and
partitions are not created

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
