Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BHxgxH029423
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 13:59:42 -0400
Received: from qb-out-0506.google.com (qb-out-0506.google.com [72.14.204.233])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7BHxafX005984
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 13:59:36 -0400
Received: by qb-out-0506.google.com with SMTP id b14so471324qbc
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 10:59:35 -0700 (PDT)
Message-ID: <87f94c370608111059h2259788bx9e6cd37293e8ec5d@mail.gmail.com>
Date: Fri, 11 Aug 2006 13:59:35 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Missing link in /dev/<domain>?
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

All,

Re: SuSE 10.1 w/ 2.6.16 enhanced kernel from the distro.

I had a non-graceful shutdown of a fileserver last night.

Today, the /dev/mapper directory seems to have an extra entry:

my-domain-config
my-domain-home
my-domain-data
my-domain-data-real
control

The unexpected entry is the -data-real one.

The -data entry seems to be corrupted because if I try to mount that I
get "no superblock".  OTOH -data-real can be mounted and has my data
in it.

Another issue is in /dev/<my-domain> I only have 2 links (config and home).

If I manually create the missing data link and point it to -data-real
I can mount my data filesystem, but after a reboot the link is missing
once again.

I'm running SuSE 10.1 which has a dynamically created /dev directory,
so I have no idea where to look to get the missing link to be
recreated properly

So, I guess my first question is what's going on with -data vs
-data-real?  And should fixing that cause the dynamic /dev to properly
start recreating my full set of links?

Greg
-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
