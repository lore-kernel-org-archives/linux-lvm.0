From: Scott Mcdermott <smcdermott@questra.com>
Subject: Re: [linux-lvm] How long does PVmove take
Message-ID: <20030805225849.GF7336@questra.com>
References: <200308051754.13652.bjzolp@wisc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308051754.13652.bjzolp@wisc.edu>
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
Date: Tue Aug  5 17:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

B. J. Zolp on Tue  5/08 17:54 -0500:
> I have to remove 4 120GB IDE drives from a LVM on a P2
> 450Mhz machine.  I have been pvmoving one of them for
> about the last 5 days.  Is this a normal time frame?  How
> much longer can I expect?

you should see progress (i think it gives some progress
without -v iirc), just estimate based on moved PE / total PE
and compare to elapsed time.

with LVM1 at least, it's quite slow, but I moved 40G in
less than 4 hours, so...

one thing that threw me, was that it doesn't start moving
for a LONG time and there is no output.  I had very
important data, so I didn't kill it, because I knew it was
doing stuff based on wchan :)
