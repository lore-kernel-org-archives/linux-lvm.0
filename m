Subject: Re: [linux-lvm] Lost partition table, how can I find the start of
	the PV?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <1069773294.12078.3.camel@localhost>
References: <1069736195.28598.76.camel@pc>
	 <1069773294.12078.3.camel@localhost>
Message-Id: <1069822510.1881.5.camel@javadt.localdomain>
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
Date: Tue Nov 25 22:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2003-11-25 at 10:14, qv6 wrote:
> 
> How about booting from the installation cd that you used to build the
> system.

To be clear, I don't have a problem booting the system or even putting
the disk into a situation/configuration where I can play doctor on it. 
That is not the nature of my query.

What I want to know is if there is any way I can use LVM, and the way it
writes metadata into the partition (if indeed it does do that) to help
me determine where that given PV started so that I can put the partition
boundaries (i.e. the partition table) back and try to further recover
the PV.

b.
