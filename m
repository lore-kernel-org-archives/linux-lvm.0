Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Fri, 2 Feb 2001 10:30:49 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] with 2.4.1, should I use beta2 or beta3 lvm-tools?
Message-ID: <20010202103049.B872@66bassett.freeserve.co.uk>
References: <61DA682E8A5CD4119CD80050DA4E318B6933C4@josef.wineasy.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <61DA682E8A5CD4119CD80050DA4E318B6933C4@josef.wineasy.se>; from h.jettingstad@wineasy.se on Fri, Feb 02, 2001 at 11:15:25AM +0100
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

On Fri, Feb 02, 2001 at 11:15:25AM +0100, H=EF=BF=BDkan Jettingstad wrote:
> Hello!
>=20
> Just a quick question, kernel 2.4.1 contains lvm 0.9.1beta2, so I'm
> wondering do I have to use the beta2 lvm-tools or can I use the beta3
> lvm-tools with that kernel, or do I have to wait for a beta3 patch for the
> 2.4.1 kernel?

Please use the latest code if you can.  The LVM tar balls will build a
patch for your kernel.  If you don't want to patch your kernel
yourself then use the latest tools with 2.4.1, but you should probably
refrain from using snapshots.  We hope to make another release at the
beginning of next week (probably beta4).

- Joe
