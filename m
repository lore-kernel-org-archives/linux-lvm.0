From: neuron <neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Initialize disk on /dev/nda
Message-Id: <20040119185105.1fe06371@souldaemon>
In-Reply-To: <Pine.LNX.4.44.0401191838340.3041-100000@nymfe07.fi.muni.cz>
References: <Pine.LNX.4.44.0401191838340.3041-100000@nymfe07.fi.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Jan 19 12:52:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

try /dev/nda/0

same with loopback, cant create on /dev/loopX but can create on /dev/loop/X

> Hello,
> I have problem with pvcreate on network block device disk (/dev/nda). 
> When I run
> 
> # pvcreate /dev/nda
>   /dev/nda: Couldn't find device.
> 
> Device /dev/nda is OK, because Iam able to create ext3 file system on it.
> 
> 
> # mkfs.ext3 /dev/nda
> mke2fs 1.27 (8-Mar-2002)
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 4120704 inodes, 8232588 blocks
> 411629 blocks (5.00%) reserved for the super user
> ...
> ...
> 
> I am running LVM2 on Debian with 2.4.22 kernel.
> Have anyone know what I doing wrong?
> Thank You, Marek Jan 
> PS I am very sorry of my really BAD english :-).
> MJ
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
