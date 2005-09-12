Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8C8gQV17202
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 04:42:26 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.207])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8C8gJvE005059
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 04:42:19 -0400
Received: by wproxy.gmail.com with SMTP id i25so1703533wra
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 01:42:14 -0700 (PDT)
Message-ID: <95bbd19050912014220e457b@mail.gmail.com>
Date: Mon, 12 Sep 2005 16:42:13 +0800
From: Bear Wolf <sportbear@gmail.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
In-Reply-To: <20050912080543.GD25756@barkeeper1.linbit>
Mime-Version: 1.0
Content-Disposition: inline
References: <95bbd190509111934b306235@mail.gmail.com>
	<20050912080543.GD25756@barkeeper1.linbit>
Content-Transfer-Encoding: 8bit
Reply-To: sportbear@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Dear Lars

I tried but not work,
the process is still hang when I trying to copy some data in source
volume or do sync command after create the 4rd snapshot volume.

should I patch the 8 and 9 of dm module?
ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-rc2/2.6.12-rc2-udm1/

I saw that some discuss in previous mail-list

SportBear

2005/9/12, Lars Ellenberg <Lars.Ellenberg@linbit.com>:
> / 2005-09-12 10:34:15 +0800
> \ Bear Wolf:
> > Dear all
> >
> > I test snapshot function on my system.
> > when I create the first snapshot, everything works fine.
> > then I create more snapshot, everything works fine too.
> > but when I access the source volume and do sync
> > the sync command will be dead.
> >
> > and I test with a script file
> >
> > I=0
> > for I in 1 2 3 4 5 6 7 8 9
> > do
> > cp -af /etc /mnt/volume1
> > lvcreate -s -L 64 -n snaplv${I} /dev/VG01/volume1
> > sleep 1
> > done
> >
> > after create the 4th sn apshot volume, the system process hang without
> > any error message.
> 
> lvcreate calls into device mapper.
> it suspends the affected targets, changes "tables", creates new targets,
> and resumes the targets again.
> 
> if it fails to create the new targets, or fails to adjust the "tables",
> 
> then it unfortunately aborts, leaving the existing targets in suspended
> state. I think that is a bug.
> 
> to get the system working (sort of) again, you could try to
> for d in /dev/mapper/* ; do
>        [[ $d == control ]] && continue
>        dmsetup resume $d &
>                       # ^^^ important! background it!
> done
> 
> background it, because if you "resume" some target that depends on some
> other target in suspended state, it will hang and wait for that other
> target to be resumed... doh.
> 
> worked for me... (well, to get the system back, at least).
> 
> see also dmsetup ls, dmsetup info, dmsetp table etc.
> 
> cheers,
> 
> --
> : Lars Ellenberg                                  Tel +43-1-8178292-0  :
> : LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
> : Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
