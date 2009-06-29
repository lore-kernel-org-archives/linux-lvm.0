Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5T5oWl4002449
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2009 01:50:32 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5T5oD3S024077
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2009 01:50:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 97D2086F37
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2009 07:50:11 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id vAEqHUmAnTlA for <linux-lvm@redhat.com>;
	Mon, 29 Jun 2009 07:50:11 +0200 (CEST)
Date: Mon, 29 Jun 2009 07:50:11 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] S.I. and consistent units
Message-ID: <20090629055011.GA14031@maude.comedia.it>
References: <4A46366C.2000607@impulze.org> <4A47F129.7040701@impulze.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A47F129.7040701@impulze.org>
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

On Mon, Jun 29, 2009 at 12:39:37AM +0200, Daniel Mierswa wrote:
>Daniel Mierswa wrote:
>> i'm willing to come up with a patch that attempts to fix those
>> consistency issues, if patches are welcome.
>So I did although noone gave me the permission yet!  :-)
>Please let me know what you think, any kind of feedback is appreciated.
>I attached a git format-patch against  revision 11f40b. (It's gzip since
>otherwise the MTA of the list just absorbs my mail without any reply.)
did not really check all of it, but 
+               {" Exabyte",  " EiB", "e"},
+               {" Petabyte", " PiB", "p"},
+               {" Terabyte", " TiB", "t"},
+               {" Gigabyte", " GiB", "g"},
+               {" Megabyte", " MiB", "m"},
+               {" Kilobyte", " KiB", "k"},
these units should be named
Exbibyte
Pebibyte
Tebibyte
Gibibyte
Mebibyte
Kibibyte

respectively,

L.

-- 
Luca Berra -- bluca@comedia.it
          Communication Media & Services S.r.l.
   /"\
   \ /     ASCII RIBBON CAMPAIGN
    X        AGAINST HTML MAIL
   / \
