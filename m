content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] read-only media in a LVM?
Message-ID: <C42D120999B1CC4C886B6BB2832F356019BF8F@hermes.genomatica.com>
From: "Sean P. Kane" <spkane@genomatica.com>
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
Date: Mon Jun 23 17:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok, let me clarify a bit. I mis-spoke, when I spoke of memory I meant
ramdisk (fs). This is basically what I was actually visualizing in my
head:

1) Boot cdrom into a Linux instance.
2) Mount a read-write filesystem into memory (this is why I asked the
size issue, obviously coping the whole cdrom to memory wouldn't be
practical)
3) Create a snapshot (I'm am really new to lvm, so I'm still learning
what all this means), which would be a small reference table of some
sort, plus 32k blocks of changed data.
4)This would then allow "changes" to the cdrom while running in that
session until the ram disk filled up? Correct?
5) If a file is created then deleted in an environment like this will
the space it was using in the snapshot fs be released?

The use I have in mind for this, doesn't need a ton of additional files
added, after boot-up but would need a lot of temp files created and then
cleaned up.=20

What are the basic commands I would need to achieve this? I've read the
LVM howto (doesn't cover LVM2, that I saw) and still not quite sure.

Thanks,
Sean


------------------------------------------------------------------------
Sean P. Kane
spkane@genomatica.com
Lead Infrastructure Architect
Genomatica, Inc.
------------------------------------------------------------------------
"When we destroy something man has created we call it vandalism......
 When we destroy something that Gaia has created we call it progress."


-----Original Message-----
From: Wolfgang Weisselberg [mailto:uzx87lvfmukwc001@sneakemail.com]=20
Sent: Monday, June 23, 2003 14:23
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] read-only media in a LVM?


Sean P. Kane wrote 36 lines:

> Does a snapshot create a copy of all the files in memory?

Nope.  And not in memory either.

> Just the files that changed?

Nope, LVM is filesystem-agnostic, and that would have to change that.
More code, more errors, less usability.

Additionally, what would you do with metadata, like used filesystem
blocks and timestamps and filenames?

Or with a 1 TB file where just 1 bit was changed?

> Or just the file blocks or contents (i.e. diffs) that have changed?

Blocks of (default) 32Kb of raw disk.  They are written to the snapshot.
However, the tables of which blocks were written are kept in RAM, so a
read request on the snapshot redirects only the unchanged blocks to the
original (HD/CD) and gets the changed blocks out of the snapshot
storage.

> So, would the snapshot have to be the same size as the cdrom or could=20
> it be smaller?

MUCH smaller. Unless you insist on changing something in every 32KB
block of the CDrom.

-Wolfgang

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
