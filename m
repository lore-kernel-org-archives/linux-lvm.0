Subject: Re: [linux-lvm] RFC: DM encryption target?
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030926124805.GA2462@gw.silicide.dk>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com>
	 <1064343664.10276.3.camel@chtephan.cs.pocnet.net>
	 <3F717F13.1050407@silicide.dk>
	 <1064404776.5915.9.camel@chtephan.cs.pocnet.net>
	 <20030924142145.GV12384@shell.blacknet.de>
	 <1064506078.31091.15.camel@chtephan.cs.pocnet.net>
	 <20030926124805.GA2462@gw.silicide.dk>
Message-Id: <1064581467.4175.3.camel@chtephan.cs.pocnet.net>
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
Date: Fri Sep 26 08:05:17 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Fr, den 26.09.2003 schrieb jon+lvm@silicide.dk um 14:48:

> > I don't know, but couldn't the use of a one-sector block slow things
> > down because of alignment issues? Perhaps using a 4k block would be more
> > useful or storing the sector at the end of the device (like the linux
> > raid info sector).
> 
> maybe, but does it matter? You only read the sector once, when you "open"
> the device, and write to it when you change password. During use, the real
> key is stored in memory, like any other encryption device.

No, I meant the following: Let's assume you are using crypto on a raid
0/5 device or something. Usually the filesystem uses 4k blocks. Those
blocks would normally never span across two stripes because they are
aligned. With a crypto device that uses the first sector now all
filesystem blocks get moved by one sector so that there are a lot of
blocks that span underlying stripes. A lot of harddisks these days use
internal blocks that are larger than 512 bytes so there are also
alignment issues.

That's why I meant that either this info block should be larger than one
sector or it should be moved to the end (and the linux md code does it).

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
