Subject: Re: [linux-lvm] can't snap a mounted (reiserfs|ext3) with kernel
	2.2.x
From: Chris Mason <mason@suse.com>
In-Reply-To: <20020824090719.GA5327@tykepenguin.com>
References: <3D6606DD.72E5BB37@ac-amiens.fr> 
	<20020824090719.GA5327@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1030216872.17780.89.camel@tiny>
Mime-Version: 1.0
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
Date: Sat Aug 24 14:20:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sat, 2002-08-24 at 05:07, Patrick Caulfield wrote:
> On Fri, Aug 23, 2002 at 11:56:45AM +0200, Thierry VOYAT wrote:
> > I need to unmount the lvm partition before i can realize a valid
> > snapshot of a journalized fs (reiserfs or ext)
> > All works fine with ext2 :
> > 
> > I known there was a patch for kernel 2.4.x for VFS-lock but nothing for
> > kenel 2.2.x series.
> > 
> > I can't upgrade to kernel 2.4. What can i do ?
> 
> I don't think there is such a thing as the VFS lock patch for 2.2 (unless Chris
> Mason knows otherwise!). 
> 
> In which case, Im afraid, you're stuck.

We do have patch in the 2.2.x suse kernel to add the lockfs calls to the
kernel, but not a reiserfs patch to use them.  Anyone know if 2.2.x ext3
provides a lockfs call?

-chris
