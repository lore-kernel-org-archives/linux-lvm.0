From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Swap on LVM - swapoff problem
Message-ID: <20030407134047.GI1231@tykepenguin.com>
References: <1049722293.3745.13.camel@ariel>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049722293.3745.13.camel@ariel>
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
Date: Mon Apr  7 08:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 07, 2003 at 04:31:33PM +0300, George Karaolides wrote:
> Hi Patrick,
> 
> > Odd, it seems fine here. what version LVM are you using ?
> 
> 1.0.4 on Debian GNU/Linux 3.0r1 "woody"
> 
> Some machines have the Debian package from stable (version 1.0.4-4) and
> some the version from testing (version 1.0.4-6)

Actually, I'm more interested in the kernel LVM version. The tools have no
impact on how swappping works. Sorry I should have said. The first line of
/proc/lvm/global should tell you that.
 
> The problem is identical on all machines: swapoff does not work if the
> LVM swap device is listed in /etc/fstab, but works just fine if swap on
> the LVM swap device is started manually with swapon after the system
> starts.

Yes, I tried that. You should check that that when you do swapoff that the
device actually exists: and that the major/minor matches that of the device
when it was swapped on. I think /proc/swaps should tell you this.
-- 

patrick
