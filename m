From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011132226.eADMQ5929070@webber.adilger.net>
Subject: Re: [linux-lvm] Removing a PV
In-Reply-To: <3A0F7DFA.90DE9FF0@gnu.org> "from Andrew Clausen at Nov 13, 2000
 04:36:58 pm"
Date: Mon, 13 Nov 2000 15:26:05 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Clausen <clausen@gnu.org>
Cc: bluca@comedia.it, linux-lvm@msede.com

Andrew Clausen writes:
> ext2resize is basically unmaintained, separately from Parted.
> (ext2resize and fsresize merged to make Parted, about 1.5 years ago)

This is totally untrue.  I released a new version of ext2resize about
a month ago.  I don't think parted has any sort of facility for doing
online filesystem resizing, so I don't think that ext2resize will be
gone any time soon.

> So, most people will want to use Parted instead of ext2resize.

Cough..

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
