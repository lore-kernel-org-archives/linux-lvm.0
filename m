From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] 2 Q's: power outages during pvmove and fragmentation
Message-ID: <20030728101744.GD376@fib011235813.fsnet.co.uk>
References: <200307271524.49670.frank.vandamme@student.kuleuven.ac.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200307271524.49670.frank.vandamme@student.kuleuven.ac.be>
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
Date: Mon Jul 28 05:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jul 27, 2003 at 03:24:49PM +0200, Frank Van Damme wrote:
> 1: suppose my hamster bites my power cord during a pvmove and only half of the 
> data will have moved. How great a disaster does this result in? Does lvm move 
> one extend and does it write to disk which LE has been mapped to which PE, or 
> does it first write all the data and rewrite the metadata?

First off I encourage you to use LVM2 rather than LVM1.  An
interrupted pvmove can be resumed or aborted after a crash.

> 2: does lvm ever get fragmented if one moves data around across different 
> disks a lot?

The extent size is normally so large (4M+) that fragmentation isn't
really a big problem with LVM.  But we will be making a more general
remapping tool in the future that allows you to do this sort of thing.

- Joe
