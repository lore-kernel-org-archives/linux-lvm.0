From: Gerald Catling <geraldcc@optusnet.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200305241444.35851.geraldcc@optusnet.com.au>
Subject: [linux-lvm] SuSE 8.1 and LVM
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
Date: Fri May 23 23:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi once again from oz

Date: Wed, 14 May 2003 09:04:56 +0100
From: Joe Thornber <thornber@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM resizing
Reply-To: linux-lvm@sistina.com

On Wed, May 14, 2003 at 08:13:46AM +0000, Gerald Catling wrote:
> Istallation went well.
> However resizing goes verry badly and the article implies it is possibl=
e to=20
> grow and shrink  --- usr,home and data partitions.

You will have to resize the filesystem as well.

For shrinking:

i) shrink the fs
ii) lvreduce

For growing:

i) lvextend
ii) grow the fs

- Joe

Thank you Joe, but you info did not work.

All i can get is a non-booting system as a result of trying to resize=20
partitions.

The article in LINUXPRO  May 2003 page 15 implies that /home /var /usr an=
d /=20
can be resized. Is this just wishful thinking?

My system replies to such resizing attempts by saying I need to unmount t=
he=20
partitions first.

FAT chance of that. Anyone tried to umnount / recently?

Once again any info will be tried and greatfully received.

Gerald
