Subject: Re: [linux-lvm] Driver vs. Not Active Groups
Message-ID: <20020801162857.GB627@fib011235813.fsnet.co.uk>
References: <3D495F05.EA6A374F@blarg.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D495F05.EA6A374F@blarg.net>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Aug  1 11:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 01, 2002 at 09:17:09AM -0700, ronr wrote:
> I am attempting to implement lvm (Linux kernel 2.4.5 Slackware 8.0)
> using 2 drives for linux (lilo uses MBR on a 3rd).  After partitioning
> the drive, which will become (via copy from current drive) the new home
> for the system under lvm (/, /usr, /var, /opt, /tmp, /home ext2fs), I
> pvcreated all ok.  When attempting to vgcreate, the volume groups
> were not activated with vgcreate and vgchange -a y has no effect either.
> 
> When querying alt.os.linux.slackware all I got was suggestions to
> install
> 2.4.18 plus 1.0 lvm.  I would like not to do this, especially since lvm2
> 
> is coming out soon, if I can so as not to introduce further
> idiosyncrasies (this is a test box).  You would aid my decisioning if
> you can tell me:
> is it ok to have an lvm driver (per /proc/lvm/global) at 0.9.1_beta2
> when
> the lvm tools appear to be (per pvcreate -V) 0.9.1_beta6?  Could this
> the
> cause of inactivity with vgcreate?

Have you created any volumes with lvcreate ?

- Joe
