From: Benoit <benoit.peccatte@enst-bretagne.fr>
Subject: Re: [linux-lvm] lvm metadata
References: <200311111144.36636.benoit.peccatte@enst-bretagne.fr> <20031111160213.F28265@sistina.com>
In-Reply-To: <20031111160213.F28265@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200311111710.28930.benoit.peccatte@enst-bretagne.fr>
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
Date: Wed Nov 12 07:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tuesday 11 November 2003 16:02, you wrote:
> On Tue, Nov 11, 2003 at 11:44:36AM +0100, Benoit wrote:
> > Hello,
> >
> > You may ask why. Then is my second question, why aren't vgscan and
> > vgchange implemented in kernel and called at boot time ? This would make
> > us be able to consider logical volumes as standard partitions and mount
> > them easily, even as /
>
> That's what an initrd/initramfs is for ;)

I think initrd is more a trick than the real place to do it. I mean, making a 
ramdisk needs of space, time to create it, and unnecessary initialisation 
things. This, only to do a vgscan, vgchange -a at boottime. Aren't those 
tools simple calls to system functions ?


> > PS: Please cc-me with the anser as I'm not subscribed to the list.
