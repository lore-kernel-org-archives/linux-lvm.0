Message-ID: <4F40C82E.6040508@redhat.com>
Date: Sun, 19 Feb 2012 11:00:14 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F405E1B.5030609@shiftmail.org>
In-Reply-To: <4F405E1B.5030609@shiftmail.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-devel] DM / LVM hangs if snapshot present on
	kernel v3.0.3
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Cc: linux-lvm@redhat.com, Spelic <spelic@shiftmail.org>

Dne 19.2.2012 03:27, Spelic napsal(a):
> Hello lists,
> 
> Do you have any information about a bug in linux v3.0.3, of LVM snapshot
> making a mess at (clean!) reboot?

Well, your report is unfortunatelly missing a lot of basic information.

So please try to open proper lvm2 bugzilla at bugzilla.redhat.com.
If you are not a Fedora user - pick just fedora system.

We need to know your OS name and version.
Version of the lvm2 tools package.

Preferable metadata backup (vgcfgbackup)

And '-vvvv' trace from hanging command.

> 
> Symptoms are: message at boot:
>     [   15.668799] device-mapper: table: 252:3: snapshot: Snapshot cow pairing
> for exception table handover failed
>     [   15.668934] device-mapper: ioctl: error adding target to table
>     [   19.388627] device-mapper: table: 252:3: snapshot: Snapshot cow pairing
> for exception table handover failed
>     [   19.388786] device-mapper: ioctl: error adding target to table
> 

I guess you activation command (vgchange -ay) should be giving you some error
messages - try to use  -vvvv and attach to bugzilla.

(Just lvchange -ay -vvvv vgVM/lvVM_TP1_d1)

> and then the volume origin and snapshot come out inactive
>         lvVM_TP1_d1 vgVM   owc-i- 500.00g
>         ...
>         tp1d1-snap1 vgVM   swi-i- 600.00g lvVM_TP1_d1 100.00      (*)
> (other volumes not having snapshot are active and working)
> 
> (*) please note the size occupied in the snapshot is WRONG, it should be 4.56%
> and not 100%.
> 
> At this point I did:
> 
> # lvchange --refresh vgVM/tp1d1-snap1
> Couldn't find snapshot origin uuid
> LVM-WUPTe8bqp25OSeRsFcLpC228A6U0r84T22tfFj4EkWbuB6pP5UDTA7nVRfGSCZW7-real.
> # lvs
> ... *everything hangs* ..!!

Note - you cannot manipulate individual snapshots - with old (non-thin)
snapshot you always work with all snapshots and its origin at the same time.

Zdenek
