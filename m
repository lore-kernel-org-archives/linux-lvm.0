From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RPM for 1.0.8?
Message-ID: <20031201224854.GI23702@percy.comedia.it>
References: <20031129084035.GG22999@percy.comedia.it> <014c01c3b837$e7a491a0$c900a8c0@mithrandir>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <014c01c3b837$e7a491a0$c900a8c0@mithrandir>
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
Date: Mon Dec  1 16:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 01, 2003 at 10:21:14AM -0800, Erick Calder wrote:
>what you're saying then is that I can't run 1.0.8 at all

you can, but i don't know if it would be better to keep kernel and
userspace more or less in sync.
for your core problem. try running vgscan with -d option and see where
it fails.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
