From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] offtopic but ...
Message-ID: <1263110000.1021300134@[192.168.200.4]>
In-Reply-To: <20020513123901.D12633@azrael.smilehouse.com>
References: <Pine.LNX.4.33.0205081213340.3518-100000@diablo.unixag-zw.fh-kl.d
  <064b01c1f69a$71b9c100$070414ac@Home.PIN.LU>
 <94260000.1020868034@[192.168.200.4]>
 <20020513123901.D12633@azrael.smilehouse.com>
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
Date: Mon May 13 09:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Harri Haataja <harri.haataja@smilehouse.com>

> On Wed, May 08, 2002 at 09:27:14AM -0500, Steven Lembark wrote:
>> You are not going to get reliability on multi-drive sytems without
>> SOME sort of redundancy. Either back the data up offline (e.g., to
>> tape, another disk or CD) or use RAID. If you really find the cost
>                             ^^
>
> For the nth time, RAID is no substitute for backups :)

Depends on the size of a system. If you have too much
(e.g.,NASA has roughly a PetaByte on line at any time) of
data there is no effective way to back it up and restore
it. The only way to keep it on line is RAID1+0 or RAID5+1
and hope to hell you can fix any hardware problems before
they kill you. Even if you kept all the info on line there
simply wouldn't be time to restore any of it before people
needed the stuff.

Banks are a good example of this: they have huge amounts
of data and simply cannot afford downtime. Every minute
their boxes are offline they loose millions. Net result
is that they use multiple centers with multiple computers
with multiple EMC systems with multiple volumes RAID-ed
across multiple sets of duplicated drives connected by
multiple controllers across multiple lans and heartbeat
systems monitoring each of them.

For a few tens of millions you can avoid tapes too :-)

In this case I should have been clearer about backups vs.
archival storage. Archiving data to tape is a wonderful
thing but won't help you if hardware fails and you need
quick access to the system. If the high-speed stuff fails
you may be able to get by with CD Jukes or
older, slower disk systems that have the most-used data
or data marts on them. The daily update cycle burns a set
of CD's that contain the most recent storage units that
are used if the high-speed storage fries.

This is a bit different from having to archive the data
for recovery purposes in that backup online storage is
in an immediately restorable format.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
