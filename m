Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i78E03a30501
	for <linux-lvm@redhat.com>; Sun, 8 Aug 2004 10:00:03 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.192])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i78E03e1003672
	for <linux-lvm@redhat.com>; Sun, 8 Aug 2004 10:00:03 -0400
Received: by mproxy.gmail.com with SMTP id 76so83209rnl
	for <linux-lvm@redhat.com>; Sun, 08 Aug 2004 07:00:03 -0700 (PDT)
Message-ID: <115936e9040808070017d55355@mail.gmail.com>
Date: Sun, 8 Aug 2004 09:00:02 -0500
From: BK Box <gondoi@gmail.com>
Subject: Re: [linux-lvm] pvmove problem
In-Reply-To: <20040807115431.A17768@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <115936e9040807092135ccc2be@mail.gmail.com>
	<20040807115431.A17768@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 7 Aug 2004 11:54:31 -0500, Alasdair G Kergon <agk@redhat.com> wrote:
> On Sat, Aug 07, 2004 at 11:21:12AM -0500, BK Box wrote:
> > I have a pretty lengthy explanation.. so i'll just post the link to it.
> > http://forums.gentoo.org/viewtopic.php?t=206391
> 
> Summary: How do I pvmove data with LVM2 if contiguous runs of
> PEs in the source LVs will have to be split up to make them fit?
> 
> Quick answer:
> LVM2 doesn't support this directly yet: it's being worked on.
> Until it's done you need to edit the metadata [using vgcfg*]
> to split the segments into smaller ones before running pvmove.
> [Might also need to recompile disabling section merging code
> which would undo your splitting.]
> 
> Alasdair
> --
> agk@redhat.com
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

Thank you very much, I'm glad I finally got an answer.

I have another question for you now...

All I seem to have is vgcfgrestore and vgcfgbackup.. but by reading
the man pages I don't see how they edit the metadata.  Is there
another vgcfg that I am missing?

Thank you
