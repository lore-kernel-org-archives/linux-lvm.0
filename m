From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: Swap on LVM - swapoff problem - SOLVED
Message-ID: <20030409072302.GE1366@tykepenguin.com>
References: <1049870776.8446.42.camel@ariel>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049870776.8446.42.camel@ariel>
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
Date: Wed Apr  9 02:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 09, 2003 at 09:46:16AM +0300, George Karaolides wrote:
> Hi all,
> 
> I've solved the problem with swapoff and LVM swap devices on Debian
> woody; and the solution may well apply to installations with the root fs
> on LVM using other distributions as well.
> 
> The root filesystem on my machines is in a logical volume device, and to
> mount this at boot time I needed to create an initrd with
> lvmcreate_initrd.  This starts LVM before the root fs is mounted.  The
> init scripts installed by the Debian LVM package then start LVM again,
> which seems to cause the problem.

I suspect that the right device node for the swap LV only really exists on the  
initrd used for booting



patrick
