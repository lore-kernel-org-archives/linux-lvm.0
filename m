Date: Sun, 14 Oct 2001 16:18:48 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Problem with LVM over RAID-1
Message-ID: <20011014161848.B890@dardhal.mired.net>
References: <m2u1x238a1.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m2u1x238a1.fsf@isnogud.escape.de>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Sunday, 14 October 2001, at 11:01:10 +0200,
Urs Thuermann wrote:

> This problem has occrued on this mailing list before by another user
> but I haven't read a solution to it here.
> [...]
> Another question on Linux-Software RAID-1:  We want to use it to get
> more reliability by mirroring.  But I'd like to know if the Linux
> kernel will also make use of both disks to increase the read
> performance, i.e. when reading a large file, read some parts from one
> disk, other parts from the other disk.  Or when accessing two files,
> read one file from one disk and the other file from the second disk.
> Will the Linux kernel do this?
> 
As far as I remember, Linux software RAID-1 implementation indeed uses all
of the drives in parallel to increase read performance (at least, on 2.2.x
an 2.4.x kernels). As read on Software-RAID-HOWTO (2.3. The RAID levels):

    * Write performance is the slightly worse than on a single device,
	* because identical copies of the data written must be sent to every
	* disk in the array. Read performance is usually pretty bad because of
	* an oversimplified read-balancing strategy in the RAID code. However,
	* there has been implemented a much improved read-balancing strategy,
	* which might be available for the Linux-2.2 RAID patches (ask on the
	* linux-kernel list), and which will most likely be in the standard
	* 2.4 kernel RAID support.

So, to be sure, you should build a RAID-1 array with your current kernel
and test read performance, and compare results with those for a single
drive (use bonnie, for example). Maybe in the linux-raid mailing list
archives is something interesting:
http://www.mail-archive.com/linux-raid%40vger.kernel.org

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian Linux Woody (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
