Subject: Re: [linux-lvm] One cannot read from an lv?
Message-ID: <20021027122212.GA25355@fib011235813.fsnet.co.uk>
References: <20021027112425.GA2723@vader.boskant.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021027112425.GA2723@vader.boskant.nl>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Sun Oct 27 06:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 27, 2002 at 12:24:25PM +0100, Geert Jansen wrote:
> Hello,
> 
> I did some further investigations on the problem of reiserfsck and LVM2 that
> I posted to this list a few days ago. The problem is caused by the fact that
> seek() and read() on the logical volume in /dev/mapper/ fail! For example,
> the command "dd if=/dev/mapper/vg0-tmp" fails to read anything.
> 
> What does this mean? How can an fsck ever check a volume in this case?

We've not been able to reproduce your bug as yet.

- Joe
