From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] Re: mac-fdisk and 0x8e partitions for LVM
Message-ID: <20040115161357.GA1535@tykepenguin.com>
References: <1074115853.3983.24.camel@telecentro2> <Pine.LNX.4.44.0401151349110.20860-100000@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0401151349110.20860-100000@zirkon.biophys.uni-duesseldorf.de>
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
Date: Thu Jan 15 11:14:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 15, 2004 at 02:00:12PM +0100, Michael Schmitz wrote:
> > 	mac-fdisk won't allow me to create a 0x8e partition, thus precluding
> > LVM usage... any solutions in view?  Would pmac-fdisk or parted do the
> > job?
> 
> There's no such thing as a numerical partition type in Apple partition
> maps. cfdisk or parted could be used to create a different partition table
> (precluding use of MacOS). Or LVM could be made Apple partition format
> aware (using either a new partition type or partition name for detection;
> I'd prefer the partition name (like, "LVM 1" etc. as that can easily be
> added with mac-fdisk. (Creating other partition types is only marginally
> more difficult, simply us 'C' instead of 'c' to create the partition).
> 
> To reiterate: I don't see any solution without making LVM accept Apple
> partition maps in the first place. Which part of LVM checks the partition
> type? Can you show me some sample code?
> 

Stick 

#define __alpha__

at the top of tools/lib/pv_get_size.c and it will skip
the partition type check.
-- 

patrick
