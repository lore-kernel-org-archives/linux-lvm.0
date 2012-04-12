Message-ID: <4F86E6F8.3010101@redhat.com>
Date: Thu, 12 Apr 2012 15:30:16 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <605587411.361726.1334240064379.JavaMail.root@nelson.canoo.com>
In-Reply-To: <605587411.361726.1334240064379.JavaMail.root@nelson.canoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Hide volume group during startup
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Erik Schwalbe <erik.schwalbe@canoo.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/12/2012 03:14 PM, Erik Schwalbe wrote:
> Ok, I found a solution:
> 
> I deactivate the VG kvm_disk0 with vgchange -an kvm_disk0, after that I set the filter:
> 
> filter = [ "r|/dev/mapper/data-kvm_disk0|", "r|/dev/kvm_disk0|"]
> 
> without "a|.*|" !!!!

Shouldn't make any difference. The filter line has an implicit "a|.*|"
at the end. From the lvm.conf man page:

  "Devices that  don't  match  any patterns are accepted."

> Is my filter correct?? 

If it works for you then that's the main thing.

Just be aware that it will need adjustment if you add any more LVs that
need to be treated this way (that's why I prefer to accept the PVs I
need and reject everything else with a final "r|.*|").

Regards,
Bryn.
