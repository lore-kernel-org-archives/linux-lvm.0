Subject: Re: [linux-lvm] JFS or XFS
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20040116002242.47690445@souldaemon>
References: <20040115231819.49123.qmail@web41506.mail.yahoo.com>
	 <20040116002242.47690445@souldaemon>
Message-Id: <1074209631.19419.24.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
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
Date: Thu Jan 15 18:46:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2004-01-15 at 18:22, neuron wrote:
> reiserfs, guaranteed personally.  Especially on a mail server.

I agree, reiserfs was tuned for handling lots of small files.  Sounds
perfect for a mail server.

> I've used jfs, I crashed it twice on purpose (network swap, then disable network card), both times jfs failed to boot.  (this is because it trusts it's own journal, which a lot of people love about it, both times for me it was wrong..)
> Personally I haven't had any problems with XFS though, but I haven't used it that much.
> 

If you go with XFS, stay away from anything older than 1.3.1.

The 1.2 and prior releases had this really nice feature that they
ignored the sync command (and fsync I think).

The end result is that with a power outage or kernel lockup you could
lose lots of work.  I had one failure on a lightly used machine that had
a whole days activities still sitting in the OS disk cache when the
kernel locked up.

This is fixed in 1.3.1, 

Greg
