From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problem compiling LVM 1.0.5
Message-ID: <20020731170853.GA1061@colombina.comedia.it>
References: <549012796.20020731132606@tnonline.net> <20020731123348.A21340@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020731123348.A21340@uk.sistina.com>
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
Date: Wed Jul 31 12:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 31, 2002 at 12:33:48PM +0100, Alasdair G Kergon wrote:
> On Wed, Jul 31, 2002 at 01:26:06PM +0200, Anders Widman wrote:
> > /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header
> > included in userspace
> 
> Try removing the line in tools/lib/liblvm.h that includes
> <linux/autoconf.h>.
> 
why don't you just do this in CVS?
it has been discussed before, see the list archives.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
