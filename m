From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM 1.0.4 pvmove is broken
Message-ID: <20020523060642.GA23087@colombina.comedia.it>
References: <F888C30C3021D411B9DA00B0D0209BE8038F94F7@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F94F7@cvo-exchange.cvo.roguewave.com>
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
Date: Thu May 23 01:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Wed, May 22, 2002 at 04:22:04PM -0700, Poul Petersen wrote:
> 	I've done a lot of testing with pvmove and these are the results:
> 
> 	1) The pvmove tool (versions 1.0.3, 1.0.4, 1.1-rc2) all fail on an
> active volume group when running a LVM-1.0.4 patched 2.4.18 kernel
since you are willing, did you try the pvmove patches that Stephen Tweedie
made a while ago? (he posted an url for those on the list) and they are
implemented in rh7.3 kernel and lvm tools.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
