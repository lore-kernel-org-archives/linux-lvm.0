Subject: Re: [evms-devel] [linux-lvm] [ANNOUNCE] LVM reimplementation
    ready for beta testing
In-Reply-To: <20020203003937.B874@gnu.org> from
    "Andrew Clausen"
    at Feb 03, 2002 12:39:37 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E16X63T-0000KH-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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
Date: Sat Feb  2 13:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clausen <clausen@gnu.org>
Cc: Kevin Corry <corryk@us.ibm.com>, thornber@fib011235813.fsnet.co.uk, linux-lvm@sistina.com, evms-devel@lists.sourceforge.net, Jim McDonald <Jim@mcdee.net>, Andreas Dilger <adilger@turbolabs.com>, linux-kernel@vger.kernel.org

> > this graph (except the volume group). But in reality, we don't want someone 
> > coming along and mucking with md0 or with LV2 or with any of the disk 
> > partitions, because they are all in use by the two volumes at the top.
> 
> It's the user's fault if they choose to write on such a device.

You want access to the raw devices as well as the virtual volumes. You
try doing SMART diagnostics online on an md volume if you can't get
at /dev/hd* and /dev/sd*.

You don't want to mount both layers at once I suspect, but even that
may be questionable for a read only mirror.

Alan
