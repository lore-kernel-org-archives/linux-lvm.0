From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] offtopic but ...
Message-ID: <1288440000.1021303821@[192.168.200.4]>
In-Reply-To: <Pine.LNX.4.44.0205131053020.6095-100000@dragon.inside.ntisys.com>
References: <Pine.LNX.4.44.0205131053020.6095-100000@dragon.inside.ntisys.co
 m>
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
Date: Mon May 13 10:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Benjamin Scott <bscott@ntisys.com>

>   Offline backups are for disaster recovery, not availability.  I think
> you're trying to say that, but the point is getting confused.  The
> difference between a small office's and a large bank's disaster recovery
> plans is the difference between their definitions of "disaster".  A small
> office probably considers a hard drive failure or OS corruption a
> "disaster".  A bank thinks more along the lines of "multiple terrorist
> attacks".

Actually they are more concerned about data corruption
and audits. The hardend offline facilities are about
being able to compare known data to what's online or
meet gov't requirements for audit background. Their rule
for designing systems is that any one box can get nuked
without bringing the whole thing down.

This is why I've gotten into the habit of differentiating
archival storage from backup systems. In most warehousing
systems people mean "redundant" when they say "backup" (e.g.,
"a backup power system") and "archival" or "offline" for
slow storage used to recover from data failures.

Aside: most places have plenty of ways to deal with hardware
failure. Unless they hire consultants, most never even think
about how they'll handle data corruption. Hmmm... how about
"You're not paranoid, the boxes ARE out to get you" as a
slogan?

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
