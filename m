Date: Fri, 27 Oct 2000 03:28:22 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] Re: LVM snapshotting broken?
Message-ID: <20001027032822.A9936@caldera.de>
References: <Pine.LNX.4.21.0010261632440.15696-100000@duckman.distro.conectiva> <20001026233707.A12201@srv.t-online.de> <20001027015308.A5034@caldera.de>
Mime-Version: 1.0
In-Reply-To: <20001027015308.A5034@caldera.de>; from hch@caldera.de on Fri, Oct 27, 2000 at 01:53:08AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@sistina.com, Rik van Riel <riel@conectiva.com.br>, linux-kernel@vger.kernel.org, linux-lvm@msede.com, mge@sistina.com

On Fri, Oct 27, 2000 at 01:53:08AM +0200, Christoph Hellwig wrote:
> Look like a structure mis-match to me, although lv_v2_t is the same for
> all tools.

Sorry I was wrong. The __unused field is missing.
Yet another reason for an official 0.8 maintaince release ;)

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
