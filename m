Subject: Re: [linux-lvm] I broke my PVs!
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20021020213439.GA28082@percy.comedia.it>
References: <20021020213439.GA28082@percy.comedia.it>
Content-Transfer-Encoding: 7bit
Message-Id: <1035154982.29693.5.camel@localhost.localdomain>
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
Date: Sun Oct 20 18:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2002-10-20 at 16:34, Luca Berra wrote:
> On Sun, Oct 20, 2002 at 03:16:34PM -0500, Austin Gonyou wrote:
> >I ran fdisk, then just saved. So I guess you could say I just lost the
> >partition table.
> 
> ok, you lost lvm metadata...

If I lost metadata, what is the best procudure to put it back? I
thought, on linux anyway, that pvcreate was descructive. Can someone
tell me if I'm wrong there?

 > >> destructive, it only touched disk metadata. so you could try
> pvcreate,
> >> vgcreate and lvcreate.
> >> DO A BACKUP OF YOUR RAW DISK DATA FIRST
> >
> >what about vgcfgrestore from another set of smaller disks that are laid
> >out the same way? could that work?
> >
> >Wish I could, but I can't. Don't have enough disk space. :(
> 
> i believe it should be the same...

If anyone can give me a definitive answer, I'd truly appreciate it!

> Heinz? someone?
> 
> l.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
