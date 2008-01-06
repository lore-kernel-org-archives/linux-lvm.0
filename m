Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0617Ddk024418
	for <linux-lvm@redhat.com>; Sat, 5 Jan 2008 20:07:13 -0500
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.177])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0616qnj016350
	for <linux-lvm@redhat.com>; Sat, 5 Jan 2008 20:06:52 -0500
Received: by py-out-1112.google.com with SMTP id a29so10345387pyi.0
	for <linux-lvm@redhat.com>; Sat, 05 Jan 2008 17:06:52 -0800 (PST)
Message-ID: <a9b19e850801051706o567d9244tb07b55f8f7877c21@mail.gmail.com>
Date: Sun, 6 Jan 2008 02:06:52 +0100
From: Hiamal <hiamall@gmail.com>
Subject: Re: [linux-lvm] Crashed disk with LVM
In-Reply-To: <477DEC64.6050108@sandbox.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a9b19e850712270618p16d62ae9w7200be49ebe74386@mail.gmail.com>
	<477DEC64.6050108@sandbox.cz>
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

Hi,


On Jan 4, 2008 9:20 AM, PeS <pes@sandbox.cz> wrote:
>
> Hiamal wrote:
> > Hi,
> >
> > I have tow disks(hda and hdb) where tow partitions(hda2 and hdb1) a
> > part of one LVM group VG01.
> > Now disk hdb has crashed and I'am trying to save the data on hdb1 to
> > another disk.
> > I tried with knoppix dumping(dd) hda2(works) and hdb1(don't work) and
> > I also tried activating the lvm group and dd the lvm volume but when
> > dd comes to hdb1 the disk just hacks and sounds noisy :-P
>
> Instead of dd try dd_rescue. It's able to skip errors on failed disc and
> read the rest.
>
> > What should I do?
>
> During dumping, prepare you regular backup plan ;-)

That was my backup server...

Anyway I solved the prob running ddrescue from a LiveCD dumping the
recovered data to a file on a new disk. It took
 ca 4 days for ddrescue to do the jobb. After that I had to mounted
the dumped file, activated the LVM vol's and was abel to recover
almost all the data.


/h
