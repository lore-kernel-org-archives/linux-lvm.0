From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problems compiling LVM 1.0.1rc4 and kernel 2.4.13-ac4
Message-ID: <20011030083249.H690@tykepenguin.com>
References: <Pine.LNX.4.33.0110291101360.9045-100000@EOTnetworks.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0110291101360.9045-100000@EOTnetworks.com>; from tren@EOTnetworks.com on Mon, Oct 29, 2001 at 11:03:47AM -0700
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
Date: Tue Oct 30 02:32:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 29, 2001 at 11:03:47AM -0700, Tren Blackburn wrote:
> Hi list;
> 
> Not sure if this has been asked/solved yet.  I searched through the lists
> and found
> http://lists.sistina.com/pipermail/linux-lvm/2001-October/009353.html
> however, what was stated in this message thread didn't seem to solve this
> problem.  I'm getting these errors when linking the kernel:
> 
See http://lists.sistina.com/pipermail/linux-lvm/2001-October/009252.html

For a patch.

The gendisk fix is in CVS but the kiovec API change isn't because it's different
between Alan and Linus kernels.

patrick
