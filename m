From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14208.58694.57289.45093@dukat.scot.redhat.com>
Date: Mon, 5 Jul 1999 18:03:02 +0100 (BST)
Subject: Re: [linux-lvm] Re: ext2resize
In-Reply-To: <199907021658.KAA22753@webber.adilger.net>
References: <001701bec2dd$7a210d60$0102010a@adminstation.sgymsdam.nl>
	<199907021658.KAA22753@webber.adilger.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@enel.ucalgary.ca>
Cc: Linux LVM mailing list <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>, Stephen Tweedie <sct@redhat.com>

Hi,

On Fri, 2 Jul 1999 10:58:27 -0600 (MDT), Andreas Dilger
<adilger@enel.ucalgary.ca> said:

> I agree that reserving GDT blocks would be a small hack for v0 of ext2, but
> we could add a "COMPATIBLE" extension to v1 of ext2 that gave the number of
> GDT blocks reserved.  Also, since the v1 sparse superblock filesystems
> leave a gap between the structures, there should not be a real problem.
> We just have to make sure that we agree (for example) that all the blocks
> from the start of the group to the block bitmap are reserved for the GDT.
> This is not a big strech, since this is already how v0 ext2 filesystems are.

If you're going to be moving user data around anyway (and you have to be
able to do this for the shrink case anyway), then relocating the
inode/bitmap blocks is really not that much harder.

--Stephen
