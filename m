Subject: Re: [linux-lvm] LVM available on software raid5 (md)
References: <000901c1b6fe$42c2dde0$0700000a@eagle7>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: "Anthony Luke Nelson"'s
    message of
    "Sat, 16 Feb 2002 10:26:09 -0500"
Message-Id: <ufazo26emqi.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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
Date: Mon Feb 18 11:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "ALN" == Anthony Luke Nelson <tony.nelson@pobox.com> writes:

ALN> I was messing with SUSE 7.3 and in their LVM control
ALN> panel, it only seemed to suport linear or striping.

LVM itself can do striping or concatenation of PVs, but Linux has a
complete software RAID system and it will do RAID5 just fine.  Build a
RAID array and run pvcreate on it.  The Software-RAID-HOWTO has some
useful info on building the array.

 - J<
