From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] LVM performance
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEACJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011122231706.M5393@sonsofthunder.yi.org>
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
Date: Thu Nov 22 22:31:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

[big snip]
> Originally, I had the following configuration:
>
> hda 30GB HD
> hdb 30GB HD
> hdc DVD-ROM
> hdd CD-RW
>
> A friend suggested moving the HD on hdb to the other channel, so now the
> drives are on hda and hdc, the dvd is on hdb and the cdrw is on hdd.

thats dead right; ide can't simultaneously write to the master and slave
on the same controller. Also, the pair of drives uses the controller
circuitry
of the master, so it always pays to make the master the most modern one.


> Can anyone give me any ideas as to why the machine gets beaten about so
> much during IO operations and more importantly how can I minimize the
> impact.

Dunno, if it was because the fs is striped across those drives then
splitting them across controllers would have made it go away.

I've seen no performance problems at all and really thrashed an LVM-root
machine for test purposes while working on a movie. It took it well,
performance-wise. (reliability is another issue; never go LVM-root...
but thats just my 2 cents, YMMV).
