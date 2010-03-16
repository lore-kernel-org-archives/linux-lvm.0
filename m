Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GI6Ul9007043
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 14:06:30 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GI6KNR002823
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 14:06:21 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id BE0298711C
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 19:06:19 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 8o0zRFS7Zgtp for <linux-lvm@redhat.com>;
	Tue, 16 Mar 2010 19:06:19 +0100 (CET)
Date: Tue, 16 Mar 2010 19:06:19 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100316180619.GC15884@maude.comedia.it>
References: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
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

On Tue, Mar 16, 2010 at 05:40:20PM +0100, blub@trans.am wrote:
>hello
>
>I have troubles to get multipathing working on gentoo. I have an identical
>setup working on a debian box.
>The problem is that LVM does not detect labels on the multipath device
>node; instead it does try to use a physical path (eg /dev/sda1)
>
>the device nodes /dev/dm-X are not automaticaly created like they get on
>debian, I did run dmsetup mknodes which did not create /dev/dm-X nodes, so
>i created /dev/dm-0 with the minor/major of the corresponding /dev/mapper/
>node. I don't know if this is a problem.
>
>anyway, I've pasted alot of output to http://pastebin.com/wheL4nyE
>
change the preferred_names in /etc/lvm.conf to reference /dev/mapper
entries before /dev/sd

eg:
preferred_names = [ "^/dev/mapper/" ]

L.


-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
