From: "^YosH^" <yosh@liquidzone.net>
Subject: RE: [linux-lvm] Need to remove broken hdd, and need to move the stuff i can from the broken disk
Message-ID: <000001c3541f$2bed30b0$0296a8c0@malin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20030726194327.GF14273@fib011235813.fsnet.co.uk>
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
Date: Sun Jul 27 04:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Yes, pvmove tells me I don=92t have enough free extents... isn=92t there =
any
command for like forcing to move as much as possible of the data to
other disks... if not, its worth a feature request... is there any way
to find out what data is on the disk I need to replace?=20

-----Ursprungligt meddelande-----
Fr=E5n: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
F=F6r Joe Thornber
Skickat: den 26 juli 2003 21:43
Till: linux-lvm@sistina.com
=C4mne: Re: [linux-lvm] Need to remove broken hdd, and need to move the
stuff i can from the broken disk

On Sat, Jul 26, 2003 at 09:31:04PM +0200, ^YosH^ wrote:
> Hi, I have a bit of a problem, I have just bought a new 250 GB disk
and
> I have put it into my lvm, but now it seems to be broken so I need to
> replace it. But I have data on it that I need to save. I don't know
how
> much of the disk is used by data and I don't know how much is free on
> the other disks.

Have you looked at pvmove ?

- Joe

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
