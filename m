From: Frank Joerdens <frank@joerdens.de>
Subject: Re: [linux-lvm] Is it possible to change the PE size on a live volume?
Message-ID: <20021022152305.A12672@superfly.archi-me-des.de>
References: <20021021194052.B8228@superfly.archi-me-des.de> <005c01c2792c$cd0f9e70$f707a182@gimmie.tudelft.nl>
Mime-Version: 1.0
In-Reply-To: <005c01c2792c$cd0f9e70$f707a182@gimmie.tudelft.nl>; from D.Andriessen@pink.nl on Mon, Oct 21, 2002 at 08:08:04PM +0200
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
Date: Tue Oct 22 08:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 21, 2002 at 08:08:04PM +0200, Denie Andriessen wrote:
> Hi,
> 
> I had that same problem/miscalculation once..
> 
> What I wanted to do was, to create a new volumegroup, that only holds the
> last (new) disk(s) that you want to add.
> Then, move as much as possible of the data to the new disk, scrink the old
> volume as much as possible (e2fsadm first, then vgreduce old voulme, PVmove,
> vgextend on the new volume, e2fsadm on the new volume, repeat untill done..
> last go, vgremove old volumegroup, and presto..It takes quite a while to
> complete, depending on the size of your volume..... (and I was in the
> situation that the disk I added was larger then the largest partition I had
> in the initial situation..
> 
> Good tip: Try and test it with the empty space on the new disk first !

Good plan!

Thanks, Frank
