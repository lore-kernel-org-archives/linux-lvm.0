Date: Fri, 8 Sep 2000 01:00:43 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908010043.A24514@gruyere.muc.suse.de>
References: <200009071825.MAA08578@lynx.turbolabs.com> <20000907234301.B21294@gruyere.muc.suse.de> <20000908001109.A23577@srv.t-online.de>
Mime-Version: 1.0
In-Reply-To: <20000908001109.A23577@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Fri, Sep 08, 2000 at 12:11:09AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@sistina.com
Cc: Andi Kleen <ak@suse.de>, mge@sistina.com, linux-lvm@msede.com

On Fri, Sep 08, 2000 at 12:11:09AM +0000, Heinz J. Mauelshagen wrote:
> We can start from that but i like to extract the bare mapping code from
> lvm_map() and call that one from bmap to have a cleaner interface.

It'll just lead to code duplication. You probably do not want to add
another function call into the mapping path, so it would need to be inlined
anyways, causing at least two copies of the code. Probably not a big deal
as such, but many small bloat additions add up in the log run.


-Andi
