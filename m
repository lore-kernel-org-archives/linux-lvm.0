From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [linux-lvm] problem building LVM2 for 2.6 kernel
In-Reply-To: <20030719004618.J31325@uk.sistina.com>
Message-ID: <Pine.LNX.4.53.0307182143150.1407@localhost.localdomain>
References: <Pine.LNX.4.53.0307181659170.6115@localhost.localdomain>
 <20030719004618.J31325@uk.sistina.com>
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
Date: Fri Jul 18 20:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 19 Jul 2003, Alasdair G Kergon wrote:

> On Fri, Jul 18, 2003 at 05:02:29PM -0400, Robert P. J. Day wrote:
> > 2.6.0-test1-ac2 version and selected device mapper and v4 ioctl
> 
> I've not tried this kernel, but assuming it contains BLKGETSIZE64
> you'll need to compile LVM2 against newer glibc kernel headers
> (e.g. update the package for your linux distribution or symlink 
> /usr/include/linux to include/linux in your -ac tree)

just FYI, i seem to have built a 2.6.0-test1-ac2 kernel with LVM2
support, and also built libdevmapper and the lvm utilities.  haven't
had time to actually use all that to start creating my VGs and LVs,
but the fact that it all built is a good sign.

rday
