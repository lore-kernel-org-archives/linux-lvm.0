From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM and HP SecurePath
Message-ID: <20040121001515.GK16867@percy.comedia.it>
References: <400CD3A6.9070201@kapp-coburg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <400CD3A6.9070201@kapp-coburg.de>
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
Date: Tue Jan 20 19:16:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 20, 2004 at 08:07:18AM +0100, Roland Morgenroth wrote:
>hi,
>
>i cannot use LVM, after activating HP SecurePath (failover and load 
>balancing driver).
>lvmdiskscan does not see the devices:
>
>kappco1:~ # lvmdiskscan
weird.
does unitedlinux use devfs by chance?
could you run lvmdiskscan in debug mode?

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
