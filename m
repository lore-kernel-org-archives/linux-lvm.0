From: bscott@ntisys.com
Subject: Re: [linux-lvm] Recovering from a disaster...
In-Reply-To: <5.1.0.14.1.20021206103437.01e5cb68@204.151.72.2>
Message-ID: <Pine.LNX.4.44.0212061842370.13951-100000@dragon.inside.ntisys.com>
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
Date: Fri Dec  6 17:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 6 Dec 2002, at 11:38am, mats@laplaza.org wrote:
>> Until Intel-based systems have a usable bios don't put your
>> root/boot volume on LVM. Since the BIOS will not be upgraded
>> until at least three weeks after pigs floss I'd strongly
>> suggest avoiding the pratice altogether.
> 
> Ahem, to fuss a bit, the BIOS is a lodestone that comes with the *PC*
> architecture.

  And to fuss a bit more, "the BIOS" is an outdated term.  Most systems do
not have a single "BIOS" anymore; they have multiple components, each with
their own "BIOS".  These various "BIOSes" are just firmware; they contain
what is needed to run the device and bootstrap the OS (plus a ton of legacy
code leftover from the days of MS-DOS and floppy-only systems).

  Server-class systems built on the x86-compatible "PC" design now have many
(but not all) of the firmware features previously only found in propriatary
systems from Sun, SGI, etc.

> Someday we'll even see PC-class machines without a BIOS.

  Perhaps I misunderstand, but how does one boot without a BIOS?

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
