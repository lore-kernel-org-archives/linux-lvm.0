Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1LBjIi16450
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 06:45:18 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1LBjHb08191
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 06:45:17 -0500
From: Luca Berra <bluca@comedia.it>
Message-ID: <20040221114515.GB31274@percy.comedia.it>
References: <20040107205326.GA14511@hamachi.dyndns.org> <pan.2004.02.18.14.55.50.11785@dutra.fastmail.fm> <20040219210805.GA576@hamachi.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040219210805.GA576@hamachi.dyndns.org>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re: 2.6.0: ext3 journal aborted with ext3/lvm/raid5
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb 21 06:44:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-raid@vger.kernel.org
Cc: linux-lvm@redhat.com

On Thu, Feb 19, 2004 at 01:08:05PM -0800, Steven Ihde wrote:
>On Wed, Feb 18, 2004 at 11:55:50AM -0300, Leandro Guimar=EF=BF=BDes Faria =
Corsetti Dutra wrote:
>> On Wed, 07 Jan 2004 12:53:26 -0800, Steven Ihde wrote:
>>=20
>> > I get "Aborting journal on device dm-x" and associated errors about ev=
ery
>> > week or two.  This is on a 2.6.0 kernel, ext3 filesystem running on lvm
>> > over md raid5.
>>=20
>> 	I've found a similar situation, have any fix came forth?
>
>Funny you should bring it up now.  When I posted back in January it
>was suggested that I verify my hardware/memory was OK and also try to
>reproduce the bug on 2.4.24.  So, I ran burnBX/burnMMX for a couple
>days, turned up no problems, did memtest86 overnight, also no
>problems, and then I switched to 2.4.24.

I have seen this as well, no problem on 2.4 + md (raid5) + lvm2,
about every night on 2.6.2

>I ran 2.4.24 (plus dm-1.00.07 for lvm2) for about 25 days and had no
>problems.  This seemed like reasonable evidence the problem doesn't
>exist (or takes longer to show up) in 2.4.24.  So then I switched to
>2.6.2 (that being the latest 2.6 kernel).  After about six days uptime
>on 2.6.2, I started seeing the problem again.
>
>Can anyone suggest what the next step is? =20

I believe it is another stacking problem, since there is no problem with
using only one of md and lvm2, but i have no idea how to get
more details on this. I also am an ext3 only user so i have no idea if
other fs are affected.

>Here are the latest entries from my syslog (this is 2.6.2).  As it
>usually does, this occurred early in the morning while the locatedb
>was being updated.
>
>Feb 14 06:12:44 hamachi kernel: EXT3-fs error (device dm-4): ext3_readdir:=
 bad entry in directory #5160995: rec_len is smaller than minimal - offset=
=3D0, inode=3D0, rec_len=3D0, name_len=3D0
>Feb 14 06:12:44 hamachi kernel: Aborting journal on device dm-4.
>Feb 14 06:12:45 hamachi kernel: ext3_abort called.
>Feb 14 06:12:45 hamachi kernel: EXT3-fs abort (device dm-4): ext3_journal_=
start: Detected aborted journal
>Feb 14 06:12:45 hamachi kernel: Remounting filesystem read-only
>Feb 14 06:13:56 hamachi kernel: EXT3-fs error (device dm-4) in start_trans=
action: Journal has aborted
>Feb 14 06:13:57 hamachi last message repeated 741 times

Regards,
L.

--=20
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
