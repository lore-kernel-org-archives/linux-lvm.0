Date: Thu, 12 Apr 2012 16:50:02 +0200 (CEST)
From: Erik Schwalbe <erik.schwalbe@canoo.com>
Message-ID: <245186210.362567.1334242202575.JavaMail.root@nelson.canoo.com>
In-Reply-To: <4F86E6F8.3010101@redhat.com>
MIME-Version: 1.0
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
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Thank you very much for your help.

Regards,
Erik

----- Original Message -----
From: "Bryn M. Reeves" <bmr@redhat.com>
To: "Erik Schwalbe" <erik.schwalbe@canoo.com>
Cc: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Thursday, 12 April, 2012 4:30:16 PM
Subject: Re: [linux-lvm] Hide volume group during startup

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
