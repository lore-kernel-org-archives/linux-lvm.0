From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: SV: [linux-lvm] Need to remove broken hdd, and need to move the stuff i can from the broken disk
Message-ID: <20030727225636.E31325@uk.sistina.com>
References: <20030727123229.GH14273@fib011235813.fsnet.co.uk> <000101c35487$0092ba80$0296a8c0@malin>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000101c35487$0092ba80$0296a8c0@malin>; from yosh@liquidzone.net on Sun, Jul 27, 2003 at 11:35:24PM +0200
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
Date: Sun Jul 27 16:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Sun, Jul 27, 2003 at 11:35:24PM +0200, ^YosH^ wrote:
> Seems I don�t have that backup dir, don�t even have a /etc/lvm dir...

That means you must be using LVM1.

Try the 'pvdata' command (see man page for options) to find out what's
on a particular PV.

[For people reading this in the list archives, the LVM2 command to see 
the layout is lvdisplay --maps]

> I have been trying to move stuff of the lvm too to free som space, but
> the drive hangs everytime there is a dir that�s located on the crashed
> disk...

Another option: 
    An fsck (not while fs is mounted) with the badblocks option?  [-c]

But if the whole disk is gone, the best option is likely to be LVM2's 
partial mode (see list archives).

Alasdair
