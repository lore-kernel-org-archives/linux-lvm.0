From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Problem compiling LVM 1.0.5
Message-ID: <20020731123348.A21340@uk.sistina.com>
References: <549012796.20020731132606@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <549012796.20020731132606@tnonline.net>; from andewid@tnonline.net on Wed, Jul 31, 2002 at 01:26:06PM +0200
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
Date: Wed Jul 31 06:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 31, 2002 at 01:26:06PM +0200, Anders Widman wrote:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header
> included in userspace

Try removing the line in tools/lib/liblvm.h that includes
<linux/autoconf.h>.

Alasdair
-- 
agk@uk.sistina.com
