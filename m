Message-ID: <002401c20c0b$a68dce40$0300000a@STATION>
From: "Aslak Sommerfelt Skretting" <aslak@skretting.org>
References: <006001c20c05$0a41cf10$0300000a@STATION> <20020604203127.GE3857@rtfm.sistina.com>
Subject: Re: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
MIME-Version: 1.0
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
Date: Tue Jun  4 16:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi again, and thanks for your quick reply!

>----- Original Message -----
>From: "Ben Lutgens" <blutgens@sistina.com>
>To: <linux-lvm@sistina.com>
>Sent: Tuesday, June 04, 2002 10:31 PM
>Subject: Re: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
>
>>As far as i can understand a simple:
>>
>>tune2fs -j /dev/storage/space
>
>Yup. I've done this many times with no problems.

Good, odds are in my favour :)

>>
>>would create a new journal file, and convert the filesystem to ext3. and
a:
>>
>>tune2fs -i 0 /dev/storage/space
>>
>>would disable the fsck's that occur now and then (and takes an insane
amount
>>of time on a 650gb filesystem), and are no longer necessary since the
>>filesystem is EXT3.
>
>Don't presume that because it's EXT3 that fscks are no longer necessary.
>Only thing the journal guarantees is that your metadata won't become
>corrupt (i think journal=data mount option fixes this but will affect
>performance and not neccessarily badly). If your filesystem has been
>shutdown cleanly many many times you could still has some loss. A fsck
>should take care of that.

So i skip this tune2fs -i 0 /dev/... option? and let the system fsck the
discs when it wants to?

If so, do i have to change any other settings anywhere to tell fsck that
this is an ext3 filesystem now, or is that first command all I need?

>
>>and then everything would be ok? or is there more that need to be done?
>
>take backups.
>take backups.
>take backups.
>take backups.

Im a poor student, so 650gb x 2 is a little bit out of my league right now.
But yes: point taken.

>
>:-)
>
>>
>>Is this a complicated process that i might just as well avoid in order not
>>to damage my data? Or is this pretty straightforward?
>
>It's pretty straight forward. Did I mention to make sure you have backups?
>Oh and the other concern is that you want to make sure you backup before
>you get carried away ;-)
>
>Can you tell my tape drive has saved my life and my job once or twice ;-)

Im starting to see the picture ;) Im fortunate in the way that so far, i am
the only one using these data :)

>
>--
>Ben Lutgens     | http://people.sistina.com/~blutgens/
>System Administrator  | http://www.sistina.com/
>Sistina Software Inc. |
>
>"I got a wife and kids too but you don't see me out here stealing Imperial
>Droids now do ya?"

No sir, I certainly dont. :)


Regards

Aslak Sommerfelt Skretting
aslak@skretting.org
