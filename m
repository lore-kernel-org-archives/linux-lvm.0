Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
References: <20030312195217.GC18876@auctionwatch.com>
	<20030312221320.GA15196@gw.silicide.dk>
	<20030312234520.GA19335@auctionwatch.com> <3E704492.DF386E61@silicide.dk>
	<20030314002507.GE22003@auctionwatch.com>
From: Adrian Phillips <a.phillips@met.no>
In-Reply-To: <20030314002507.GE22003@auctionwatch.com>
Message-ID: <87llzixsbm.fsf@freeze.oslo.dnmi.no>
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
Date: Fri Mar 14 02:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Petro" == Petro  <petro@auctionwatch.com> writes:

    >> need to find a way to send an <alt-3> through > an ssh session
    >> to a telnet window.  may i suggest
    >> http://www.realweasel.com/intro.html It's a pci GFX<->serial
    >> card.  I dont have one, but i want 3. If you buy one... do tell
    >> us how it works.

    Petro>     That won't solve the problem.

    Petro>     See, my servers are 55 miles down the road. I ssh to a
    Petro> machine that connects to a private network, on which are a
    Petro> bunch of portmasters and APCs. I then telnet to the
    Petro> Portmaster ports, which hook to cua0.

    Petro>     It looks basically like I call he "smart hands" at the
    Petro> Colo and talk them through redoing the RAID volumes.

Um, sorry if I misunderstood, but using expect, either tcl or perl
versions, might solve this but then again it might not.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
