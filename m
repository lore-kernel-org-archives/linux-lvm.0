From: Michal Kurowski <michal@cmdik.pan.pl>
Message-ID: <20020712170641.A28217@medres>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] using vgcfgrestore with promise ataraid
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
Date: Fri Jul 12 10:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I'd like to ask you for help restoring my lvm configuration.
It might be trivial but I just could not find detailed info in existing
docs.

I've had a security issue in here and I was forced to remove all my
"system" data (on not-lvm disks).

Now I'd like to bring my system back - I also have a RAID0 setup
(ataraid drivers) with lvm-1.0.3.

I'm just not sure why vgdisplay is not able to find my volume group.

I successfully used vgcfgrestore ("/etc" entries are ok) and I have
appropriate devices in "/dev" ("/dev/ataraid/d0" namely).

Any hints ?

--=20
Micha=B3 Kurowski			=09
Administrator=20
www.cmdik.pan.pl
<michal@cmdik.pan.pl>
