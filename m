From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] PV Move
Message-ID: <20030807180138.GL381@fib011235813.fsnet.co.uk>
References: <001d01c35d0a$971333a0$0d01a8c0@aphrodite>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001d01c35d0a$971333a0$0d01a8c0@aphrodite>
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
Date: Thu Aug  7 13:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 07, 2003 at 06:37:35PM +0100, Rupert Hair wrote:
> I have just received a nice new disk and I would like to use it to
> replace one of my PVs.  This would be no problem (it is well documented
> in the HOWTO) but I would like to put the new disk in place of the old
> one on the IDE cable.  (i.e. one of my PVs is currently /dev/hdd1 and I
> would like to copy the data from that onto the new disk and then put the
> new disk on /dev/hdd)
> 
> So my question is really can I change where LVM is expecting to find a
> PV?

LVM identifies PVs by the metadata on the disk, not its location in
the /dev/ tree.  As such you are free to move disks around as much as
you want, just run vgscan after moving them.

- Joe
