Message-ID: <3BF965DF.E8AD8BE5@gmx.net>
From: "Lars O. Grobe" <grobe@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 3Ware [OT] (was: Logical Volume max-size?)
References: <Pine.LNX.4.33.0111191335570.1679-100000@dragon.inside.ntisys.com>
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
Date: Mon Nov 19 13:02:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Benjamin!

Benjamin Scott wrote:

> On Mon, 19 Nov 2001, Goetz Bock wrote:
> > I figured this out the hard way. I asked some 3ware person whether I
> > could use a 6800 as a RAID5 controller and was told, that it would work
> > fine.

We use this here with Linux and RAID5. In fact, we first installed the
newest firmware, which is necessary AFAIK with RAID5. And you shouldn't
expect too much speed, RAID5-writing is not very fast with this IDE
RAID. As the IDE-array is only the backup of our SCSI-fileserver, we are
not to worried about write-speed here (we use rsync, so only changes are
written to the array - and in case that we have to restore, the
read-performance is good).

CU, Lars.
