From: Arjan van de Ven <arjanv@redhat.com>
Message-Id: <20020201051251.B10893@devserv.devel.redhat.com>
References: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>
    <20020131125211.A8934@fib011235813.fsnet.co.uk>
    <20020201045518.A10893@devserv.devel.redhat.com>
    <20020131130913.A8997@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020131130913.A8997@fib011235813.fsnet.co.uk>;
    from thornber@fib011235813.fsnet.co.uk on Thu, Jan 31, 2002 at 01:09:13PM
    +0000
Subject: [linux-lvm] Re: [ANNOUNCE] LVM reimplementation ready for beta testing
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
Date: Fri Feb  1 04:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <thornber@fib011235813.fsnet.co.uk>
Cc: Arjan van de Ven <arjanv@redhat.com>, lvm-devel@sistina.com, Jim McDonald <Jim@mcdee.net>, Andreas Dilger <adilger@turbolabs.com>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, evms-devel@lists.sourceforge.net

On Thu, Jan 31, 2002 at 01:09:13PM +0000, Joe Thornber wrote:
> 
> Now our hero decides to PV move PV2 to PV4:
> 
> 1. Suspend our LV (254:3), this starts queueing all io, and flushes
>    all pending io. 

But "flushes all pending io" is *far* from trivial. there's no current
kernel functionality for this, so you'll have to do "weird shit" that will
break easy and often.

Also "suspending" is rather dangerous because it can deadlock the machine
(think about the VM needing to write back dirty data on this LV in order to
 make memory available for your move)...

Greetings,
  Arjan van de Ven
