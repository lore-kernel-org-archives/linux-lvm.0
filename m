Date: Wed, 8 Nov 2000 11:11:29 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108111129.G11411@redhat.com>
References: <20001107205137.A7093@inspiron.suse.de> <200011072036.eA7Ka6s03317@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011072036.eA7Ka6s03317@webber.adilger.net>; from adilger@turbolinux.com on Tue, Nov 07, 2000 at 01:36:06PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Andrea Arcangeli <andrea@suse.de>, "Stephen C. Tweedie" <sct@redhat.com>, Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

Hi,

On Tue, Nov 07, 2000 at 01:36:06PM -0700, Andreas Dilger wrote:
> Andreas writes:
> It would probably be a lot better to simply change ext3 to handle the
> "proper snapshot" stuff that is in ReiserFS, so that at the time of the
> snapshot, the journal is flushed and the RECOVER flag is removed from
> the superblock (and returned afterwards).

Right --- that's easy to do, but it doesn't mean that it's OK to lie
about the ro_bits!

Cheers,
 Stephen
