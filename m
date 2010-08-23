Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7NDnF4A001240
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2010 09:49:15 -0400
Message-ID: <4C727C5A.4010701@redhat.com>
Date: Mon, 23 Aug 2010 14:49:14 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
References: <0ef301cb427a$1c5d9710$5518c530$@com>
In-Reply-To: <0ef301cb427a$1c5d9710$5518c530$@com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Is there any help for external locking of LVM?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hiya

There's no documentation on writing locking plugins but it's fairly 
straightforward, in principle at least ;-)

Have a look at LVM2/lib/locking/no_locking.c and add your custom locking 
parts in there. You DO need to call the lvm libraries parts or nothing 
will happen.

If your locking library is generally useful I hope you will share it 
with the community.

Chrissie


On 23/08/10 05:17, Kirby Zhou wrote:
> I am working for getting a alternative of built-in clustered locking.
> clvmd cannot support large size cluster well, and cannot across VLAN.
> In my opinion, a centralized locking mechanism is more suitable for
> large-scale cluster.
>
> If I just put locking_dir on a NFS volume with locking_type=1, can I use LVM
> to share a storage across machine?
> Or is there any document can guide me to write a new locking plug-in?
>
> Regards,
>     Kirby Zhou
>     from   SOHU-RD   +86-10-6272-8261
>
