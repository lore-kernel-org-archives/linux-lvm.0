Mime-Version: 1.0 (Apple Message framework v548)
From: Tod Detre <tod@tod.net>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20021207215432.A23843@infradead.org>
Message-Id: <0DD2B431-0B81-11D7-A700-000393B2C740@tod.net>
Subject: [linux-lvm] Re: xfs_growfs, lvm, and sparcs....
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
Date: Mon Dec  9 08:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

oops, sorry, you're right it's an Ultrasparc 5 with  64bit kernel.

Is there a way around this issue with the 64/32 bit difference?

On Saturday, December 7, 2002, at 04:54 PM, Christoph Hellwig wrote:

> On Fri, Dec 06, 2002 at 09:35:16AM -0500, Tod Detre wrote:
>> xfs kernel from cvs 2.4.20-xfs
>> xfsprogs from cvs (same as kernel)
>> Sparcstation 5, ide disks
>
> how did you get ide disks connected to a SS5?  Sounds more like a 
> Ultra5
> to me.  If it's really an Ultra5 and you use a sparc64 kernel with a
> 32bit userland the error is expected.
>
--
Tod Detre
Unix Technical Support
Case Western Reserve University
usworkstation@po.cwru.edu
216-368-3060
