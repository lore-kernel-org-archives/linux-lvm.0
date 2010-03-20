Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2K7WJcx021877
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 03:32:19 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2K7W7oq012002
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 03:32:07 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id D5D2286F71
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 08:32:05 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id YmQsdvob2+UA for <linux-lvm@redhat.com>;
	Sat, 20 Mar 2010 08:32:00 +0100 (CET)
Date: Sat, 20 Mar 2010 08:32:00 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100320073200.GA20875@maude.comedia.it>
References: <4BA3BEBE.2010204@cfl.rr.com>
	<f4f537b51003191136r5f0d96f1m3c0ed8315382009c@mail.gmail.com>
	<4BA3C87C.7020608@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BA3C87C.7020608@cfl.rr.com>
Subject: Re: [linux-lvm] Data alignment
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

On Fri, Mar 19, 2010 at 02:54:52PM -0400, Phillip Susi wrote:
>On 3/19/2010 2:36 PM, Eugene Vilensky wrote:
>> Align the partition?
>
>Then I waste 512k on the MBR, and another 512k on the pv header.  I'd
>like to avoid that if possible and it seems like --dataalignoffset
>should let me do that, but it doesn't accept negative numbers.
then, just do not create the partition and use lvm on the whole disk :P

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
