From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040102165719.GC26275@percy.comedia.it>
References: <OF94AD3C3B.E774A5C0-ON00256E0F.00529B9E-00256E0F.00529BAA@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF94AD3C3B.E774A5C0-ON00256E0F.00529B9E-00256E0F.00529BAA@svunta.os.is>
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
Date: Fri Jan  2 10:58:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 03:02:18PM +0000, Kjartan Reynir Hauksson wrote:
>I noticed that lvm1 was loaded instead of lvm2 but when I check
>update-alternatives --config lvm I see lvm2 used as default over lvm1.
>Might this be causing my kernel panic (no init found).
>
no, mkinitrd 3.5.15.1 does not care about alternatives

your logs, please.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
