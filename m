Message-ID: <35745.213.39.188.204.1063839272.squirrel@www.somesite.de>
In-Reply-To: <34774.213.39.188.204.1063753077.squirrel@www.somesite.de>
References: <34774.213.39.188.204.1063753077.squirrel@www.somesite.de>
Subject: Re: [linux-lvm] Using VG with one disk missing --> Solved
From: "Florian Hinzmann" <f.hinzmann@hamburg.de>
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
Date: Wed Sep 17 17:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello again!

In case someone is about to answer: Thanks to excessive help
from agk on IRC I got my VG with all LVs activated.

And for the archives - A very short HOWTO:

Disclaimer: I am tired and I am new to this. What I am
trying to say:  All errors are mine.

While using -P LVM uses /dev/ioerror to read from instead of the
missing PV (missing harddisk). See the manual page of lvm for details.
As far as I understand this any block device may be used as /dev/ioerror
and dmsetup may be used to create a virtual one.

dmsetup needs a file containing one line:
0 <bignumber> error

error is the target type for dmsetup. See "man dmsetup". Old manpages
list "io_err" instead of "error" as target type. This is wrong and has
been fixed in CVS already.

<bignumber> is the size of the virtual device in sectors
( 1 sector == 512 bytes). So fill in a number which is at least
as big as the number of sectors of the broken harddisk.

Then run:
dmsetup create ioerror <filename>

and:
cd /dev ; ln -s mapper/ioerror ioerror

Now /dev/ioerror is ready to be used by LVM. "vgchange -P -ay"
should activate the VG with all LVs including the broken ones.
This worked for me.


So much for now.


  Regards
        Florian
