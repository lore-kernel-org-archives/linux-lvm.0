From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] offtopic but ...
Message-ID: <1266960000.1021300755@[192.168.200.4]>
In-Reply-To: <20020513073733.B31182@connectlive.com>
References: <064b01c1f69a$71b9c100$070414ac@Home.PIN.LU>
 <94260000.1020868034@[192.168.200.4]>
 <20020513123901.D12633@azrael.smilehouse.com>
 <20020513094350.GB864@tykepenguin.com>
 <20020513073733.B31182@connectlive.com>
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
Date: Mon May 13 09:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Tim <tim@connectlive.com>

> Incremental backups are orthogonal to true high availability, but you're
> guaranteed to have low availability if you have no disaster recovery
> plans.  I wish there were a more succinct way to express that!

How about:

    "Don't tempt Murphy."

    "Lack of planning is a disaster in itself."

    "0 to the 10th equals nothing at all"

(the last from Jethro Tull if you handn't seen it before).


But this depends on the environment. In a number of the
data warehouses I've worked on there simply would not be
time to restore the data from archival media. The best
they can do is make the "high" approach 100% and live with
it. There will be a relatively small set of archival storage
that can be brought on line, but there is no way that
restoring data from archival media is an acceptable recovery
plan in these cases ("Sorry, General, we can't respond to
that nuclear bomb comming in: it'll take us at least 3 more
hours to recover from these tapes." Think banker, heavy
industrial plant and you have the same situation).

The good news is that today's near-term storage hardware
(from fiber scsi cards down to the disks) will handle
anything short of a nuclear blast without failing miserably.
This leaves "full availability" systems as a viable alternative
in many cases.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
