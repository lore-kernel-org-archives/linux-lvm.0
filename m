From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <671160000.1021077884@[192.168.200.4]>
In-Reply-To: <1021071171.17474.44.camel@UberGeek>
References: <20020510072608.GA1001@tykepenguin.com>
 <1021071171.17474.44.camel@UberGeek>
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
Date: Fri May 10 19:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Austin Gonyou <austin@coremetrics.com>

>> From what I understand you *can* mount the LVM volumes on multiple hosts

> at the same time, but you should be *readonly* on the hosts which do not
> *own* the data on the disks. You could then *remount* the volume on the
> target failover host.

I've had reasonable luck with this approach on other
platforms (HP-UX, but the LVM is similar enough that
it should work).

All it really needs is a "heartbeatd": you open a
socket to, say, echo (port 1) and every second write
a byte. If you don't get the byte back in, say, 100ms
then you try one more time before re-mounting the LV
rw on the backup host.

This can all be done w/ sockets in perl with about
20 lines of code. If both hosts monitor each other
then either monitor can scream for help.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
