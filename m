From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Disc crash, want to recover some data... PLEASE
 HELP!
Message-ID: <164870000.1041274454@[192.168.200.4]>
In-Reply-To: <20021230183728.GA18131@localhost>
References: <20021230024410.GA32395@barbabok.barbanet.com>
 <20021230183728.GA18131@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Mon Dec 30 12:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>

> On Monday, 30 December 2002, at 03:44:10 +0100,
> Olof Aldin wrote:
>
>> I have 3 hard drives in a few PVs in one VG, and one of the hard drives
>> (IBM 75 GXP, 46GB) crashed today... It can't be read at all or even
>> detected by my BIOS. When I connect it to the IDE bus no discs on that
>> interface are found at all...
>>
> Maybe off-topic here, but these IBM hard drives seem to be defective, and
> have effective MTBF (Mean Time Between Failures) that low, that perhaps
> this drive won't be the last to crash in short time.
>
> If I am not wrong, there are several places that document these
> problems, as well as similar ones with some Fujitsu's hard drives. Just
> in case, search the Internet and replace your disk before they crash.
>
> Hope my off-topic helps.

That or use RAID underneath LVM for your storage. Using
hardware RAID5 with a reasonable chunk size gives nice
performance and allows you to generate LV's without having
to worry about which PV they are on.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
