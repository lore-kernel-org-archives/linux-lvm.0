References: <CAFrnvh2ffR69QFK-Ue=OStbiSuKw+sRx43+PyEdwo8sFqkfcMw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55F92427.2070908@redhat.com>
Date: Wed, 16 Sep 2015 10:11:19 +0200
MIME-Version: 1.0
In-Reply-To: <CAFrnvh2ffR69QFK-Ue=OStbiSuKw+sRx43+PyEdwo8sFqkfcMw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm metadata sequence number reverts
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: aaron.young@ctl.io

Dne 15.9.2015 v 23:18 Aaron Young napsal(a):
> Hello, I'm deep into debugging an issue we have with a disk driver of ours and
> LVM.
>
> Long story short:
>
> create vg -> seqno 1
> create lv1 -> seqno 2
> create lv2 -> seqno 3
> create lv3 -> seqno 4
> create lv4 -> seqno 5
> <clear our device cache> (note, this generates no IO)
> vgdisplay: seqno = 4, lv4 is missing
>
> * This happens only after dozens to hundreds of iterations. Most of the time
> it is fine.
>
> I dd all the metadata blocks off of the pv, yep, seqno5 is on disk metadata
> area perfectly fine. But the system believes 4 is the current version.
> Shouldn't the system be using the highest value? Or is it stored somewhere?
> What mechanism is responsible for changing the seqno? And where does it change
> it? (Not the metadata contents, just the number)


Hi

Your email is quite 'mystic' - I'd need lots of crystal balls to see your 
surrounding conditions.


1.) Is this 'clustered' environment or a  'single' host setup ?

2.) Do you have 'archive' backup enabled  - can you check what are last 
operations in history before problem happens?

3.) Are you using 'lvmetad' ? (if so, try  use_lvmetad=0 )

4.) Kernel version,  lvm2  version ?

5.) Was there any lvm2 command error  ?
(as vgdisplay may just do a backup of most recent metadata in case they are 
are missing after some command failure)

Zdenek
