From: Linus Torvalds <torvalds@transmeta.com>
Subject: Re: [linux-lvm] Re: [RFLART] kdev_t in ioctls
In-Reply-To: <20020114194554.A5885@caldera.de>
Message-Id: <Pine.LNX.4.33.0201141048050.1161-100000@penguin.transmeta.com>
MIME-Version: 1.0
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
Date: Mon Jan 14 12:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@caldera.de>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-lvm@sistina.com, Alexander Viro <viro@math.psu.edu>, linux-kernel@vger.kernel.org

On Mon, 14 Jan 2002, Christoph Hellwig wrote:
>
> I know - still it makes Linus' suggestion not work on ~90% of the
> systems.

It doesn't matter if user-land compilation breaks. As long as old binaries
work (and they will), we're fine.

User-land was _already_ broken. By virtue of using a type that it should
NOT have used.

If you want to use __kernel_dev_t, go ahead.

		Linus
