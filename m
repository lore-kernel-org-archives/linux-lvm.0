Return-Path: <ragnark@stine.vestdata.no>
Date: Tue, 27 Feb 2001 21:35:17 +0100
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Possible to raise Max LV?
Message-ID: <20010227213517.G29642@vestdata.no>
References: <20010227132358.A24164@math.ohio-state.edu> <200102272022.f1RKMIk27598@webber.adilger.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200102272022.f1RKMIk27598@webber.adilger.net>; from Andreas Dilger on Tue, Feb 27, 2001 at 01:22:18PM -0700
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Feb 27, 2001 at 01:22:18PM -0700, Andreas Dilger wrote:
> Basically, the PE size is the minimum allocation unit of LVM.  If you
> make PE size very large, then you are generally wasting PE/2 disk space
> for each PV.  If (as in your case) the HW raid appears as a single large
> disk, then a large PE size may be appropriate, since you will only waste
> PE/2 once and it will still let you grow the LV to the current 2TB block
> device limit (kernel limit).

What about increesing the default, to say 32 MB?
32 MB should be enough for everyone (because of the 2TB limit), and 16
MB waste on every PV isn't that bad.



--=20
Ragnar Kj=EF=BF=BDrstad
Big Storage
