Message-ID: <3F0DB278.5020606@xs4all.nl>
From: Gert van der Knokke <gertk@xs4all.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] trouble adding a disk to exisiting lvm
References: <3F0C9623.8070409@xs4all.nl> <3F0CAEDA.6050007@opendreams.net>
In-Reply-To: <3F0CAEDA.6050007@opendreams.net>
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
Date: Thu Jul 10 13:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jesse Molina wrote:

>
> It would be very helpful if you were to include useful information 
> such as the output that fsck spewed at you, some general data about 
> your LVs and this troublesome drive, or even a log of the entire event 
> that you tried if you have it.

Ok, I will try to capture this output. It's more than Shift-PgUp can
handle anyway so I could not see what was at the start of the output.
And since the server is a AMD 1800 (Ok it's overkill...) the messages
swoosh faster than an eye can blink :-) The machine is not here with me now.

>
> Otherwise, you can scan your palm and we can try to read that for 
> you.  =)

Ah, this is the filosofical approach I guess :-)

>
> I like to run something like badblocks, Bonnie++, and smartmontools, 
> before I trust a new drive.  Write a little script, let it run, and 
> see if it fouls up over a 24-48 hour period.  Then you can blame it on 
> software later if something goes wrong. 

Hmmm.. As I wrote, the original setup of the lvm consisiting of two 80
Gb went without problems, and adding the third drive later 'seemed' to
work until the fourth drive was added an the fsck was run on the lvm
(then consisting of the three drives). Note I have not put any data on
the lvm since I added the third drive (so there is no more than 160 Gb used)

Is it principally safe to extend an ext3 filesystem with resize2fs ?
I'd better had put reiserfs on it I guess instead of ext3 but now I'm
stuck with 160 Gb of data on the lvm which I can't park easily somewhere
else so I'm reluctant to open the bag of tricks.

Maybe I should reduce the volume back to 160 Gb (2x80) and move the data
back on the source drives and start all over ? This time using reiserfs ?

Any help will do.

Gert
