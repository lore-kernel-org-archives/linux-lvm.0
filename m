Date: Mon, 01 Oct 2001 16:29:37 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Release of LVM 1.0.1 into mainstream kernel...
Message-ID: <159480000.1001968177@tiny>
In-Reply-To: <20011001150622.A2906@sistina.com>
References: <Pine.LNX.4.21.0110011520100.435-100000@sol.rune.org>
 <20011001150622.A2906@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Monday, October 01, 2001 03:06:22 PM -0500 AJ Lewis <lewis@sistina.com>
wrote:

> On Mon, Oct 01, 2001 at 03:25:39PM -0400, Sarwer Zafiruddin wrote:
>> I know this question has probably been answered hundreds of times, but
>> I'll go ahead and ask it again.... :-)  When will LVM 1.0.1 will become
>> part of the mainstream kernel?  I'm kinda holding my breath on installing
>> LVM on a production system un-till it is supported in the mainstream
>> Linus kernel.  *keeping my hopes that I will find it in 2.4.11* ;-) 
> 
> Whenever Linus decides to encorporate the changes.  we can only submit the
> changes (which we are doing through Alan Cox at the moment).  The AC
> series is much more up-to-date.  We're hoping the changes get into the
> mainstream kernel soon as well.  :)

Linus has been focusing on the VM and blkdev changes recently, it seems now
that 2.4.11pre1 is out, the merging will start again.  I'd suggest testing
2.4.11pre1 as hard as you can.  There are fundamental changes in there that
really need testing.

Once you are sure it is working correctly, ask both alan and linus what
their timetable is for updating.

-chris
