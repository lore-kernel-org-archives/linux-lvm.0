From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] RFC: DM encryption target?
Message-ID: <20030926214616.GG12384@shell.blacknet.de>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com> <1064343664.10276.3.camel@chtephan.cs.pocnet.net> <3F717F13.1050407@silicide.dk> <1064404776.5915.9.camel@chtephan.cs.pocnet.net> <20030924142145.GV12384@shell.blacknet.de> <1064506078.31091.15.camel@chtephan.cs.pocnet.net> <20030926124805.GA2462@gw.silicide.dk> <1064581467.4175.3.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1064581467.4175.3.camel@chtephan.cs.pocnet.net>
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
Date: Mon Sep 29 08:07:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Sep 26 '03 at 15:04, Christophe Saout wrote:
> Am Fr, den 26.09.2003 schrieb jon+lvm@silicide.dk um 14:48:
> 
> > > I don't know, but couldn't the use of a one-sector block slow things
> > > down because of alignment issues? Perhaps using a 4k block would be more
> > > useful or storing the sector at the end of the device (like the linux
> > > raid info sector).
> > 
> > maybe, but does it matter? 
> 
> No, I meant the following: Let's assume you are using crypto on a raid
> 0/5 device or something. Usually the filesystem uses 4k blocks. 
> [ ... ] A lot of harddisks these days use internal blocks that are
> larger than 512 bytes so there are also alignment issues.
While I don't have any idea how harddisks work internaly thise days,
I've no problem to loose 4k or even 16k if it improves anything. 
But I would still like to get it to the beginning of the
partition/drive/device.

Mainly to be able to do

less -f $DEVICE

to figure out what it's all about. I do this more often than not and
hate it if all i get back is just binary garbage. 

Everyfile should tell me what is is for/from in plain text. 
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
