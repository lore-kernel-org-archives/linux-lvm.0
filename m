From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Does LVM compile on Sparc64?
Message-ID: <20011214191520.GA19114@tykepenguin.com>
References: <20011214185558.A11845@trash.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011214185558.A11845@trash.net>
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
Date: Fri Dec 14 13:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 14, 2001 at 06:55:58PM +0100, Thomas Bader wrote:
> Hi Everybody
> 
> I got the source of Linux 2.2.20 and applied the patches of
> LVM 1.0.1 (including Stephen Tweedie's rawio patch and
> linux-2.2.18-sparc64.diff).
> 
> The patches do apply well, but it seems like there are some
> missing definitions in include/linux/lvm.h:
> 
> duke:/usr/src/linux# make vmlinux

See http://lists.sistina.com/pipermail/linux-lvm/2001-December/009950.html

for a patch that should work.

I'll make a proper 2.2 one next week.

patrick
