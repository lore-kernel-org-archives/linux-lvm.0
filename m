Date: Mon, 1 Oct 2001 09:43:50 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm1.0.1rc2 with kernel 2.4.10
Message-ID: <20011001094350.A24418@colombina.comedia.it>
References: <3BB7916D.8216.388145@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BB7916D.8216.388145@localhost>; from noodlez84@earthlink.net on Sun, Sep 30, 2001 at 09:41:01PM -0400
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Sep 30, 2001 at 09:41:01PM -0400, Karol Pietrzak wrote:
> make -C md modules
> make[2]: Entering directory `/tmp/linux/drivers/md'
> make[2]: *** No rule to make target `lvm-snap.h', needed by 
> `lvm.o'.  Stop.
> make[2]: Leaving directory `/tmp/linux/drivers/md'
> make[1]: *** [_modsubdir_md] Error 2
> make[1]: Leaving directory `/tmp/linux/drivers'
> make: *** [_mod_drivers] Error 2
> 
bah,
delete references of lvm-snap.h from makefile.
anyway with 2.4.10 you would be better with current CVS,
due tu min/max braindamage.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
