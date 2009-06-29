Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5TE2C45004254
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2009 10:02:12 -0400
Received: from eastrmmtao102.cox.net (eastrmmtao102.cox.net [68.230.240.8])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5TE1a60004193
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2009 10:01:37 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090629140135.IHKG14603.eastrmmtao102.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Mon, 29 Jun 2009 10:01:35 -0400
Message-ID: <4A48C94E.90700@cox.net>
Date: Mon, 29 Jun 2009 10:01:50 -0400
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] S.I. and consistent units
References: <4A46366C.2000607@impulze.org> <4A47F129.7040701@impulze.org>
	<20090629055011.GA14031@maude.comedia.it>
In-Reply-To: <20090629055011.GA14031@maude.comedia.it>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 06/29/2009 01:50 AM, Luca Berra wrote:
> On Mon, Jun 29, 2009 at 12:39:37AM +0200, Daniel Mierswa wrote:
>> Daniel Mierswa wrote:
>>> i'm willing to come up with a patch that attempts to fix those
>>> consistency issues, if patches are welcome.
>> So I did although noone gave me the permission yet!  :-)
>> Please let me know what you think, any kind of feedback is appreciated.
>> I attached a git format-patch against  revision 11f40b. (It's gzip since
>> otherwise the MTA of the list just absorbs my mail without any reply.)
> did not really check all of it, but +               {" Exabyte",  " 
> EiB", "e"},
> +               {" Petabyte", " PiB", "p"},
> +               {" Terabyte", " TiB", "t"},
> +               {" Gigabyte", " GiB", "g"},
> +               {" Megabyte", " MiB", "m"},
> +               {" Kilobyte", " KiB", "k"},
> these units should be named
> Exbibyte
> Pebibyte
> Tebibyte
> Gibibyte
> Mebibyte
> Kibibyte
>
> respectively,
>
> L.
>

Translations obviously needed.....
