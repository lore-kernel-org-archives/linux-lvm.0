Message-ID: <3FE36BAF.7030406@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Ext3 -> ReiserFS on '/' convertion prob
References: <3FE2892B.8000506@alteeve.com>	 <1071846372.22613.2.camel@gecko.indygecko.com>	 <3FE32D1A.6040500@alteeve.com> <1071857908.22615.13.camel@gecko.indygecko.com> <3FE357AA.6090305@alteeve.com> <3FE36341.5070105@stercomm.com> <3FE36579.8090605@alteeve.com>
In-Reply-To: <3FE36579.8090605@alteeve.com>
Content-Transfer-Encoding: 7bit
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
Date: Fri Dec 19 15:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Madison Kelly wrote:
> I am so sorry for asking but how would I check?
> 

I'm a SUSE user myself.  It's mkinitrd script
makes it pretty easy to add modules to your
initrd.  I'd check that lvm_mkinitrd script
of yours... you may have to tweak it.
In fact, SUSE's script detects (tries anyway) if
your root filesystem is LVM's and automatically
adds in the lvm_mod if it wasn't specified.

There's probably a way to find out easily if
it's there already.. just not sure off the top of my head.
