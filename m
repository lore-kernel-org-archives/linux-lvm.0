From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] LVM resizing
Message-ID: <20030514080456.GA434@fib011235813.fsnet.co.uk>
References: <200305140813.46680.geraldcc@optusnet.com.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200305140813.46680.geraldcc@optusnet.com.au>
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
Date: Wed May 14 03:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 14, 2003 at 08:13:46AM +0000, Gerald Catling wrote:
> Istallation went well.
> However resizing goes verry badly and the article implies it is possible to 
> grow and shrink  --- usr,home and data partitions.

You will have to resize the filesystem as well.

For shrinking:

i) shrink the fs
ii) lvreduce

For growing:

i) lvextend
ii) grow the fs

- Joe
