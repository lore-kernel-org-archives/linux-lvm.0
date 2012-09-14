Date: Fri, 14 Sep 2012 14:35:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120914133556.GI15728@agk-dp.fab.redhat.com>
References: <50477429.8080204@xs4all.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50477429.8080204@xs4all.net>
Subject: Re: [linux-lvm] automatically filter disks with imsm or
	ddf	superblocks
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel van Smoorenburg <mikevs@xs4all.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Sep 05, 2012 at 05:47:53PM +0200, Miquel van Smoorenburg wrote:
> Note that dev-ddf.c and dev-imsm.c have "Copyright: Miquel van  
> Smoorenburg" headers.. it looks like lvm only has redhat copyrighted  
> stuff in it. Feel free to remove my copyright there, and/or add redhat  
> copyright. The contents of those files aren't really original anyway,  
> mostly copied from dev-md.c.

Copyright is additive in these circumstances: keep our copyright line and 
append yours.

> - mdadm calls this format "imsm", should we keep that name or use
>   "matrix", or perhaps "(Intel) RST" since Intel renamed "matrix
>   raid" to "Rapid Storage Technology" last year.

Internally, I'm not bothered. Docs should probably mention alternative
names.

> - right now the md_component_detection configuration option also
>   turns on/off ddf and imsm detection. I think that is fine as in
>   linux it is the "md" driver that supports those formats. 

I agree.  It's unlikely people will need one without the other.

Alasdair
