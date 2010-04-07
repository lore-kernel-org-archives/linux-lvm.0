Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o375Rxmf025376
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2010 01:27:59 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o375RkiJ021762
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2010 01:27:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 5073986F50
	for <linux-lvm@redhat.com>; Wed,  7 Apr 2010 07:27:45 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id x0qrHuXhXloT for <linux-lvm@redhat.com>;
	Wed,  7 Apr 2010 07:27:39 +0200 (CEST)
Date: Wed, 7 Apr 2010 07:27:39 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100407052739.GA16693@maude.comedia.it>
References: <4BBBBA47.5040006@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BBBBA47.5040006@tlinx.org>
Subject: Re: [linux-lvm]
	Error	message:lib64/libdevmapper-event-lvm2snapshot.so.2.02:
	undefined	symbol: lvm2_run
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

On Tue, Apr 06, 2010 at 03:48:39PM -0700, Linda A. Walsh wrote:
>
>I am trying to run a 2.6.33.1 kernel with a Suse11.2 runtime, which
>I think uses a 2.6.31.12 kernel.
>
>Has some user-space library changed that I need to rebuild so I can use
>the newer kernel, or ---
>	WHAT the heck is going on?! :-)
>
>Entire error message (and related messages) from logs:
>
> Home-2010.04.05--18.00.01: event registration failed: 22892:9 libdevmapper-event-lvm2snapshot.so.2.02 dlopen failed: /lib64/libdevmapper-event-lvm2snapshot.so.2.02: undefined symbol: lvm2_run
>  Home/snapshot0: snapshot segment monitoring function failed.
>
>Thanks for any pointers in telling me how to go about fixing this
>new snafu! 
>
>Sigh...
>Suse 11.2 has been such a pain to upgrade to!
looks like underlinking of libdevmapper-event-lvm2snapshot.so.2.02
it should be linked to liblvm2cmd.so.2.02
open a bug report vs your vendor

L.
-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
