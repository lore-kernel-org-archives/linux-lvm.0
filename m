From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Does LVM compile on Sparc64?
Message-ID: <20011217082051.GA1027@tykepenguin.com>
References: <20011214185558.A11845@trash.net> <20011214191520.GA19114@tykepenguin.com> <20011214224027.A122@trash.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011214224027.A122@trash.net>
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
Date: Mon Dec 17 02:19:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 14, 2001 at 10:40:27PM +0100, Thomas Bader wrote:
> Hi
> 
> In alphanet.ml.linux.lvm, you wrote:
> >  See http://lists.sistina.com/pipermail/linux-lvm/2001-December/009950.html
> >  
> >  for a patch that should work.
> 
> Oh nice.  I didn't found this patch yet (searched with
> google).
> 
> I applied it and it compiled without error.  But now, my
> machine does not boot anymore - it hangs directly after it
> has detected my raid arrays:

I honestly don't know what that should be, sorry. I know for sure that LVM has
worked for me on SPARC64 with those patches applied so all I can suggest is to
check the rest of your kernel config and maybe do a clean rebuild of the kernel.

-- 

patrick
