Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D51@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] EXT3 vs Reiserfs
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
Date: Mon Dec  8 09:51:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

http://otn.oracle.com/oramag/webcolumns/2002/techarticles/scalzo_linux02.htm
l

you will probably have to join otn to be able to read the article, but i'm
not sure.

reiserfs appears to work really well for lots of small files, but performs
relatively poorly on a few really large files (ie database).  in terms of
performance oracle ranks them thusly

ext2
ibm-jfs
ext3
reiser

> -----Original Message-----
> From: Markus Schiltknecht [mailto:markus@bluegap.ch]
> Sent: Sunday, December 07, 2003 9:26 PM
> To: linux-lvm@sistina.com
> Subject: RE: [linux-lvm] EXT3 vs Reiserfs
> 
> 
> Hi again,
> 
> On Mon, 2003-12-08 at 16:14, Little, Chris wrote:
> > It also depends on your workload.  If you are serving a 
> large database,
> > reiser (the last i heard) is probably a bad choice.
> 
> why is that? thought reiser was faster than ext3 while ext3 would be
> considered more stable (in general).
> 
> Before getting ways off topic: where can I find a good comparison /
> discussion on different filesystems?
> 
> Thanks for your suggestions
> 
> Markus
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
