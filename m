Message-Id: <20020228150658.78595.qmail@web13004.mail.yahoo.com>
From: Prashant Kharche <pdkharche@yahoo.com>
Subject: Re: [linux-lvm] Cluster LVM
In-Reply-To: <20020228143217.GA4198@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
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
Date: Thu Feb 28 09:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

--- Joe Thornber <joe@fib011235813.fsnet.co.uk> wrote:
> On Thu, Feb 28, 2002 at 05:03:37AM -0800, Prashant
> Kharche wrote:
> > 
> >   Basically, we are putting a lock on the VG while
> it
> > is getting resized or for any tool which tries to
> > access VG .. So that no other user can access the
> > metadata of that VG.. 
> > WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
> > METADATA.. 
> > We thought of protecting VG DATA (NOT METADATA),
> but
> > it becomes very completed.. so as if now we are
> not
> > taking care of FS access..  
> 
> You need to take care that the volume groups running
> on all nodes
> *always* reflect the metadata on disk.
> 
> For instance, if have two nodes running vg0/lvol0,
> and I issue a
> pvmove from node1, when does node2 find out that the
> mapping has
> changed ?
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html

when node1 issues a command pvmove, LOCK MANAGER will
block all the nodes from accessing the METADATA for
that VG and as soon as it finishes updating the
METADATA, pvmove itself writes the updated kernel VGDA
on the DISK.. so for this period, METADATA consistency
is maintained. 

__________________________________________________
Do You Yahoo!?
Yahoo! Greetings - Send FREE e-cards for every occasion!
http://greetings.yahoo.com
