Date: Tue, 13 Jun 2000 12:04:15 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] Question about order of drives in a logical volume
Message-ID: <20000613120415.A4115@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <D1EC4320087FD311895100902773F43CD33A2E@gsus.wineasy.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <D1EC4320087FD311895100902773F43CD33A2E@gsus.wineasy.se>; from h.jettingstad@wineasy.se on Tue, Jun 13, 2000 at 11:30:15AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: =?iso-8859-1?Q?H=E5kan_Jettingstad?= <h.jettingstad@wineasy.se>
Cc: linux-lvm@msede.com


Hi H�kan,

you can just rearange your drives like you plan to do.

In case you run vgscan and vgchange in your system startup file
anyway, you should be fine afterwards.

Regards,
Heinz

On Tue, Jun 13, 2000 at 11:30:15AM +0200, H�kan Jettingstad wrote:
> Hello,
> 
> I have a logical volume spanning across 8 SCSI harddrives, sda,sdb,...,sdh
> and I boot the system from an IDE drive. Now I need to add an extra scsi
> card and boot from a SCSI drive connected to that card. As I want to boot
> from the drive on the new SCSI card, the new SCSI card must be the first
> card in the bios scan and therefore the drive on the new card will be named
> sda by linux. So my question is: is this possible and if so, how do I (if
> needed) prepare the logical volume to span across sdb -> sdi instead of sda
> -> sdh? I don't dare to do to any testing on my own as I have important data
> on the logical volume. :)
> 
> Any help is highly appreciated as I'm rather new to both linux and LVM.
> 
> Best Regards,
> 
> H�kan Jettingstad
