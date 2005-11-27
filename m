Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jARC9TV09465
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 07:09:29 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jARC9I78000412
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 07:09:24 -0500
Received: by wproxy.gmail.com with SMTP id 69so1525429wra
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 04:09:18 -0800 (PST)
Message-ID: <80d985600511270409q6fadc509p151530b7e1083482@mail.gmail.com>
Date: Sun, 27 Nov 2005 21:09:18 +0900
From: Craig Hagerman <craighagerman@gmail.com>
Subject: Re: [linux-lvm] One of 8 PVs dead - Trying to rescue data from
	remaining 7
In-Reply-To: <438881B0.4040000@cox.net>
MIME-Version: 1.0
Content-Disposition: inline
References: <4365F0AC.3090909@oxtel.com>
	<80d985600511252130j37b17586i9dd1649a958622ba@mail.gmail.com>
	<438881B0.4040000@cox.net>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 11/27/05, Old Fart <rascal.jumper-747@cox.net> wrote:
> Craig Hagerman wrote:
> > On 10/31/05, Tom Robinson <tom.robinson@oxtel.com> wrote:
> >>
> I use raid 5 just for this problem.  Have dropped 2 of the 3 raid
> devices and system keeps on truckin'.  You can hot add devices back in
> and keep going while they sync.  Good luck.
>

Yeah, this would work with 3 discs, but doesn't answer the general
question about recovering data from a single LVM drive. In my 2 drive
system it wouldn't work. Any other ideas? I would assume that if one
drive failed it should be trivial to be able to access the information
on the remaining drive. If not, then I would be a lot safer going back
to a non-LVM system using the two drives as distinct partitions.

Craig
