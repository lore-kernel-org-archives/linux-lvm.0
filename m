From: jens@pinguin.conetix.de
Date: Thu, 18 Feb 1999 20:03:12 +0100
Subject: [linux-lvm] LVM or mdutils/raidtools?
Message-ID: <19990218200312.C1529@debian.zuhause.de>
References: <19990216180955.G972@debian.zuhause.de> <Pine.GHP.4.05.9902161554060.25565-100000@ixion.honeywell.com>
Mime-Version: 1.0
In-Reply-To: <Pine.GHP.4.05.9902161554060.25565-100000@ixion.honeywell.com>; from Shawn Leas on Tue, Feb 16, 1999 at 03:56:48PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sleas@ixion.honeywell.com, linux-lvm@msede.com

On Tue, Feb 16, 1999 at 03:56:48PM -0600, Shawn Leas wrote:
> On Tue, 16 Feb 1999 jens@pinguin.conetix.de wrote:
> > not yet. I am wonderin whether I should. Or probably use
> > mdutils/raidtools instead. Maybe you can give me an ( unbiased ;> )
> > suggestion.
> Using LVM you would gain experience useful in Solaris, HPUX, etc...

I do not need that just yet, it's only a home system.

> Also, it's a LOT more flexible, and extensible.

ACK, but partitions do not change _that_ often round here. What I would
like, though is to seamlessly integrate a new hard disk into the existing
volumes, when using striping.

>> Primary issue is speed, but of course (as I have not had a single disk
>> failure save my two ZIP drives which were both broken) data safety would
>> be important as well. I do monthly complete backups (roughly) but I just
>> cannot afford a filesystem slowly corrupting itself.
> For being labeled ALPHA, LVM is awesome.  I haven't had a single LV
> related issue that I can see.

I'll play around with it on my 'playground server'. If I like it, I'll
probably use it. Thanks. :)


-- 
_ciao, Jens_______________________________ http://www.pinguin.conetix.de
    cat /dev/boiler/water | tea | sieve > /cup
    mount -t hdev /dev/human/mouth01 /mouth ; cat /cup >/mouth/gulp
