From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020510072608.GA1001@tykepenguin.com>
References: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>
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
Date: Fri May 10 02:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 09, 2002 at 09:54:40AM -0700, Au, Richard wrote:
> Hi,
> 
> I'm wondering if anyone has used LVM in a high-availibility cluster
> where two servers are connected to shared storage (the physical
> volumes).  If so, which cluster solution did you use?  Will there be
> problems if the logical volumes are visable to both servers, even if
> only one of them has them mounted?  Thanks!

Provided you're either using GFS as the file system or being VERY careful to
mount the filesystem on only one node at a time you can do this.

The key is just to be VERY careful. If you need to do any LVM commands you MUST

umount filesystems on all other nodes
vgchange -an on all other nodes

do the LVM metadata changes

vgscan on all nodes
vgchange -ay on all nodes.

The safe thing to do is to have only one node have the LVM commands available to
it (apart from vgscan & vgchange) and be VERY careful.

I'll say that again: Be VERY careful !

patrick
