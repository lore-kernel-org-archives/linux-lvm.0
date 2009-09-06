Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n86IDwcA016133
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 14:13:58 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n86IDgea011353
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 14:13:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 9362B86F22
	for <linux-lvm@redhat.com>; Sun,  6 Sep 2009 20:13:40 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id q3ThJbMwRkWC for <linux-lvm@redhat.com>;
	Sun,  6 Sep 2009 20:13:40 +0200 (CEST)
Date: Sun, 6 Sep 2009 20:13:40 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Inode usage on lvm volumes?
Message-ID: <20090906181340.GA27551@maude.comedia.it>
References: <4AA3EB65.40909@Media-Brokers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4AA3EB65.40909@Media-Brokers.com>
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

On Sun, Sep 06, 2009 at 01:03:33PM -0400, Charles Marcus wrote:
>Hello,
>
>I've googled for an hour now and cannot find an answer to this question...
>
>I'm on gentoo linux, and when I run:
>
>df -i
>
>I get a list of inode usage for everything except my lvm volumes - they
>show zeros all the way across:
>
>Is this normal? If so, how do I check inode usage on an lvm volume?
>
>Thanks,
>
>Charles
>
weird, df -i works on all of my boxes. (redhats and mandriva)

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
