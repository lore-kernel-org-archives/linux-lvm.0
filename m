Message-ID: <3E40245C.8030808@ednet.ns.ca>
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] New lv cannot span pv's
References: <200302041927.44619.stefan.nilsen@wale.dyndns.dk> <3E4006F9.9080100@ednet.ns.ca> <200302041953.23662.stefan.nilsen@wale.dyndns.dk>
In-Reply-To: <200302041953.23662.stefan.nilsen@wale.dyndns.dk>
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
Date: Tue Feb  4 14:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Does

lvcreate -ntest -l1383 vgdata


work ?



Stefan Nilsen wrote:
> On Tuesday 04 February 2003 19.31, Patrick Boutilier wrote:
> 
>>What does vgdisplay show?
> 
> 
> wale:~ # vgdisplay
> --- Volume group ---
> VG Name               vgdata
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                7
> Open LV               7
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               33.31 GB
> PE Size               4 MB
> Total PE              8527
> Alloc PE / Size       7144 / 27.91 GB
> Free  PE / Size       1383 / 5.40 GB
> VG UUID               hTrW0U-F9mz-tjQN-re4H-G5df-rjP0-9HucNn
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
