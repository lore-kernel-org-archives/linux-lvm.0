Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F9518@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Subject: RE: [linux-lvm] Questions about PE size and clustering
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
Date: Tue Jun  4 11:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: Tuesday, June 04, 2002 6:12 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Questions about PE size and clustering
> 
<snip> 
> 
> Correct.
> 
> In summer, you can go with Cluster LVM + GFS in order to avoid these
> constraints. That'll give you shared volume groups active on all nodes
> and GFS filesystems mounted on all as well.
> 

	Ah, it's already in the works :) I've managed to poke around and dig
up some sketchy information about Cluster LVM and now I have the following
questions:

	1) Any ideas on whether Cluster LVM be open/free, or will it follow
GFS?
	2) It looks like Cluster LVM is being based on the 1.x LVM model?
Will this
		actually be considered a separate product, or simply a
release of 1.x with the
		necessary global locking?

Thanks,

-poul
