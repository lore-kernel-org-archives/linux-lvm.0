From: Andres Salomon <dilinger@mp3revolution.net>
Subject: Re: [linux-lvm] Re: device-mapper transition
Message-ID: <20021011220839.GA8694@chunk.voxel.net>
References: <1034276879.2396.11.camel@mars.goatskin.org> <20021011075220.GA1153@fib011235813.fsnet.co.uk> <20021011090446.GA5506@sparcbox.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021011090446.GA5506@sparcbox.net>
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
Date: Fri Oct 11 17:09:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

We should probably have lvm2 tools check the driver (and libdevmapper)
version after processing arguments.  So, after making sure the user
doesn't just want to run vgchange --help, vgchange should check to make
sure that
a) there _is_ a version of dm in the kernel
b) the version in the kernel is compatible w/ it

This would lead to some better error messages, and hopefully less
questions.  Instead of:
[dilinger@wax tools]$ sudo vgchange -a y
  No volume groups found

Perhaps:
[dilinger@wax tools]$ sudo vgchange -a y
  Error: device-mapper driver not found; support must be compiled into
  the kernel!
[dilinger@wax tools]$ sudo vgchange -a y
  Error: the version of device-mapper in the kernel is incompatible with
  this lvm package; please upgrade device-mapper.

Support is already in the kernel and libdevmapper for driver version
querying; should be just an issue of adding the check to the lvm2 tools.


On Fri, Oct 11, 2002 at 02:04:46AM -0700, Steven Stillaway wrote:
[...]
> 
> The only really tricky bit has been the fact that the
> lvm tools (in particular vgscan) are completely
> different between the two version.  Actually LVM 2 just
> seems to have one tool with a lot of symlinks.
> 
> So when I switch from 2.4.19 w/ LVM 1 to 2.5.41 w/
> LVM2 I have to make sure to switch from one vgscan to
> the other.
> 
> The obviously solution is to upgrade my 2.4.19 to 
> LVM2, but not tonight -- it is late.
> 
> If I notice anything I will let you know.  If you
> have any questions or want some data from my test
> box please let me know.
> 
> Off to bed now -- later
> 
> --
> 
> Steven Stillaway
> steve@stillaway.net
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
It's not denial.  I'm just selective about the reality I accept.
	-- Bill Watterson
