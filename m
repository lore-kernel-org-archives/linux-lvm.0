Message-ID: <3F5DCB63.5020307@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software mirror with LVM
References: <A06B238D6FBAD1118C1F080036D2D40301241854@singwnt.igsea.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Sep  9 13:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Tan, Hong King wrote:
> Greetings,
> 
> I am proposing a ML350 server with internal raid and another raid
> controller(Smart Array 5302) connected to StorageWorks Enclosure 4314.
> 
> The internal raid is configured as RAID 1 across 2 drives and the external
> raid is configured as RAID 5 acroos 3 drives. 
> 
> Can I use LVM to perform a software mirror between the internal raid and
> external raid volumes or I would need 3-party software like Veritas
> Foundation Suite for Linux ?

lvm1 cant be a mirror. LVM2 might have the posibillity, but i wouldnt
use it for production just yet.

Why cant you just use another software raid ontop of that?




JonB
