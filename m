From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] md + lvm + reiser
Message-ID: <20020908220411.GA22916@percy.comedia.it>
References: <20020907221823.GL22569@maybe.net> <Pine.LNX.4.44.0209082340310.3113-100000@gmmpc1.gmm.priv>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0209082340310.3113-100000@gmmpc1.gmm.priv>
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
Date: Sun Sep  8 17:07:35 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Sep 08, 2002 at 11:44:41PM +0200, Xavier Montagutelli wrote:
>On Sat, 7 Sep 2002, Chris Jantzen wrote:
>
>> VFS lock patch, yes, but my real question is: why is the raid5 buffer
>> cache constantly thrashing back and forth? I assume this has to do with
...
>I have exactly the same symptoms with the same configuration (md + lvm +
>reiser) ; the raid5 cache size keeps changing when I start using
>snapshots. Does someone have some tips to avoid/explain this ?

The r5 cache needs a fixed request size, Neil once explained me, but i
do not recall the exact details now, when the md layer receives a
request with different size, it has to be emptied and recreated with
the new size.
This is the meaning of the message, it is harmless, except for
performance, at the moment the best that can be done about it is
commenting out the message.

regards,
L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
