From: jon+lvm@silicide.dk
Subject: Re: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
Message-ID: <20030117100237.GC15042@gw.silicide.dk>
References: <20030113214928.NXIW20432.imf21bis.bellsouth.net@marsha> <002701c2bdb8$6cf51b70$c600a8c0@COMPAQ>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002701c2bdb8$6cf51b70$c600a8c0@COMPAQ>
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
Date: Fri Jan 17 04:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 17, 2003 at 08:38:51AM +0900, Sean Oh wrote:
> What I found out testing with a few FS available for Linux is that only the
> snapshot for ext2 is extendable. I and extend ext2 snapshots with 'lvextend'
> command and it keep staying mountable.
> 
> Snapshots for LV on Reiserfs, XFS and even ext3 are not
> extendable(mountable).
> 
> Very strange, since LVM snapshot does not hold FS. Am I right?

i have successfully extented a ext3 snapshot. I did have to specify the
mount as READONLY. You did do that too, didnt you ?



JonB
