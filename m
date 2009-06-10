Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5A5abJO002086
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 01:36:37 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5A5aIw9023234
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 01:36:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 64CBC86F40
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 07:36:18 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id lSv5U7cVtU7A for <linux-lvm@redhat.com>;
	Wed, 10 Jun 2009 07:36:18 +0200 (CEST)
Date: Wed, 10 Jun 2009 07:36:18 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Setting LVM logical volume filesystem type
Message-ID: <20090610053618.GA18433@maude.comedia.it>
References: <cf917e520906091417n31a7a0e1i4e40d84ee8170d68@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf917e520906091417n31a7a0e1i4e40d84ee8170d68@mail.gmail.com>
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

On Wed, Jun 10, 2009 at 12:17:47AM +0300, ajalkane wrote:
>Hi,
>
>how can I set the filesystem type for LVM2 logical volume? For some
>reason my logical volume /var, which is ext3, suddenly started to be
>detected as solaris_mirror_member (or something to that effect) which
>causes it to be unable to be automatically mounted. If I mount it
>manually specifying the filesystem type as ext3 it works. Fsck reports
>no errors.
>
>This happened just suddenly. Naturally I would like to know how it
>could corrupt like that. But it might be difficult. Right now I just
>want my system to be usable again. How can I tell LVM that it is
>indeed ext3 volume without reformatting the logical volume?

lvm has no notion of what is inside a logical volume.
i suppose blkid (which is used by mount to find the fs type got it
wrong)
check running
blkid /dev/vgXXX/lvolYYY
and
blkid -c /dev/null /dev/vgXXX/lvolYYY

L.
-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
