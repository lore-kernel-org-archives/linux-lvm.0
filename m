Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k745GWLU009899
	for <linux-lvm@redhat.com>; Fri, 4 Aug 2006 01:16:32 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.176])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k745GQYD029162
	for <linux-lvm@redhat.com>; Fri, 4 Aug 2006 01:16:26 -0400
Received: by py-out-1112.google.com with SMTP id o67so155558pye
	for <linux-lvm@redhat.com>; Thu, 03 Aug 2006 22:16:21 -0700 (PDT)
Message-ID: <ebf0fc470608032216o231ad8aeyb4279e2b670fad08@mail.gmail.com>
Date: Fri, 4 Aug 2006 14:16:20 +0900
From: "Stanislaw Senotrusov" <senotrusov@gmail.com>
Subject: Re: [linux-lvm] pvresize, resize 8e Linux LVM partition
In-Reply-To: <200608031154.32467.peregrine@openbrainstem.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ebf0fc470608022227j23bbe62dkffd4df84e727edc9@mail.gmail.com>
	<200608031154.32467.peregrine@openbrainstem.net>
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

On 8/4/06, Lamont R. Peterson <peregrine@openbrainstem.net> wrote:
> Here is how I would do it:
>
> 1.  Kickstart install of new box (sets up LVM, includes packages, etc.)
> 2.  Run a script to install all of the needed configuration files for all the
> services the new server needs (could be run as part of the Kickstart).
> 3.  Copy the data the services will be "serving" to the new machine.
>
> There are lots of ways to do step 3.  Personally, I like to avoid as much of
> computational overhead as possible at this stage, so I like NFS mounting and
> "cp -a".  Plain, simple, fast and comprehensive.  YMMV.

Thank you for the letter, Lamont!

Procedure you described requires a so much time to complete.

Tomorrow I end up the following pipeline:

1. Create only one 4Gb plain root partition (no LVM) which holds a
entire system and my application. It's used in a development and test
environment. The actual stored data is about a 1.5 Gb. I am pretty
sure the base system it never fills entire 4 Gb in my case.

2. To build a production server I am bytecopy the root partition to a
new box (only a few minutes), boot from it, create LVM in a free space
and moves application from root to LVM.
Production database now have space to grow. Also I get rid of equal
UUID problem.

Additionally there is no need for kickstart process is VM environment
- I just need to setup OS one time, and then when I need another box I
just clone initial setup - it takes a few second. For testing and
development VM overhead is ok.

--
Stas Senotrusov
