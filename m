Subject: Re: [linux-lvm] device-mapper patch for lilo (/ and/or /boot on LVM2)
Message-ID: <20021230095059.GA2533@reti>
References: <1040913663.15167.4.camel@chtephan>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1040913663.15167.4.camel@chtephan>
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
Date: Mon Dec 30 03:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 26, 2002 at 03:41:01PM +0100, Christophe Saout wrote:
> Hi!
> 
> Perhaps you might be interested: I've written a small patch agains
> lilo-21.7 so that it recognizes boot files on a /dev/mapper/* volume.

Cool, I especially like the fact that you haven't needed any nasty
BMAP ioctls :)

- Joe
