From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Swap on LVM - swapoff problem
Message-ID: <20030407085200.GC1231@tykepenguin.com>
References: <1049701667.3010.22.camel@ariel>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049701667.3010.22.camel@ariel>
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
Date: Mon Apr  7 03:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 07, 2003 at 10:47:47AM +0300, George Karaolides wrote:
> 
> Hi all,
> 
> I am swapping on lvm devices and aving a strange problem with swapoff.
> 
> I have the swap device configured in /etc/fstab, the relevant line is:
> 
> /dev/vg1/swap   none   swap    sw    0   0
> 
> swap seems to work OK but I have a strange problem with swapoff:
> 
> # swapoff /dev/vg1
> swapoff: /dev/vg1: Invalid argument

swapoff /dev/vg1/swap 

might be a better command to use :-)

patrick
