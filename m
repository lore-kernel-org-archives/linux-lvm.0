Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] SoftRaid and LVM
Date: Tue, 4 Sep 2001 17:46:09 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FD71@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I don't understand what you mean!
Your request is offtopic. You ask for help on a thread not related to
you...
But on the thread there :
<http://lists.sistina.com/pipermail/linux-lvm/2001-September/008611.html
> you already got help from many!

What do you mean and want exactly???
-jec

> -----Original Message-----
> From: svetljo [mailto:galia@st-peter.stw.uni-erlangen.de]=20
> Sent: mardi, 4. septembre 2001 17:03
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] SoftRaid and LVM
>=20
>=20
> Hei why does nobody try to help me
>=20
> [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2=20
> reiserfs?)=20
> <http://lists.sistina.com/pipermail/linux-lvm/2001-September/0
08611.html>

i've done pretty much trys and almost nobody seems to wont to help me am
i invisable

svetljo

Ray Miller wrote:

>On Tue, Sep 04, 2001 at 04:35:40PM +0200, Jean-Eric Cuendet wrote:
>
>>Hi,
>>It seems that you use a fresh 2.4.9 kernel. In kernel 2.4.9, the=20
>>version of LVM is 0.9.0-beta2, which is what you get with dmesg or cat

>>/proc/lvm Then you installed tools from 1.0.1rc2. You must upgrade=20
>>your kernel with LVM 1.0.1rc2 if you want all that to be consistent=20
>>(or use beta2 tools, which is not the good way IMHO).
>>
>>Recompile 2.4.9 with LVM-1.0.1rc2 and you'll be OK.
>>
>
>I applied the 1.0.1-rc2 patch to a clean 2.4.9 kernel tree and was able

>to create a logical volume on top of s/w RAID 1 without any trouble.=20
>However, a bonnie++ run on an ext2 (or ext3) filesystem on the logical=20
>volume caused the system to lock up, with kswapd going uninterruptible.

>I suspect a VM (rather than LVM) problem, as a similar lock-up occurred

>on another system with 2.4.8 kernel and no LVM. We've reverted to=20
>kernel 2.4.7 on both systems and had no problems since.
>




_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
