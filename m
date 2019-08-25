Mime-Version: 1.0
Message-Id: <684a4ace-8609-46ca-9c9a-f754ab9b92c8@www.fastmail.com>
In-Reply-To: <b17bea72-f9c3-9be6-c237-f56b8b446530@redhat.com>
References: <e11a2dbd-de9c-475f-bf6e-36cab78f7165@www.fastmail.com>
	<36c36310-1771-fed1-e208-3db7c0f9c768@redhat.com>
	<ee8820cc-8d2d-4503-afb1-9654e12745c4@www.fastmail.com>
	<b17bea72-f9c3-9be6-c237-f56b8b446530@redhat.com>
Date: Sat, 24 Aug 2019 22:13:38 -0400
From: "Dave Cohen" <linux-lvm@dave-cohen.com>
Subject: Re: [linux-lvm] repair pool with bad checksum in superblock
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
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>



On Fri, Aug 23, 2019, at 8:47 AM, Zdenek Kabelac wrote:
> Dne 23. 08. 19 v 13:40 Dave Cohen napsal(a):
> > 
> > 
> 
> > $ thin_check --version
> > 0.8.5
> 
> Hi
> 
> So if repairing fails even with the latest version - it's better to upload 
> metadata into BZ created here:
> 
> https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper
>

I've created https://bugzilla.redhat.com/show_bug.cgi?id=1745204

 
> >> If so  - feel free to open Bugzilla and upload your metadata so we can check
> >> what's going on there.
> >>
> >> In BZ provide also lvm2 metadata and the way how the error was reached.
> >>
> > 
> > When you say "upload your metadata" and "lvm2 metadata", can you tell me exactly how to get it?  Sorry for the basic question but I'm not sure what to run and what to upload.
> 
> 
> Upload 'dd' compressed copy of you ORIGINAL  _tmeta content (which now could 
> be likely already in volume  _meta0 - if you had one succesful run of --repair 
> command).
> 

Hmmm.  I'm not sure how to use `dd` for this.  If I'm missing something obvious, please let me know. Note, I cannot activate any portion of the pool.

> If you use older 'lvm2' you might have a problem with accessing _tmeta
> device content - if you have latest fc30 - you should be able
> to activate _tmeta as standalone component activation.
> 
> To get lvm2 metadata backup just use  'vgcfgbackup -f output.txt  VGNAME'

This succeeded, and I attached to the ticket.

> 
> Let us know if you have problem with getting kernel _tmeta or lvm2 meta.

As I wrote above, could not get the _tmeta.  If you're referring to a part of the pool, it does not activate via `lvchange -ay`


> 
> > In my case, lvm was set up by qubes-os, on a laptop.  The disk drive had a physical problem.  I'll put those details into bugzilla.  (But I'm waiting for answer to metadata question above before I submit ticket.)
> 
> Ok - serious disk error might lead to eventually irrepairable metadata content 
> - since if you lose some root b-tree node sequence it might be really hard
> to get something sensible  (it's the reason why the metadata should be located
> on some 'mirrored' device - since while there is lot of effort put into
> protection again software errors - it's hard to do something with hardware 
> error...

Exactly how to do this is still beyond me.  But I'm up for learning, and contributing it back to the qubes-os project.

-Dave
