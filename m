Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p57H2CFe013521
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 13:02:12 -0400
Received: from mail-yi0-f46.google.com (mail-yi0-f46.google.com
	[209.85.218.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p57H2BqE029221
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 13:02:11 -0400
Received: by yie30 with SMTP id 30so1432913yie.33
	for <linux-lvm@redhat.com>; Tue, 07 Jun 2011 10:02:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1106071133440.12374@bmsred.bmsi.com>
References: <BANLkTi=O_ua2rMCA3Cs4tvvExzjo5cxBOg@mail.gmail.com>
	<alpine.LRH.2.00.1106070822200.11302@bmsred.bmsi.com>
	<BANLkTikGwknQ7r5P76UqifeCeFRkaX=G=g@mail.gmail.com>
	<alpine.LRH.2.00.1106071124130.12374@bmsred.bmsi.com>
	<alpine.LRH.2.00.1106071133440.12374@bmsred.bmsi.com>
From: Misc Things <formisc@gmail.com>
Date: Tue, 7 Jun 2011 13:01:31 -0400
Message-ID: <BANLkTike3yibRbLfyKhfDThUMyesBDKMnQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Installation fails if VG is exported
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jun 7, 2011 at 11:38 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Tue, 7 Jun 2011, Stuart D. Gathman wrote:
> ...
> I get it - you wanted to prevent your OS experimentation from activating and
> possibly writing over your VG. �I can understand why vgexport seemed like
> a solution, but it only prevents activation and removes references from
> local LVM configuration (and prevents booting when that depends on the VG as
> you discovered).
>
> It doesn't prevent a rogue/buggy OS from scribbling on the disks. �So,
> physically disconnecting (or powering off) the disks is the best way
> to prevent that.

Right you are. i think i should reconsider my point of view - indeed
if i'm that paranoid i should eliminate any chances of losing data -
disconnect the dirve(s) is the best solution for this.

And then, i think, that the question is more relevant to anaconda
mailing group.support then to LVM group. Since it's anaconda that
tries to activate the VG.
Thank you Stuart!
Andrew
