From: "^YosH^" <yosh@liquidzone.net>
Subject: SV: [linux-lvm] Need to remove broken hdd, and need to move the stuff i can from the broken disk
Message-ID: <000101c35487$0092ba80$0296a8c0@malin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20030727123229.GH14273@fib011235813.fsnet.co.uk>
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
Date: Sun Jul 27 16:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Seems I don=92t have that backup dir, don=92t even have a /etc/lvm =
dir...
I have tried to shrink the fs but the drive seems to hang the system
when I reach the bad blocks. Since I use ext3 I cant "cut" the fs off
like I would be able to do with like reiserFS... anyone have any ideas
of what to do ?
I have been trying to move stuff of the lvm too to free som space, but
the drive hangs everytime there is a dir that=92s located on the crashed
disk...

It would be great with some handeling of crashed drives... some fault
tolerance...=20


-----Ursprungligt meddelande-----
Fr=E5n: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
F=F6r Joe Thornber
Skickat: den 27 juli 2003 14:32
Till: linux-lvm@sistina.com
=C4mne: Re: [linux-lvm] Need to remove broken hdd, and need to move the
stuff i can from the broken disk

On Sun, Jul 27, 2003 at 11:12:10AM +0200, ^YosH^ wrote:
> Yes, pvmove tells me I don?t have enough free extents... isn?t there
any
> command for like forcing to move as much as possible of the data to
> other disks... if not, its worth a feature request... is there any way
> to find out what data is on the disk I need to replace?=20

I'm sure Alasdair could tell you a way to find out using the lvs
command.  I tend to just look at /etc/lvm/backup/<vg name>.  Send this
file to me (off list) if you have trouble interpreting it.  You'll
probably want to shrink the fs/volume that is on the bad pv before
doing the move.

- Joe

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
