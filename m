Subject: Re: [linux-lvm] lvscan and df result differs
From: Magnus Sandberg <magnus@switchbeat.com>
In-Reply-To: <20021028100325.B16452@sistina.com>
References: <1035675002.11490.15.camel@sleep>
	 <20021028100325.B16452@sistina.com>
Message-Id: <1035818392.32410.328.camel@tinia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Oct 28 09:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 2002-10-28 at 10:03, Heinz J . Mauelshagen wrote:
> On Sun, Oct 27, 2002 at 01:30:01AM +0200, Magnus Sandberg wrote:
> 
> Did you zero the partition table?
> i.e. "dd if=/dev/zero of=/dev/YourWholeDisk count=1 bs=512"
> 
> v1 "pvcreate /dev/YourWholeDisk" should work fine then.

Yes I did, several times, I even rebooted to make sure the
table was reread.

> > /dev/hde1 is also a 120G disk but with resierfs, ext3
> > takeing up more size is probably normal. But the actual
> > size on the lvm is 122G and as you can see I can fit 
> > 121G on the disk, so why is lvscan reporting ~115G? 
> > Can i safetly use my lvm setup without running the risk
> > of losing data?
> 
> Can't reproduce that with df 4.1 here :(
> That's probably just the old divide by 1k or 1024 thing.

Yes I suspected that but it stills scares me tad.

> What does "df -k" say and how does it compare to the lvscan output?

I'm using df 4.5.2, and df -k says:

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/vg/lg           118169924 117732724         0 100% /store2

and if using lvscan I get:

114.49*1000*1000 =   114490000
114.49*1024*1024 =   120051466,24		

so with a few % off for the filesystem info it looks ok, But why is df
using Size and Used info from the filesystem and the Available ans Use%
info from the lvm-Volume?

/Magnus

-- 
Magnus Sandberg <magnus@switchbeat.com>
