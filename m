Message-ID: <3E342978.9020708@gallati.net>
From: Rene Gallati <lvm@gallati.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] disaster recovery
References: <3E3151C1.7070409@gallati.net>
In-Reply-To: <3E3151C1.7070409@gallati.net>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Jan 26 12:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Rene Gallati wrote:
> I'm wondering if I have all the tools required to attemp to recover the=20
> remaining data from the good drive?
[..]

Having recieved no answer I just stepped ahead and tried it in another=20
system I set up only for the recovery process. First I tried to patch a=20
stock SuSE 8.1 kernel (2.4.19-4GB) which failed as expected. Then I went=20
and fetched a vanilla 2.4.20 from my local kernel.org mirror - and that=20
failed miserably too !

Looked into device-mapper's directory structure and decieded to fetch a=20
2.4.19 vanilla which finally succeeded. You really might want to add=20
that information to device-mapper's README or INSTALL - especially since=20
  people who have hosed LV's are probably going to use LVM2 the most.

So out of the 4LVs that were in the VG, I could get out the data from=20
two smaller ones that were completely within the first still good disk.=20
However the other two I couldn't mount. One I did expect but the other=20
not. One out of those two LVs was spanning the disks, and the latter=20
disk is now gone for good. Anyone knows a nice trick to get reiserfs=20
allowing me to mount that LV anyway and get out what's left ?

Or am I completely lost there?

Thanks for all answers in advance.

CU

Ren=EF=BF=BD

btw. recovering from hd failure is really cool when they turn off your=20
net connectivity because of some MS-SQL worm... :-/
