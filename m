Return-Path: <thornber@btconnect.com>
Date: Wed, 18 Jul 2001 11:59:43 +0100
Subject: Re: [linux-lvm] what happens when hdX get hdY in a VG
Message-ID: <20010718115943.A712@btconnect.com>
References: <5.0.2.1.2.20010718114553.00a30b40@193.0.0.208> <Pine.LNX.4.30.0107181226430.17377-100000@diablo.unixag-zw.fh-kl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0107181226430.17377-100000@diablo.unixag-zw.fh-kl.de>; from jovi@unixag-zw.fh-kl.de on Wed, Jul 18, 2001 at 12:48:09PM +0200
From: Joe Thornber <thornber@btconnect.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 18, 2001 at 12:48:09PM +0200, Oliver Jovic wrote:
> Hi, :-)
> 
> well what happens when i have a VG build out of /dev/hd[e-h]1 (4
> harddrives) and build in now a additional IDE controller and 4
> additional harddrives and this new IDE controller wants these
> driverletters now, so /dev/hde gets /dev/hdi and so on? Will a vgscan
> in the startupscripts detect the right drives anyways due to the headers
> of each harddisk and build the VG/LV as it was before just with different
> driveletters?
> 
> If not, what do i need to do? Havent found much info about it, but well
> must be also be honest, hadnt much time to look for it. ;-/ Sorry if
> somebody asked this already.

vgscan should do the right thing.

- Joe
