Subject: Re: [linux-lvm] LVM Mirroring
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <49EED685.6020403@redhat.com>
References: <753673.52190.qm@web8320.mail.in.yahoo.com>
	<49EED685.6020403@redhat.com>
Date: Wed, 22 Apr 2009 11:18:30 +0100
Message-Id: <1240395510.4484.321.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: senthilkumar_vc@yahoo.co.in

On Wed, 2009-04-22 at 10:34 +0200, Marian Csontos wrote:
> LVM Mirroring is SW implementation of RAID1, thus no, it is not possible.

I think the poster is asking if it's possible to have mirrored LVM
volumes without using an external software or hardware RAID solution
like MD or a hardware RAID controller.

As you point out, LVM2 includes RAID1 (mirroring) so the poster should
be able to do what they want.

Regards,
Bryn.
