From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] LVM tool limitation on using whole disk
In-Reply-To: <005201c1e56c$c6d39bf0$6501a8c0@bomoon>
Message-Id: <Pine.LNX.4.44.0204161845320.27709-100000@pzat.meep.org>
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
Date: Tue Apr 16 13:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 16 Apr 2002, bo wrote:

> Is it still TRUE?
>
> I am going to make several MDs on several whole disks, and then combine them
> as a
> volume. How could I avoid this problem?
>
> Thanks,
>
> Bo
>
>

So wipe the partition table!

dd if=/dev/zero of=/dev/discs/disc1/disc bs=1024 count=10

That would do it... make sure you change the of= bit to be the right
device. Do it wrong and ... well thats your problem!

James
