From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] 2 Q's: power outages during pvmove and fragmentation
Message-ID: <20030730152043.GA627@fib011235813.fsnet.co.uk>
References: <200307271524.49670.frank.vandamme@student.kuleuven.ac.be> <20030728101744.GD376@fib011235813.fsnet.co.uk> <200307281740.36593.frank.vandamme@student.kuleuven.ac.be> <200307301704.47486.frank.vandamme@student.kuleuven.ac.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200307301704.47486.frank.vandamme@student.kuleuven.ac.be>
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
Date: Wed Jul 30 10:21:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 30, 2003 at 05:04:47PM +0200, Frank Van Damme wrote:
> On Monday 28 July 2003 17:40, Frank Van Damme wrote:
> > > First off I encourage you to use LVM2 rather than LVM1.  An
> > > interrupted pvmove can be resumed or aborted after a crash.
> 
> With lvm1 too, or only with lvm2?

i)  It's is possible to deadlock pvmove under lvm1

ii) lvm1 does not have a transactional metadata format, so if you loose
    power during a metadata update you can have problems.

iii) I suspect you will have to restart the complete pvmove under lvm1
     if it's interrupted (Heinz ?)

Use LVM2.

- Joe

> 
> 
> -- 
> Frank Van Damme    http://www.openstandaarden.be 
> ~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> "Je pense, donc je suis brevet?."
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
