Message-ID: <EA753F4887A6ED449866D7F307ABBFDB4DB8DE@mailserver.e-r-solutions.com>
From: ERG@e-r-solutions.com
Subject: RE: [linux-lvm] Error - "device-mapper: request is larger than bl
	ock size b_size"
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
Date: Thu Aug 22 14:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Pardon me if the following is a dumb question:

Do you mean filesystem block size, LV/device block size, or device-mapper
block size?  How do I check my filesystem block size?  How about LV/device
block size?

Thanks,

Manuel Gomez



-----Original Message-----
From: Joe Thornber [mailto:joe@fib011235813.fsnet.co.uk] 
Sent: Wednesday, August 21, 2002 12:51 AM


On Tue, Aug 20, 2002 at 05:57:08PM -0700, ERG@e-r-solutions.com wrote:
> If not, does anyone have an example 'mkfs.xfs -l version=2,su=X' command
> that would give me a filesystem with the appropriate alignment?  

To me it looks like you should set su to your block size, so if your
block size is 4k set su=8.  I don't use xfs myself, so you may want to
wait for confirmation before trying this.

- Joe
