Subject: Re: [linux-lvm] Lost partition table, how can I find the start of
	the PV?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <3FC3637A.8070100@webhackande.se>
References: <1069736195.28598.76.camel@pc> <3FC3637A.8070100@webhackande.se>
Message-Id: <1069823047.1887.15.camel@javadt.localdomain>
Mime-Version: 1.0
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
Date: Tue Nov 25 23:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2003-11-25 at 09:13, Rickard Olsson wrote:
> You can try gpart: http://www.stud.uni-hannover.de/user/76201/gpart/

Ahhhh.  Good ol' gpart.  From the initial webpage, this looks like it
will be what I am looking for.  I wonder how good it is and if a manual
inspection could be any more accurate if gpart fails to determine the
previous partition table layout.

Much thanks for the pointer Rickard!

b.
