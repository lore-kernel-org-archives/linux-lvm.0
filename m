Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105240654.f4O6sJL7031930@webber.adilger.int>
Subject: Re: [linux-lvm] Is now: Resizing & LVM shutdown
In-Reply-To: <990659938.1175.1.camel@localhost> "from Rupert Heesom at May 23,
 2001 07:18:53 pm"
Date: Thu, 24 May 2001 00:54:19 -0600 (MDT)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Rupert Heesom writes:
> As I write this, a new kernel is being compiled with the patch for
> online ext2resizing.  According to xconfig, enabling the option was
> DANGEROUS!

It really is very safe, AFAIK.  I have never had reports of people
losing any data with ext2resize or ext2online.  The only recent bug
reports have been because the checking in the code has been too
strict and it refused to resize someones strange filesystem layout
when it should have...

The only reason that it is still marked dangerous is that anything which
mucks with your filesystem has the _potential_ for causing problems.
Don't let anyone tell you otherwise.  Backups are always a good idea
for all sorts of other reasons.

Once it is part of the official kernel, and has been running without
problems for a while then I will remove the DANGEROUS designation.
Until then, I don't really get much feedback on how widely it is used,
so I would rather be cautious.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
