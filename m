Return-Path: <gregm@coco.comstar.net>
Date: Mon, 29 Jan 2001 10:45:09 -0500 (EST)
From: Gregory McLean <gregm@comstar.net>
Subject: Re: [linux-lvm] Help recovering my volume groups
In-Reply-To: <20010129125826.E594@tykepenguin.com>
Message-ID: <Pine.LNX.4.10.10101291021220.10901-100000@coco.comstar.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 29 Jan 2001, Patrick Caulfield wrote:

> On Sat, Jan 27, 2001 at 05:27:46PM -0500, Gregory McLean wrote:
> > 
[snip]
> 
> Are you running beta3 ? If not then an upgrade would be helpful.

No beta2 , I'll upgrade em. And patch the kernel tonight for this (not at
the affected machine right now)
> 
> If you are then we really need to find out what's happening here. 
> Do you have any snapshots defined ?

No, I haven't had a need for snapshots.
> 
> Can you do a pvdisplay on all the PVs and post the output, it might also 
> be helpful if you can dd if=/dev/hd?? of=pv-dump.txt bs=1024 count=4 and send
> those four files too so we can see what has actually happened to the on-disk
> metadata.
> 
> After than(but not before please!) you could try

To save the list bandwidth spammage:

http://tweetie.comstar.net/pvdump/

contains all the generated files so far (both the orginal 2) and the
requested ones.

> 
> vfcfgrestore mmedia /dev/hda7
> vfcfgrestore mmedia /dev/hda8
> vfcfgrestore mmedia /dev/hdb1
> vfcfgrestore mmedia /dev/hdc1
> vgchange -ay

Still didn't find any volume groups :(

I did manage to active the group with the following (hack):

small perlscript to put a \0 terminated mmedia name in /etc/lvmtab,
cp /etc/lvmconf/mmedia.conf /etc/lvmtab.d/mmedia
vgchange -ay

This got em activated

As you asked in your followup:

vgdisplay -D mmedia
vgdisplay -- volume group "mmedia" not found

I'll re-try tonight with the beta3 stuff.

Thanks,
  Greg
--
Gregory McLean     | "Why do they call it a TV set when you only get one?"
globix.net         | - George Carlin 
Core Engineer      |
Network Services   |
PGP Key: 0xE94D1363|
---------------This is my opinion, All MINE! I tell you-----------------
