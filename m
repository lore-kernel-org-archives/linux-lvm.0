From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] vgscan messages regarding read-only cdrom
Message-ID: <20031201195526.GB4846@localhost>
References: <20031130185807.GF7634@glorybox.de> <20031130212501.GO19217@percy.comedia.it> <20031201100842.GA3038@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031201100842.GA3038@glorybox.de>
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
Date: Mon Dec  1 13:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 01 December 2003, at 11:08:42 +0100,
Kai Weber wrote:

> devices {
>     dir = "/dev"
>     scan = [ "/dev" ]
>     filter = [ "r|cdrom|" ]
>     cache = "/etc/lvm/.cache"
>     write_cache_state = 1
> }
>                                                                                 
It seems you can have just one instance of the "filter" directive, where
you must put every filter you want to apply for devices. For example,
this is what I have in my configuration file:
filter = [ "r|hdd|", "r|cdrom|", "r|md|", "a|.*|" ]

I accept every block device under /dev, but previously exclude /dev/hdd
(my CD-ROM device), /dev/cdrom al MD metadevices from the list. It works.

Greetings.

PS: the man page for lvm.conf doesn't explicitily says you can have just
one "filter" directive, neither the opposite, although the sample
"lvm.conf" bundled with sources and packages seemd to give a hint about
the correct syntax. Would it be necessary to be more specific about that ?

Greetings.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.6.0-test10-mm1)
