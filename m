From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Building LVM 2 -- More information
Message-ID: <20030528194851.GG449@fib011235813.fsnet.co.uk>
References: <047501c3254d$6066b880$fc6a6d0a@corp.int.digex.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <047501c3254d$6066b880$fc6a6d0a@corp.int.digex.com>
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
Date: Wed May 28 14:48:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 28, 2003 at 03:14:35PM -0400, Anastasios A. Papadopoulos (Tas) wrote:
> 
> ----- Original Message ----- 
> From: Anastasios A. Papadopoulos (Tas)
> To: linux-lvm@sistina.com
> Sent: Wednesday, May 28, 2003 10:42 AM
> Subject: Building LVM 2
> 
> 
> I'm having a little trouble following directions:
> 
> I'm trying to build a new kernel with 'dm'.
> 
> Should I be issuing the 'make modules modules-install' after building the
> new kernel or not.

If you are building dm as a module, yes.

> I am getting the following errors during "make modules"

The patches we provide have only been tested against a vanilla kernel
tree, if you are trying to patch a redhat kernel you may have to do a
little more work.  Which kernel are you patching ?

- Joe
