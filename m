From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040102233305.GV26275@percy.comedia.it>
References: <OFDF3AD6E8.3D6822EA-ON00256E0F.007CEE22-00256E0F.007CEE29@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFDF3AD6E8.3D6822EA-ON00256E0F.007CEE22-00256E0F.007CEE29@svunta.os.is>
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
Date: Fri Jan  2 17:34:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 10:44:34PM +0000, Kjartan Reynir Hauksson wrote:
>>no, the culprit for 0x3a is lilo, but initrd should purposefully ignore
>>that.
>>it should mount the root fs and then do a pivot_root, so the kernel
>>trying to open a root device is unexpected.
>
>Well I patched the lilo mdk source file myself so it's probably my fault
>(didn't see anything wrong though).  I tried to get your package from
no, the fact that lilo writes the major number it sees when it is
invoked (3a in your case) cannot be prevented.
but initrd ignores this option, so what you are seing is unexpected to
me.
If you could tell me what your machine prints before the kernel panic i
could try to guess what happened

>comedia.it but it's not responding, can I get it somewhere else ?
>
thanks for noticing, the server is up again now.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
