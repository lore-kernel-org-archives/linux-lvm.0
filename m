From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Swap on LVM - swapoff problem
Message-ID: <20030407143440.GM1231@tykepenguin.com>
References: <1049725753.3745.34.camel@ariel>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049725753.3745.34.camel@ariel>
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
Date: Mon Apr  7 09:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 07, 2003 at 05:29:13PM +0300, George Karaolides wrote:
> Hi Patrick,
> 
> > It could just be that the machine has not enough memory to hold all
> > the processes VM state., but I think it should return ENOMEM for that
> > situation.
> 
> Wouldn't the memory requirement be the same for the case where I comment
> out the swap device line in /etc/fstab and start swap manually?  But it
> works OK then...
> 

probably, I did say I was baffled.


patrick
