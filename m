Message-ID: <1024572480.3d11bc400c205@webmail3.wanadoo.nl>
From: sander@sanderscorner.com
Subject: Re: [linux-lvm] ext2online and 2.4.18
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus> <20020619195508.GA22427@clusterfs.com> <1024521044.1861.6.camel@hiro.prowell.org.bogus>  <20020619214731.GB22427@clusterfs.com> <1024525638.1861.54.camel@hiro.prowell.org.bogus>
In-Reply-To: <1024525638.1861.54.camel@hiro.prowell.org.bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Thu Jun 20 06:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Ian,

I applied your patch to 2.4.18 kernel. It applied cleanly. Compiled the new
kernel and no problems doing that but... ext2online still fails while in the
kernel.

Hope this helps,
Sander de Boer

Citeren Ian Prowell <ip_lvm@prowell.org>:

> Attached is the reject file.  It looks like hunk 10 removes 27 lines
> from super.c around line 594, but these were not getting removed in
> 2.4.18.  Also attached is what I think the 2.4.18 patch should be.
> 
> -Ian
> 
> 






__________________________________________________________

Snel en makkelijk mailen

Wanadoo webmail || http://webmail.wanadoo.nl
