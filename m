Date: Sun, 16 Apr 2000 00:56:21 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] [Patch] lvchange better error reporting
Message-ID: <20000416005620.A26537@home.ds9a.nl>
References: <20000415203514.A21662@home.ds9a.nl> <NDBBKHFNKLCILCNALIHPGEIECBAA.hpuxadm@choice.net>
Mime-Version: 1.0
In-Reply-To: <NDBBKHFNKLCILCNALIHPGEIECBAA.hpuxadm@choice.net>; from hpuxadm@choice.net on Sat, Apr 15, 2000 at 07:38:24PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christopher Briggs <hpuxadm@choice.net>
Cc: mauelsha@ez-darmstadt.telekom.de, linux-lvm@msede.com

On Sat, Apr 15, 2000 at 07:38:24PM -0400, Christopher Briggs wrote:

> I've been watching the thread for about a week+ now, and am determined to go
> with LVM, especially being so HPcentric and loving LVM for that platform.

LVM is cool indeed.

> What rev kernel would be best considering LVM and what is the best way to
> get there(pointing me to a FAQ/www be more than appropriate.

I'm not sure. Kernel 2.3.99pre6-3 is not ready for mission critical work,
and the 2.2 revisions of the LVM 0.8final kernel patches aren't available
yet.

> Also, Heinz - What are you using to develop your GUI frontend?(just curious)

I think you mean me by this. I am using Glade, libglade and GTK+. On a side
note, I'm still making good progress with the lvm-manager. It is almost
useable.

Currenly you can

	create volume groups
	move PEs from physical volumes
	move Physical Volumes from/to Volume Groups (with drag-and-drop even!)
	change active state
	remove volume groups
	create/remove logical volumes

Regards,

bert hubert. 

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
