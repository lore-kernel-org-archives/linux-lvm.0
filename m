Mime-Version: 1.0
Message-Id: <ee8820cc-8d2d-4503-afb1-9654e12745c4@www.fastmail.com>
In-Reply-To: <36c36310-1771-fed1-e208-3db7c0f9c768@redhat.com>
References: <e11a2dbd-de9c-475f-bf6e-36cab78f7165@www.fastmail.com>
	<36c36310-1771-fed1-e208-3db7c0f9c768@redhat.com>
Date: Fri, 23 Aug 2019 07:40:14 -0400
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



On Fri, Aug 23, 2019, at 4:59 AM, Zdenek Kabelac wrote:
> Dne 23. 08. 19 v 2:18 Dave Cohen napsal(a):
> > I've read some old posts on this group, which give me some hope that I might recover a failed drive.  But I'm not well-versed in LVM, so details of what I've read are going over my head.
> > 
> > My problems started when my laptop failed to shut down properly, and afterwards booted only to dracut emergency shell.  I've since attempted to rescue the bad drive, using `ddrescue`.  That tool reported 99.99% of the drive rescued, but so far I'm unable to access the LVM data.
> > 
> > Decrypting the copy I made with `ddrescue` gives me /dev/mapper/encrypted_rescue, but I can't activate the LVM data that is there.  I get these errors:
> > 
> > $ sudo lvconvert --repair qubes_dom0/pool00
> >    WARNING: Not using lvmetad because of repair.
> >    WARNING: Disabling lvmetad cache for repair command.
> > bad checksum in superblock, wanted 823063976
> >    Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed (status:1). Manual repair required!
> > 
> > $ sudo thin_check /dev/mapper/encrypted_rescue
> > examining superblock
> >    superblock is corrupt
> >      bad checksum in superblock, wanted 636045691
> > 
> > (Note the two command return different "wanted" values.  Are there two superblocks?)
> > 
> > I found a post, several years old, written by Ming-Hung Tsai, which describes restoring a broken superblock.  I'll show that post below, along with my questions, because I'm missing some of the knowledge necessary.
> > 
> > I would greatly appreciate any help!
> 
> 
> I think it's important to know the version of thin tools ?
> 
> Are you using  0.8.5 ?

I had been using "0.7.6-4.fc30" (provided by fedora).  Upon seeing your email, I built tag "v0.8.5", but the results from `lvconvert` and `thin_check` commands are identical to what I wrote above.

$ thin_check --version
0.8.5

> 
> If so  - feel free to open Bugzilla and upload your metadata so we can check 
> what's going on there.
> 
> In BZ provide also lvm2 metadata and the way how the error was reached.
> 

When you say "upload your metadata" and "lvm2 metadata", can you tell me exactly how to get it?  Sorry for the basic question but I'm not sure what to run and what to upload.

> Out typical error we see with thin-pool usage is  'doubled' activation.
> So thin-pool gets acticated on 2 host in parallel (usually unwantedly) - and 
> when this happens and 2 pools are updating same metadata - it gets damaged.

In my case, lvm was set up by qubes-os, on a laptop.  The disk drive had a physical problem.  I'll put those details into bugzilla.  (But I'm waiting for answer to metadata question above before I submit ticket.)

Thanks for your help!

-Dave

> 
> Regards
> 
> Zdenek
>
