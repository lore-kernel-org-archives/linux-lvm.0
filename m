Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011270342.eAR3gQK31595@webber.adilger.net>
Subject: Re: [linux-lvm] Change in startup script
In-Reply-To: <3A1FF052.F2B546DB@ednet.ns.ca> "from Patrick Boutilier at Nov 25,
 2000 01:01:06 pm"
Date: Sun, 26 Nov 2000 20:42:26 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: LVM Mailing List <linux-lvm@nibbler.sistina.com>, James MacLean <macleajb@ednet.ns.ca>

You write:
> If anybody is upgrading from LVM 0.8i (and probably other 0.8 versions)
> to 0.9 you will need to modifying the following startup script which I
> got from somebody on this list. The -f needs to be changed to -d to
> reflect the new /proc/lvm which is now a directory instead of a file.

Even better would be something like "-r" (for readable) or "-e" (for
exists), so that you can boot back and forth between the kernels.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
