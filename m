Date: Fri, 15 Sep 2000 09:35:25 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: [linux-lvm] Re: [PATCH] align lv_on_disk.base to 512K blocks
Message-ID: <20000915093525.A6608@ns.lst.de>
References: <20000914204833.A25390@ns.lst.de> <20000914214554.A29553@ns.lst.de> <20000915090114.B15090@srv.t-online.de>
Mime-Version: 1.0
In-Reply-To: <20000915090114.B15090@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Fri, Sep 15, 2000 at 09:01:14AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@sistina.com
Cc: mge@sistina.com, linux-lvm@msede.com

On Fri, Sep 15, 2000 at 09:01:14AM +0000, Heinz J. Mauelshagen wrote:
> 
> Done.
> 
> How far are you with your driver enhancements?

As far as the in-kernel scanning is concerned I'm working on
getting the detection of vgs with multiple pvs right and
implement some kind of error handling.

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
