From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-ID: <20031209204750.H27396@schatzie.adilger.int>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com> <E1ATOFw-0003wR-7w@server6.hostpoint.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ATOFw-0003wR-7w@server6.hostpoint.ch>; from markus@markus.org on Mon, Dec 08, 2003 at 05:29:01PM +0100
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
Date: Wed Dec 10 07:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Dec 08, 2003  17:29 +0100, Markus Baertschi wrote:
> If you are looking for a stable filesystem and are not really worried
> about performance I'd stick with ext3. If necessary you can get a kernel
> patch to allow for online resizing.
> 
> On Mon, 8 Dec 2003 09:39:38 -0500, Yanick Quirion wrote:
> > I know that ext3 can handle ACLs and not online fs extend, and reiserfs
> > do not seems to support ACLs (I found some patches for kernel 2.4.21,
> > but there are errors when I apply them to the kernel 
> > sources), but can be extend while it's online.

FYI - I read that the ext3 online extend code is in the latest RH rawhide
kernel.  I've been rather bad at maintaining that code, but Arjan (RH
kernel guy) updated the patch for the latest RH kernel.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
