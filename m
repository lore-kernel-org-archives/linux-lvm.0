Message-ID: <1058913244.3f1dbbdca4242@webmail.phys.unsw.edu.au>
From: Melinda Taylor <melinda@phys.unsw.edu.au>
Subject: Re: [linux-lvm] LVM1 problem, exported volumegroup with one dead drive (fwd)
References: <Pine.LNX.4.56.0307221242540.30328@gumpie.wea.se>
In-Reply-To: <Pine.LNX.4.56.0307221242540.30328@gumpie.wea.se>
MIME-Version: 1.0
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
Date: Tue Jul 22 17:35:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, ratler@lunar-linux.org

Hi Stefan,

I am working through the exact same scenario so you may like to look thro=
ugh my
posts and peoples advice in the LVM archive (july):=20

http://lists.sistina.com/pipermail/linux-lvm/2003-July/subject.html

Basically I had 2 disks fail which were part of my VG. I now have 2 of 4 =
LV's
left and am trying to retrieve the data. As suggested the only way to rec=
over
data from a partial VG is to upgrade to LVM2.=20

I have done that and LVM2 can now activate my partial VG - but I haven't =
quite
retrieved the data from it yet.

Hope that helps,

Melinda


Quoting ratler@lunar-linux.org:

> Hi,
>=20
> I think I have tried all solutions google could give me without any luc=
k
> restoring any data.
>=20
> The problem is the following:
>=20
> 1. I had to reinstall a server to where this volumegroup belonged
> 2. I umounted all LVs. And deactivated the VG. And then I did a vgexpor=
t
> of the VG
> 3. After the reinstall of the linux server it was time to import the VG
> that had 2 harddrives. I ran a pvscan and it only detected one drive! I
> started some investigation and i noticed the second drive was totaly de=
ad!
>=20
>=20
> And of course since this was a server at my home I didnt have any backu=
ps
> of this VG. And since one drive is missing it's impossible to import th=
e
> part of the VG I have left. I know that most of all PEs for my /home
> are on the drive that is still working.
>=20
> Now I wonder how on earth can I restore any of the data that is still o=
n
> my working drive? I had 4 years of mail and some source code I would di=
e
> for to get back. Since I only have metadata from the only drive working=
 I
> think I have a little problem ;)
> All I want is to get as much of the data out from datavg/homelv.
>=20
> I attached a log file with the output from pvscan and pvdata.
>=20
> Sincerely
> Stefan Wold
