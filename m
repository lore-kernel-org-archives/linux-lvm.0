Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i42M8Vv13919
	for <linux-lvm@redhat.com>; Sun, 2 May 2004 18:08:31 -0400
Received: from smtp010.tiscali.dk (smtp010.tiscali.dk [212.54.64.103])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i42M8U99026272
	for <linux-lvm@redhat.com>; Sun, 2 May 2004 18:08:30 -0400
Received: from sneakemail.com (62.79.51.144.adsl.noe.tiscali.dk [62.79.51.144])
	by smtp010.tiscali.dk (8.12.10/8.12.10) with ESMTP id i42M8Sul024068
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 00:08:28 +0200 (MEST)
Message-ID: <4095715C.3000900@sneakemail.com>
Date: Mon, 03 May 2004 00:08:28 +0200
From: =?ISO-8859-1?Q?Peter_Valdemar_M=F8rch?= <swp5jhu02@sneakemail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.6 upgrade - LVM version ? & root partition access
	problems...
References: <408C2883.5080606@sneakemail.com>
	<20040426135853.GA17309@null.msp.redhat.com>
In-Reply-To: <20040426135853.GA17309@null.msp.redhat.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

AJ Lewis alewis-at-redhat.com |Lists| wrote:
> Someone made a new initrd creation script and posted it here:
> http://www.poochiereds.net/svn/lvm2/
> I can't guarentee it'll work, but i've heard good things about it.  Use it
> against the 2.6.5 kernel you compiled.

Well, I did finally did get it to work. Quite a strenuous road, though.=20
For others that may google later, here are some of the things I ran=20
into, and their solutions:

1) There was no console. The script created /dev/consoleonly, but I had=20
& needed /dev/console.

2) "No space left on device" The initrd ran out of inodes during=20
creation. Presumably because MKDEV on my system creates very, very many=20
items for /dev (2601 /dev/tty* and 1728 /dev/sd* for instance)


3) MKDEV takes a -d option on my RH9 system telling it where to put the=20
files. Instead, the script cd-ed to the directory and expected them to=20
be put in ./

4) fsck.ext3 failed during boot. I discovered that adding " fastboot" as=20
a parameter to the kernel allowed me to get past that point and still=20
end up in a 2.6.5 kernel, so I could run "lvm vgmknodes" that apparently=20
created what I needed, so that I could get past the fsck hurdle, even=20
without " fastboot". (Took me a while to figure *that* one out! :-D)

I've created a new version (incl. svn diff) of the script here:
http://wwww.morch.com/postings/lvm2/

Sincerely,

Peter

--=20
Peter Valdemar M=EF=BF=BDrch
http://www.morch.com
