Subject: Re: [linux-lvm] Error creating snapshot, "Cannot allocate memory"
Message-ID: <20021203182119.GD21924@ofb.net>
References: <20021202223223.GC21924@ofb.net> <20021203114821.A25161@sistina.com> <3DEC9B03.B83C0078@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DEC9B03.B83C0078@silicide.dk>
From: Jason Heiss <jheiss@ofb.net>
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
Date: Tue Dec  3 12:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 03, 2002 at 12:52:35PM +0100, Jon Bendtsen wrote:
> "Heinz J . Mauelshagen" wrote:
> > 
> > You don't have enough kernel virtual memory to hold the snapshot exception
> > table in core :(
> > Install more RAM.
> 
> I've seen this error as well. In a machine with 1GB memory and the only
> processes
> running were NFS and samba. Just how much memory does it need ?
> 

Indeed, my server has 2 GB of RAM and 1 GB of swap, of which free
reports only a few hundred MB in use.

Jason
