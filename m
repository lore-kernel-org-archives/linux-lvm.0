From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] hard disk crash
Message-ID: <20021031221920.GA26610@gw.silicide.dk>
References: <Pine.LNX.4.44.0210311905180.25933-100000@server.piarista-kkt.sulinet.hu> <Pine.LNX.4.44.0210312035120.26055-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210312035120.26055-100000@server.piarista-kkt.sulinet.hu>
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
Date: Thu Oct 31 16:20:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 31, 2002 at 08:37:02PM +0100, NagyZ wrote:

[cut]

> i replaced the drive, and pvscan says that VG is OK..
> all LV s could be mounted, except one.
> i run mkreiserfs on this, and from then we're using that..
> thnx for the advice.

you were lucky


> and the boss said: 'for what would you buy new disks? to buy new again 
> tomorrow to replace them?' so the answer was no :)

is this a production system ??
If so, i'd suggest you start looking for a new boss, one that gives you 
enough money to at least run software raid.
Ask him how much a complete data loss costs ?
Not just your salary for the time you try to recover, but also his
time, and the rest of the workers while the system is down because he
saved money on disk space. And dont get me started about backup.

Remober, if you DO go raid, you NEED to know when a disk goes down,
because if not, you might as well not run raid at all. This means
some sort of management software that keeps an eye on the disks, and
emails you when one fails. Hotswap _MIGHT_ not be needed, but it is
nice.




JonB
